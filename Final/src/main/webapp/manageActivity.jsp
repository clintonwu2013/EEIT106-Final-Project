<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>活動管理</title>
</head>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<!-- <script src="https://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script> -->
<link href="css/jquery.datetimepicker.min.css" rel="stylesheet">
<script src="js/jquery.js"></script>
<script src="js/jquery.datetimepicker.full.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css" />
<link rel="stylesheet" href="http://jqueryui.com/resources/demos/style.css">



<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAFK6EYVIlIfJyyi7VjmQso2A74zekdPQ0&libraries=places&callback=init"
        async defer></script>
<script src="js/googlemap.js"></script>

<script type="text/javascript">

	
	function readURL(input) {

		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#blah').attr('src', e.target.result);
			}

			reader.readAsDataURL(input.files[0]);
		}
	}

	$("#img").change(function() {
		readURL(this);
	});
	
	
	function checkPeople(){
		
	}
	function   checkSubmit1(id) 
	{ 
// 		alert(id);
		var checkNo= ${availablePeople}- id;
// 		alert(checkNo);
		if(confirm('確定同意嗎?') ){
			if(checkNo<0 ){
				alert("超過人數上限!!!")
				return false;
			}
			
			return true;
			}
	
		return false;
		 
	} 
	
	function   checkSubmit2(id) 
	{ 
// 		alert(id);
		var checkNo= ${availablePeople};
// 		alert(checkNo);
		if(confirm('確定拒絕嗎?') ){
			if(checkNo<0 ){
				alert("超過人數上限!!!")
				return false;
			}
			
			return true;
			}
	
		return false;
		 
	}
	
	function checkSubmit3() 
	{ 

		if(confirm('確定踢除嗎?') ){
			
			return true;
			}
	
		return false;
		 
	}
	
	function checkSubmit4() 
	{ 

		if(confirm('確定嗎?') ){
			
			return true;
			}
	
		return false;
		 
	}
</script>
<body>

	<a href="<c:url value="/getManageActivity?aId=${aId}"></c:url>">
	<button >修改活動內容</button>
	</a>
	
	<a href="<c:url value="/getUncensoredAttendants?aId=${aId}"></c:url>">
	<button >報名申請名單</button>
	</a>
	
	<a href="<c:url value="/getAgreedAttendants?aId=${aId}"></c:url>">
	<button >參加人名單</button>
	</a>
	
	<a href="<c:url value="/getAttendancy?aId=${aId}"></c:url>">
	<button >管理參加人出席</button>
	</a>

<c:if test="${not empty activity }">

	
	<br>
	
	<form action="<c:url value="/updateActivityAll"></c:url>" enctype="multipart/form-data" method="post">

		<input type="hidden" name="aid" value="${activity.aid }"> 
		活動名稱: <input type="text" name="aname" value="${activity.aname }"> 
		按讚人數: ${activity.good }<br>
		<input type="hidden" name="good" value="${activity.good }"> 
		活動類型: <input type="text" name="atype" value="${activity.atype }"> 
		
		設定活動狀態: 
		<select name="status">
			<option value="成團"
				<c:if test="${activity.status=='成團' }">selected</c:if>>成團</option>
			<option value="尚未成團"
				<c:if test="${activity.status=='尚未成團' }">selected</c:if>>尚未成團</option>
			<option value="流團"
				<c:if test="${activity.status=='流團' }">selected</c:if>>流團</option>
		</select>
		
		開始時間: <input id='begin' name="beginTime" type="text" value="<fmt:formatDate value="${activity.beginTime}" pattern="yyyy/MM/dd HH:mm"/>">
		
		結束時間: <input id='end' name="endTime" type="text" value="<fmt:formatDate value="${activity.endTime}" pattern="yyyy/MM/dd HH:mm"/>"><br>

		活動內容: <input type="text" name="acontent" value="${activity.acontent}"><br>

		活動地點: <input type="text" id="pac-input" name="address" value="${activity.address}"><br>
		
		
<!-- 		<input id="pac-input"  class="controls" type="text"  -->
<!-- 						placeholder="尋找地點..." > -->
			
		<div style="height:200px;width:300px" id="map"></div>
			
		目前人數: ${activity.accessPeople} 
		人數上限: <input name="peopleUplimit" type="text" value="${activity.peopleUplimit}"><br> 
		修改活動圖片: <input name="photo" type='file' accept='image/*' onchange='openFile(event)'><br>


		<img id="output" src="/Final/showImg/${activity.aid}"><br>
		
		<input type="submit" value="確定修改" onclick="return checkSubmit4()">
	</form>

</c:if>




<c:if test="${not empty UncensoredAttendants }">
<br>
人數限制: ${peopleUplimit} <br>
尚可加入: ${availablePeople} <br>
<table>
<tr>
<td>頭像</td>
<td>名稱</td>
<td>報名人數</td>
<td>審核</td>

