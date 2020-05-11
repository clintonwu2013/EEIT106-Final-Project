<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>後臺首頁</title>
<style>
#banner {
	background-image: url("images/cat.jpg");
	background-repeat: no-repeat;
	/* background-position: center; */
	background-size: 100%;
	/* background-color: blueviolet; */
	/* height: 200px; */
	height: 500px;
	width: 100%;
	opacity: 0;
	/* position: obsolute; */
	/* background: rgb(255, 0, 0); */
	transition: opacity 2s;
	/* animation: showup 5s;  */
}

/* Make the image fully responsive */
.carousel-inner img {
	width: 100px;
	height: auto;
}

.left {
	width: 330px;
	height: 350px;
	background-color: #F5F5F5;
	margin-left: 10%;
	margin-top: 20px;
	float: left;
}

.right {
	width: 60%;
	height: 800px;
	background-color: #F5F5F5;
	margin-top: 20px;
	margin-left: 530px;
}
</style>
</head>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>


<script src="https://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css" />
<link rel="stylesheet"
	href="http://jqueryui.com/resources/demos/style.css">



<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
	window.onload = function() {
		var box = document.getElementById("banner");
		box.style.opacity = 1;
	}

	function showId(e) {
		$("#" + e.id).html("已經下架")
		$("#" + e.id).attr("class", "btn btn-warning")

		var aid = e.id;

		var Json = {
			"aId" : aid,
			"permission" : "不通過"
		};
		$.ajax({
			url : "/Final/updateActivity",
			type : "post",
			dataType : "json",
			data : Json,
			success : function(data) {
				console.log("ok");
			},
			error : function() {
				alert("ajax failed")
			}
		})
	}

	$(function() {
		//設定中文語系
		$.datepicker.regional['zh-TW'] = {
			dayNames : [ "星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六" ],
			dayNamesMin : [ "日", "一", "二", "三", "四", "五", "六" ],
			monthNames : [ "一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月",
					"九月", "十月", "十一月", "十二月" ],
			monthNamesShort : [ "一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月",
					"九月", "十月", "十一月", "十二月" ],
			prevText : "上月",
			nextText : "次月",
			weekHeader : "週"
		};
		//將預設語系設定為中文
		$.datepicker.setDefaults($.datepicker.regional["zh-TW"]);
		//套用到表單
		$("#inputDate").datepicker({
			dateFormat : 'yy-mm-dd',
			changeYear : true,
			changeMonth : true,

		});
	});
</script>
<body>
	<jsp:include page="backstageHead.jsp"></jsp:include>



	<div id="banner"></div>



	<div class="left">
		<Form action="<c:url value="/findActivityByTypes"/>" method="post">

			<div class="form-group">
				<label>找類型:</label> <select name="selectType" class="form-control">

					<option value="通過">正在線上</option>
					<option value="不通過">已下架</option>
				</select>
			</div>
			<div class="form-group">
				<label for="beginTime">找時間:</label> <input type="text"
					readonly="true" name="inputDate" id="inputDate" placeholder="日期"
					class="form-control">
			</div>
			<input type="submit" name="search" value="搜尋" class="btn btn-primary">
		</Form>

	</div>

<div id="right" class="right">
	<c:if test="${empty alreadyPress}">
	<sql:query var="select" dataSource="jdbc/final">
    select *  from activity join member on activity.email=member.email where activity.permission='通過' order by beginTime desc;
	</sql:query>
		
			<h2>目前上線活動</h2>
			<c:forEach var="row" items="${select.rows}">
				<div class="card"
					style="max-width: 90%; max-height: 50%; border: 1px solid #e0e0e0;">
					<div class="row no-gutters">
						<div class="col-md-5" style="height: 200px;">
							<img style="height: 100%"
								src='${pageContext.request.contextPath}/showImg/${row.aid}'
								class="card-img-top h-100" alt="...">
						</div>
						<div class="col-md-7">
							<div class="card-body">
								<h5 class="card-title ">
									<a
										href="<c:url value="/getManageActivity?aId=${row.aid }"></c:url>">${row.aname}</a>
								</h5>

								<p style="float: right;" class="card-text">類型 ${row.atype}</p>

								<p class="card-text">主辦人 ${row.mname}</p>
								<p class="card-text">
									開始時間
									<fmt:formatDate value="${row.beginTime}"
										pattern="yyyy/MM/dd  HH:mm" />
								</p>
								<p class="card-text">
									<a data-toggle="modal" data-target="#addr${row.aid}"> <img
										alt="" src="images/maps.png" style="width: 25px">
									</a> <small class="text-muted">${row.address}</small>
								</p>
								<a
									href="<c:url value="/getManageActivity?aId=${row.aid }"></c:url>"
									class="btn btn-primary">詳細內容..</a>
								<button onclick="showId(this)" id="${row.aid }"
									class="btn btn-danger">緊急下架</button>
							</div>

						</div>
					</div>
				</div>
			</c:forEach>
		
	</c:if>
	
	
	<h2>找到共:${fn:length(ActivitiesByTypes)}筆</h2>
	<c:if test="${not empty ActivitiesByTypes}">
	
		
			
			
			<c:forEach var="row" items="${ActivitiesByTypes}">
				<div class="card"
					style="max-width: 90%; max-height: 50%; border: 1px solid #e0e0e0;">
					<div class="row no-gutters">
						<div class="col-md-5" style="height: 200px;">
							<img style="height: 100%"
								src='${pageContext.request.contextPath}/showImg/${row.aid}'
								class="card-img-top h-100" alt="...">
						</div>
						<div class="col-md-7">
							<div class="card-body">
								<h5 class="card-title ">
									<a
										href="<c:url value="/getManageActivity?aId=${row.aid }"></c:url>">${row.aname}</a>
								</h5>

								<p style="float: right;" class="card-text">類型 ${row.atype}</p>

								<p class="card-text">主辦人 ${row.member.mname}</p>
								<p class="card-text">
									開始時間
									<fmt:formatDate value="${row.beginTime}"
										pattern="yyyy/MM/dd  HH:mm" />
								</p>
								<p class="card-text">
									<a data-toggle="modal" data-target="#addr${row.aid}"> <img
										alt="" src="images/maps.png" style="width: 25px">
									</a> <small class="text-muted">${row.address}</small>
								</p>
								<a
									href="<c:url value="/getManageActivity?aId=${row.aid }"></c:url>"
									class="btn btn-primary">詳細內容..</a>
								<button onclick="showId(this)" id="${row.aid }"
									class="btn btn-danger">緊急下架</button>
							</div>

						</div>
					</div>
				</div>
			</c:forEach>
		
	</c:if>
	
	</div>
	


</body>
</html>