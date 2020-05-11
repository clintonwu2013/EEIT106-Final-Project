<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html>
<head>
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<meta charset="UTF-8">
<title>系統訊息</title>

<style>
.mailbox{
width:1000px;
padding:20px;
padding-left:30px;
}

#show td{
	border: grey solid 1px;
	border-collapse:collapse;
	text-align:center;
}

#show {
	border: grey solid 1px;
	border-collapse:collapse;
	font-family: Microsoft JhengHei;
}


/* form{ */
/* float:left; */
/* } */

#body{
width:1300px;
height:700px;
/* border:solid 1px grey; */
margin:auto;
margin-top:40px;
padding-top: 40px;
background-color: #F5F5F5;
}
#left{
	text-align:center;
   width: 20%; 
  float:left;
/*   background-color: grey; */
   background-color: #F5F5F5; 

}

#right{

padding-left:25%;
padding-right:5%;

}
.place2 { background-color: #F8F8FF; }
.place2:hover, .place2.green2 { background-color: #FFEE99; }

.place3 { background-color: #F8F8FF; }

.place { background-color: #FFEE99; }
.place:hover, .place.green { background-color: #F8F8FF; }

body{
	background-color:#F5F5F5;
	font-family: Microsoft JhengHei;
}

</style>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

 
<script src="https://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css" />
<link rel="stylesheet" href="http://jqueryui.com/resources/demos/style.css">


  
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  
   
<script>

$( document ).ready(function() {
	function taskDate(dateMilli) {
	    var d = (new Date(dateMilli) + '').split(' ');
	    d[2] = d[2] + ',';

	    return [d[0], d[1], d[2], d[3]].join(' ');
	}
	
	
	
	$(".place").on("click",function(){
		var id= $(this).attr("id");
		alert($(this).children().eq(0).text());
		$(this).children().eq(0).text("已讀");
		$(this).css("background-color","white")
 		
		
		txt="."+id;
		$(txt).submit();
		
		
		
		
	})
	
	$(".place3").on("click",function(){
		var id= $(this).attr("id");
		console.log($(this).children().eq(0).text());
 		
		
		txt="."+id;
		$(txt).submit();
		
		
	})
	
	
	
	$("#submit").on("click",function(){
// 		<textarea name='message' id='message' rows='5' cols='80'></textarea><br>
// 		<input type="hidden" name="reciever" id="reciever" value="${mail.memberByEmail1.email }">
// 		<input type="hidden" name="sender" id="sender" value="${mail.memberByEmail2.email }">
// 		<input type="hidden" name="title" id="title" value="RE:${mail.title }">
		
		var message= $("#message").val();
		var reciever = $("#reciever").val();
		var sender = $("#sender").val();
		var title = $("#title").val();
		alert(message);
		alert(reciever);
		alert(sender);
		alert(title)
		$("#showMail1").html("");
        $("#showMail").append("回復: (於"+taskDate(new Date())+")<br> "+message+"<br><br>");
		$("#message").val("");
		
		
		var Json = { 
			"message": message, 
			"reciever": reciever,
			"sender":sender,
			"title":title
			};
		$.ajax({
			url: "/Final/insertMail",
			type: "post",
			dataType: "json",
			data: Json,
			success: function(data){
					
					console.log(data);
					
					
					
			},
			error: function(){
				alert("ajax failed")
			}	
		})
		
		
	})
	
	
	$("#dialogSubmit").on("click",function(){

		
		var sender= $(this).val();
		var reciever = $("#dialogReciever").val();
		var response = $("#dialogResponse").val();
		var title = $("#dialogTitle").val();
		if(title.trim()==""){
			$("#error2").html("不可空白")
		}
		if(response.trim()==""){
			$("#error3").html("不可空白")
		}
// 		alert(reciever)
// 		alert(sender);
// 		alert(response);
// 		alert(title)
		if(title.trim()!="" && title.trim()!=""){
			var Json = { 
					"message": response,
					"reciever": reciever,
					"sender":sender,
					"title":title
					};
				$.ajax({
					url: "/Final/insertMail",
					type: "post",
					dataType: "json",
					data: Json,
					success: function(data){
							
							console.log(data);
							alert("信件已成功寄出")
							$("#myModal").modal('hide');
							$("#dialogTitle").val("");
							$("#dialogResponse").val("");
							$("#error").html("");
							$("#error2").html("");
							$("#error3").html("");
							
					},
					error: function(){
						$("#error").html("收信人帳號錯誤")
						alert("ajax failed")
					}	
				})
		}
		
		
		
	})
})







	



</script>



<body >
<jsp:include page="backstageHead.jsp"></jsp:include>

<div id="body" >


<div id="left" >
<nav>
<!-- <ul  class="menue" style="list-style-type:none;"> -->
<%-- <li><a id="link1" href='<c:url value="/findMails"></c:url>' > 收件匣</a> --%>
<sql:query var="results" dataSource="jdbc/final">
    select count(*) AS count from mail where email2= '${member.email }' and status='未讀'
</sql:query>
<button style="font-family: Microsoft JhengHei;" id="link1"  class="btn btn-info btn-lg" onclick="location.href='<c:url value="/findMails"></c:url>'">收件匣
(<c:forEach items="${results.rows}" var="result">${result.count}</c:forEach>)</button><br><br>
<button  style="font-family: Microsoft JhengHei;" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">發送系統訊息</button>
<!-- </ul> -->
</nav>
</div>



<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog" style="font-family: Microsoft JhengHei;">
  <div class="modal-dialog modal-lg">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        
        <h4 class="modal-title">發送系統訊息</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <div style="margin:auto" class="modal-body">
        
        	收信人:<br>
        	<input type="text" name="dialogReciever" id="dialogReciever" value="all">
        	<span style="color:red" id="error"></span>
        	<br><br>
        	標題:<br>
        	<input type="text" name="dialogTitle" id="dialogTitle" ><span style="color:red" id="error2"></span><br><br>
        	內容:<br>
        	<textarea name='response' id='dialogResponse' rows='5' cols='50'></textarea><span style="color:red" id="error3"></span><br>
        	<button  id="dialogSubmit" value="${member.email }">送出</button>
   	
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
<div id="right" style="font-family: Microsoft JhengHei;">
<c:if test="${not empty mails }">
<h2>收件匣</h2>
<table class="table table-hover">

<thead>
<tr>
<th style="width:150px;">狀態</th>
<th style="width:150px;">發信人</th>
<th>發信時間</th>
<th>主旨</th>
<th>內容</th>
</tr>
</thead>
<tbody>
<c:forEach var="mail" items="${mails }">
<c:if test="${mail.status=='未讀' }">
<tr class="place" id="${mail.mailNo }" OnClick="this.style.background='#F8F8FF'" style="cursor:pointer">
<td>${mail.status}</td>
<td>${mail.memberByEmail1.email}<br> (${mail.memberByEmail1.mname })</td>
<td><fmt:formatDate value="${mail.deliveryTime}" pattern="yyyy/MM/dd hh:mm:ss"/></td> 
<td >
<div style="width:200px; white-space:nowrap;overflow:hidden;text-overflow:ellipsis; ">
${mail.title} 
</div>

</td>
<td >
<div style="width:350px; white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">
${mail.message}
</div>
<form  class="${mail.mailNo }" action="<c:url value="/findMailByPK"></c:url>" method="post">
<input type="hidden" name="mailNo" value="${mail.mailNo }">
<input type="hidden" name="status" value="已讀">
</form>
</td>
</tr>
</c:if>

<c:if test="${mail.status=='已讀' }">
<tr class="place3" id="${mail.mailNo }" OnClick="this.style.background='#F8F8FF'" style="cursor:pointer" >
<td>${mail.status}</td>
<td>${mail.memberByEmail1.email}<br> (${mail.memberByEmail1.mname })</td>
<td><fmt:formatDate value="${mail.deliveryTime}" pattern="yyyy/MM/dd hh:mm:ss"/></td> 
<td >
<div style="width:200px; white-space:nowrap;overflow:hidden;text-overflow:ellipsis; ">
${mail.title} 
</div>

</td>
<td >
<div style="width:350px; white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">
${mail.message}
</div>

<form  class="${mail.mailNo }" action="<c:url value="/findMailByPK"></c:url>" method="post">
<input type="hidden" name="mailNo" value="${mail.mailNo }">
<input type="hidden" name="status" value="已讀">
</form>
</td>
</tr>
</c:if>





</c:forEach>
</table>


	<table >
			<tr>
				<td width='76'><c:if test="${pageNo > 1}">
						<div id="pfirst">
							<a href="<c:url value='/findMails?pageNo=1' />">第一頁</a>
						</div>
					</c:if></td>
				<td width='76'><c:if test="${pageNo > 1}">
						<div id="pprev">
							<a
								href="<c:url value='/findMails?pageNo=${pageNo-1}' />">上一頁</a>
						</div>
					</c:if></td>
				<td width='76'><c:if test="${pageNo != totalPages}">
						<div id="pnext">
							<a
								href="<c:url value='/findMails?pageNo=${pageNo+1}' />">下一頁</a>
						</div>
					</c:if></td>
				<td width='76'><c:if test="${pageNo != totalPages}">
						<div id="plast">
							<a
								href="<c:url value='/findMails?pageNo=${totalPages}' />">最末頁</a>
						</div>
					</c:if></td>
				<td width='176' align="center">第${pageNo}頁 / 共${totalPages}頁</td>
			</tr>
			</tbody>
		</table>

</c:if>


<c:if test="${not empty mail }">
<div class="mailbox" style="font-family: Microsoft JhengHei;background-color:white;">
<h2>主旨:   ${mail.title }</h2><br>
<%-- ${mail.mailNo }, --%>

<b>寄件人:   ${mail.memberByEmail1.email } (${mail.memberByEmail1.mname } ) 於  ${mail.deliveryTime }</b><br><br>

內容: ${mail.message }<br><br>


<div id="showMail1">
回復:
</div>

<div id="showMail">
</div>

<br>
<%-- <form action="<c:url value="/insertMail"></c:url>" method="post"> --%>
<textarea name='message' id='message' rows='5' cols='80'></textarea><br>
<input type="hidden" name="reciever" id="reciever" value="${mail.memberByEmail1.email }">
<input type="hidden" name="sender" id="sender" value="${mail.memberByEmail2.email }">
<input type="hidden" name="title" id="title" value="RE:${mail.title }">
<input type="submit" id="submit" value="送出">
<!-- </form> -->

</div>
</c:if>
</div>
</div>
</body>
</html>