</tr>



<c:forEach var="UncensoredAttendant" items="${ UncensoredAttendants}">

<tr>
<td>
<img  style="width:20px; height:20px" src="<c:url value="/${UncensoredAttendant.member.email}/showMemberImg"></c:url>">
</td>
<td>${ UncensoredAttendant.member.mname}</td>
<td>${ UncensoredAttendant.companion}</td>
<td>
<%-- <a href="updateAttendantStatus?aId=${aId}&attendantId=${UncensoredAttendant.attendantId}&status=同意"><button>同意</button></a> --%>
<%-- <a href="updateAttendantStatus?aId=${aId}&attendantId=${UncensoredAttendant.attendantId}&status=拒絕"><button>拒絕</button></a> --%>

<form action="<c:url value="/updateAttendantStatus"></c:url>" method="get">
<input name="aId" value="${aId}" type="hidden">
<input name="attendantId" value="${UncensoredAttendant.attendantId}" type="hidden">
<input id="${UncensoredAttendant.companion}" class="status" name="status" type="submit" value="同意"   onclick="return checkSubmit1(this.id); ">
<input id="${UncensoredAttendant.companion}" class="status" name="status" type="submit" value="拒絕" onclick="return checkSubmit2(this.id);">
</form>

</td>
</tr>



</c:forEach>
</table>

</c:if>

<c:if test="${not empty agreedAttendants }">
<br>
目前人數: ${accessPeople }

<table>
<tr>
<td>頭像</td>
<td>名稱</td>
<td>報名人數</td>
<td>踢除</td>

</tr>



<c:forEach var="agreedAttendant" items="${ agreedAttendants}">


<tr>
<td><img  style="width:20px; height:20px" src="<c:url value="/${agreedAttendant.member.email}/showMemberImg"></c:url>"></td>
<td>${agreedAttendant.member.mname}</td>
<td>${agreedAttendant.companion}</td>
<td>
<form action="<c:url value="/deleteAgreedAttendant"></c:url>" method="get">
<input name="aId" value="${aId}" type="hidden">
<input name="attendantId" value="${agreedAttendant.attendantId}" type="hidden">
<input id="${agreedAttendant.attendantId}" type="submit" value="剔除" onclick="return checkSubmit3();">
</form>
</td>
</tr>



</c:forEach>
</table>

</c:if>



<c:if test="${not empty AttendantsForAttendancy }">
<br>
目前人數: ${accessPeople }

<table>
<tr>
<td>頭像</td>
<td>名稱</td>
<td>報名人數</td>
<td>出席狀況</td>
<td>點名</td>
</tr>
<c:forEach var="agreedAttendant" items="${ AttendantsForAttendancy}">


<tr>
<td><img  style="width:20px; height:20px" src="<c:url value="/${agreedAttendant.member.email}/showMemberImg"></c:url>"></td>
<td>${agreedAttendant.member.mname}</td>
<td>${agreedAttendant.companion}</td>
<td>${agreedAttendant.attendency}</td>
<td>
<form action="<c:url value="/manageAttendency"></c:url>" method="get">
<input name="aId" value="${aId}" type="hidden">
<input name="attendantId" value="${agreedAttendant.attendantId}" type="hidden">
<input id="${agreedAttendant.attendantId}" name="attendency" type="submit" value="出席" onclick="return checkSubmit4();">
<input id="${agreedAttendant.attendantId}" name="attendency" type="submit" value="未出席" onclick="return checkSubmit4();">
</form>
</td>
</tr>



</c:forEach>
</table>

</c:if>
	<script>
		$("#begin").datetimepicker(
				{
					step : 30
					
				});
		$("#end").datetimepicker(
				{
					step : 30
					
					
					});
		$("#limit").datetimepicker(
				{
					step : 30,
					theme : "dark",
					onShow : function(ct) {
						this.setOptions({
							maxDate : jQuery('#begin').val() ? jQuery('#begin')
									.val() : false
						})
					}
				});
		$.datetimepicker.setLocale('zh-TW');
		jQuery('#datetimepicker').datetimepicker(
				{
					i18n : {
						months : [ '一月', '二月', '三月', '四月', '五月', '六月', '七月',
								'八月', '九月', '十月', '十一月', '十二月', ],
						dayOfWeek : [ "日", "一", "二", "三", "四", "五", "六", ]
					},
					timepicker : false,
					format : 'd.m.Y'
				});

		var openFile = function(event) {
			var input = event.target;
			var reader = new FileReader();
			reader.onload = function() {
				var dataURL = reader.result;
				var output = document.getElementById('output');
				output.src = dataURL;
			};
			reader.readAsDataURL(input.files[0]);
		};
	</script>
</body>
</html>