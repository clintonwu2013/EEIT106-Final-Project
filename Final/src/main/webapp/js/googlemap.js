var map, infoWindow, marker;
        var markers = [];

        function init() {//載入地圖
            var tw = { lat: 23.973875, lng: 120.982024 };
            var lat, lng;
            //地圖
            map = new google.maps.Map(document.getElementById('map'), {
            	
                center: tw,
                zoom: 14,
                mapTypeId: 'roadmap',
                mapTypeControl: false
            });
            //指標
            marker = new google.maps.Marker({
                map: map
            });
            //訊息框
            infoWindow = new google.maps.InfoWindow;

            //定位目前所在位置
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(function (position) {
                    var pos = {
                        lat: position.coords.latitude,
                        lng: position.coords.longitude
                    };
                    marker.setPosition(pos);
                    marker.setTitle("目前位置");
                    markers.push(marker);
                    map.setCenter(pos);
                }, function () {
                    handleLocationError(true, infoWindow, map.getCenter());
                });
            } else {
                // 無法定位
                handleLocationError(false, infoWindow, map.getCenter());
            }

            //拖拉指標回傳座標地址
            // google.maps.event.addListener(marker, 'dragend', function () {
            //     lat = marker.getPosition().lat();
            //     lng = marker.getPosition().lng();
            //     $("#lat").val(lat);
            //     $("#lng").val(lng);
            //     markers.push(marker);

            //     var geocoder = new google.maps.Geocoder();
            //     geocoder.geocode({ 'latLng': marker.getPosition() }, function (results, status) {
            //         if (status == google.maps.GeocoderStatus.OK) {
            //             address = results[0].formatted_address;
            //             $('#addr').val(results[0].formatted_address);
            //         }
            //         else {
            //             alert('此位置無法定址');
            //         }

            //         // infoWindow = new google.maps.InfoWindow({
            //         //     content: address
            //         // });
            //         // infoWindow.open(map, marker);
            //     });
            // });

            // 點地圖加標籤
            google.maps.event.addListener(map, 'click', function (event) {
                //清除標籤
                markers.forEach(function (marker) {
                    marker.setMap(null);
                });
                markers = [];
                addMarker(event.latLng, map);
            });

            // 搜尋框
            var input = document.getElementById('pac-input');
            var searchBox = new google.maps.places.SearchBox(input);
            // map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
            // Bias the SearchBox results towards current map's viewport.
            map.addListener('bounds_changed', function () {
                searchBox.setBounds(map.getBounds());
            });

            searchBox.addListener('places_changed', function () {
                var places = searchBox.getPlaces();
                console.log(places);
                if (places.length == 0) {
                    return;
                }
                // 清除指標
                markers.forEach(function (marker) {
                    marker.setMap(null);
                });
                markers = [];

                // 給每個搜尋地點指標資訊
                var bounds = new google.maps.LatLngBounds();
                places.forEach(function (place) {
                    if (!place.geometry) {
                        console.log("Returned place contains no geometry");
                        return;
                    }
                    var icon = {
                        url: place.icon,
                        size: new google.maps.Size(71, 71),
                        origin: new google.maps.Point(0, 0),
                        anchor: new google.maps.Point(17, 34),
                        scaledSize: new google.maps.Size(25, 25)
                    };

                    // Create a marker for each place.
                    markers.push(new google.maps.Marker({
                        map: map,
                        title: place.name,
                        position: place.geometry.location,
//                        icon: icon
                    }));
                   
                    if (place.geometry.viewport) {
                        // Only geocodes have viewport.
                        bounds.union(place.geometry.viewport);
                    } else {
                        bounds.extend(place.geometry.location);
                    }
                });
                map.fitBounds(bounds);
                google.maps.event.addListener(marker, 'click', function () {
                    markerInfo(marker);
                });
            });
          
            // marker.addListener('click', function () {
            //    markerInfo(marker);
            // });
        }

        function handleLocationError(browserHasGeolocation, infoWindow, pos) {
            infoWindow.setPosition(pos);
            infoWindow.setContent(browserHasGeolocation ?
                '錯誤: 無法定位!' :
                '錯誤: 此瀏覽器不支援定位服務!');
            infoWindow.open(map);
        }

        function addMarker(location, map) {
            // Add the marker at the clicked location
            marker = new google.maps.Marker({
                position: location,
                map: map
            });
            markerInfo(marker);
        }

        function markerInfo(marker){
            lat = marker.getPosition().lat();
            lng = marker.getPosition().lng();
            $("#lat").val(lat);
            $("#lng").val(lng);
            markers.push(marker);
            var geocoder = new google.maps.Geocoder();
            geocoder.geocode({ 'latLng': marker.getPosition() }, function (results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    address = results[0].formatted_address;
                    $('#addr').val(results[0].formatted_address);
                }
                else {
                    alert('此位置無法定址');
                }

//                var infoWindow = new google.maps.InfoWindow({
//                    content: address
//                });
//                infoWindow.open(map, marker);
            });
        }