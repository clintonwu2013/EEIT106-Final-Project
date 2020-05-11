<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-TW">
<head>
<!-- <link rel="stylesheet" href="css/createActivity.css"> -->
<link href="css/jquery.datetimepicker.min.css" rel="stylesheet">
<script src="js/jquery.js"></script>
<script src="js/jquery.datetimepicker.full.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAFK6EYVIlIfJyyi7VjmQso2A74zekdPQ0&libraries=places&callback=init"
        async defer></script>
<script src="js/googlemap.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>發起活動</title>
<style>
	#map{
		border:1px solid blue;
	}
	
	html,body{
		height: 100%;
		width: 100%;
	}
</style>

</head>

<body>
	<h2>發起活動</h2>
	<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd hh:mm");
	Date d = new Date();
	String now = sdf.format(d);
	%>
	
	<form action="<c:url value="/ActivityServlet.controller"/>"
		method="post" enctype="multipart/form-data" onkeydown="if(event.keyCode==13)return false;">
		<table>
			<tr>
				<td>活動名稱</td>
				<td><input name="aname" type="text" value="${param.aname}"></td>
			</tr>
			<tr>
				<td>活動類型</td>
				<td><select name="atype">
						<option value="運動">運動</option>
						<option value="電影">電影</option>
						<option value="聚餐">聚餐</option>
						<option value="研討會">研討會</option>
				</select></td>
			</tr>
			<tr>
				<td>開始時間</td>
				<td><input id="begin" type="text" name="beginTime"
					value="<%out.print(now);%>"></td>
				<%-- 					${param.beginTime} --%>
			</tr>
			<tr>
				<td>結束時間</td>
				<td><input id="end" type="text" name="endTime"
					value="<%out.print(now);%>"></td>
				<%-- 					${param.endTime} --%>
			</tr>
			<tr>
				<td>報名截止時間</td>
				<td><input id="limit" type="text" name="attendLimitTime"
					value="<%out.print(now);%>"></td>
				<%-- 					${param.attendLimitTime} --%>
			</tr>
			<tr>
				<td>活動地點</td>
				<td><input id="pac-input"  class="controls" type="text" 
						placeholder="尋找地點..." ></td>
			</tr>
			</table>
			
			<div style="height:480px;width:640px" id="map"></div>

			<table>
			<tr>
				<td>活動地址</td>
				<td><input type="text" id="addr" name="address" size="45" 
					value="${param.address}"></td>
			</tr>
			<tr>
<!-- 				<td>lat</td> -->
				<td><input type="hidden" id="lat" name="lat" size="30"></td>
			</tr>
			<tr>
<!-- 				<td>lng</td> -->
				<td><input type="hidden" id="lng" name="lng" size="30"></td>
			</tr>
			<tr>
				<td>活動內容</td>
				<td><textarea rows="10" cols="50" name="acontent" placeholder="請輸入活動內容:"></textarea></td>
			</tr>
			<tr>
				<td>人數上限</td>
				<td><input type="number" name="peopleUplimit"
					value="${param.peopleUplimit}" min="1" max="30" step="1"></td>
				<td>${errorMsg.peopleUplimit}</td>
			</tr>
			<tr>
				<td>費用</td>
				<td><input type="number" name="cost" value="${param.cost}"
					min="0" max="2000"></td>
				<td>${errorMsg.cost}</td>
			</tr>
			<tr>
				<td>活動圖片</td>
				<td><input type="file" name="photo"></td>
			</tr>
			<tr>
				<td><input type="image" src="images/bell.PNG" name="press" value="建立活動666666"></td>
				<td><input type="submit" name="press" value="建立活動"></td>
				<td><input type="reset" value="清除"></td>
			</tr>
		</table>
	</form>

	
	<script>
		$("#begin").datetimepicker(
				{
					step : 30,
					onShow : function(ct) {
						this.setOptions({
							maxDate : jQuery('#end').val() ? jQuery('#end')
									.val() : false
						})
					}
				});
		$("#end").datetimepicker(
				{
					step : 30,
					theme : "dark",
					onShow : function(ct) {
						this.setOptions({
							minDate : jQuery('#begin').val() ? jQuery('#begin')
									.val() : false
						})
					}
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
	</script>
	<a href="<c:url value="/index.jsp"/>">回首頁</a>
</body>

</html>