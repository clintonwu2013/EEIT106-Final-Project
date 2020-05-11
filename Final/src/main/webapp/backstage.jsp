<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.*"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>網站後台頁面</title>
<style>
#show td{
	border: grey solid 1px;
	border-collapse:collapse;
	text-align:center;
}

#show {
	border: grey solid 1px;
	border-collapse:collapse;
	
}


form{
float:left;
}

#body{
width:1300px;
height:1000px;
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
#img{
 width:auto;
 height:150px;
 
}
#img2{
 width:auto;
 height:150px;
 
}

#content{
font-family: Microsoft JhengHei;
}
#content2{
font-family: Microsoft JhengHei;
}
#dialogform{
font-family: Microsoft JhengHei;
}

.place2 { background-color: #F8F8FF; }
.place2:hover, .place2.green2 { background-color: #FFEE99; }

.place { background-color: #FFEE99; }
.place:hover, .place.green { background-color: #F8F8FF; }

body{
	background-color:#F5F5F5;
	font-family: Microsoft JhengHei;
}

</style>

</head>



<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>

<script src="https://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css" />
<link rel="stylesheet" href="http://jqueryui.com/resources/demos/style.css">

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  
<script type="text/javascript">

$( document ).ready(function() {
	
// 	$("tr").on("click",function(){
// 		$(this).attr("background-color","red")
// 	})
	$(".place").click(function () {
   		$(this).toggleClass("green");
		});
		
	$(".place2").click(function () {
   		$(this).toggleClass("green2");
		});
	function taskDate(dateMilli) {
	    var d = (new Date(dateMilli) + '').split(' ');
	    d[2] = d[2] + ',';

	    return [d[0], d[1], d[2], d[3]].join(' ');
	}
	
	$(".buttonRight").on("click",function(){
		var updateActivityId = $(this).val();
		var content =  $(this).html();
// 		alert($(this).val())
// 		alert($(this).html())
		
		var Json = { 
			"aId": updateActivityId, 
			"permission": content
			};
		$.ajax({
			url: "/Final/updateActivity",
			type: "post",
			dataType: "json",
			data: Json,
			success: function(data){
					
					console.log(data);
					
					var begin = taskDate(new Date(data.beginTime));
					var end = taskDate(new Date(data.endTime));
					var attendLimitTime = taskDate(new Date(data.attendLimitTime));
					txt=
						"<b>發起人:</b>  " +data.email +"<br><br>"+
						"<b>活動編號:</b> "+ data.aid+"<br>"+
					    "<b>活動名稱:</b>  "+data.aname+"<br>"+
					    "<b>活動類型:</b> "+ data.atype+"<br>"+
					    "<b>活動時間:</b> "+begin+" ~ "+end+"<br>"+
					    "<b>活動地點:</b> "+data.address+"<br>"+
					    "<b>活動內容:</b> "+data.acontent+"<br><br>"+
					    		   
// 					    "<b>活動費用:</b> "+data.cost+"<br>"+
					    "<b>活動按讚數:</b> "+data.good+"<br>"+
					    "<b>活動參加人數:</b> "+data.accessPeople+"<br>"+
					    "<b>活動人數限制:</b> "+data.peopleUplimit+"<br>"+
					    "<b>活動報名截止:</b> "+attendLimitTime+"<br><br>"+
					    "<b>審核狀態:</b> "+data.permission+"<br>"+
// 					    '<button class="buttonRight" value="${data.aid}">通過</button>'+
// 					    '<button class="buttonRight" value="${data.aid}">不通過</button><br>'+
					    "<b>活動狀態:</b> "+data.status 
						
// 					    alert("test")
					    let aid = "#"+data.aid; 
					    $(aid).html("<b>"+data.permission+"</b>");
					        
					
					$( "#content" ).html(txt)
					 
					
			},
			error: function(){
				alert("ajax failed")
			}	
		})
		
		
	})
	
	
	
	$( ".buttonLeft" ).on( "click", function() {
    	var aId = $(this).html();
//     	var updateActivity = $(this).val();
    	
    	console.log( $(this).val())
 		console.log(aId);
    	
 		var path = "/Final/showImg/"+aId;
 		console.log(path)
 		$("#img").attr("src",path);
 		
 		
 		$.ajax({
			url: "/Final/activities/"+aId,
			type: "Get",
			success: function(data){
					
					console.log(data);
					var begin = taskDate(new Date(data.beginTime));
					var end = taskDate(new Date(data.endTime));
					var attendLimitTime = taskDate(new Date(data.attendLimitTime));
					txt=
						"<b>發起人:</b>  " +data.email +"<br><br>"+
						"<b>活動編號:</b> "+ data.aid+"<br>"+
					    "<b>活動名稱:</b>  "+data.aname+"<br>"+
					    "<b>活動類型:</b> "+ data.atype+"<br>"+
					    "<b>活動時間:</b> "+begin+" ~ "+end+"<br>"+
					    "<b>活動地點:</b> "+data.address+"<br>"+
					    "<b>活動內容:</b> "+data.acontent+"<br><br>"+
					    		   
// 					    "<b>活動費用:</b> "+data.cost+"<br>"+
					    "<b>活動按讚數:</b> "+data.good+"<br>"+
					    "<b>活動參加人數:</b> "+data.accessPeople+"<br>"+
					    "<b>活動人數限制:</b> "+data.peopleUplimit+"<br>"+
					    "<b>活動報名截止:</b> "+attendLimitTime+"<br><br>"+
					    "<b>審核狀態:</b> "+data.permission+"<br>"+
// 					    "<button class='buttonRight' value='${data.aid}'>通過</button>"+
// 					    '<button class="buttonRight" value="${data.aid}">不通過</button><br>'+
					    "<b>活動狀態:</b> "+data.status 
					
					    
					  
					
					$( "#content" ).html(txt)
					
			},
			error: function(){
				console.log("ajax failed")
			}	
		})
		
		
        $( "#dialog" ).dialog( "open" );
        
       
    });
	
	
	$( ".buttonLeft2" ).on( "click", function() {
		
    	var messageId = $(this).html();
//  		alert(messageId);
 		var st = "."+messageId
 		var status = $(st).html()
//  		var path = "/Final/showMemberImg/"+messageId;
//  		alert(path)
//          alert(status)
       if(status=="待處理"){
    	   
    	   $(".dialogButton").show();
    		$.ajax({
    			url: "/Final/reports/"+messageId,
    			type: "Get",
    			success: function(data){
    				console.log(data);
    				var messageTime = taskDate(new Date(data.messageTime));
    					txt = 
    						"<b>被檢舉人帳號:</b>  "+data.email+ "<br>"+
    						"<b>被檢舉人姓名:</b>  "+data.memberName+"<br>"+
    						"<b>被檢舉人違規次數:</b>  "+data.vCount+"<br><br>"+
    						"<b>留言活動編號:</b>  "+data.activityId+"<br>"+
    						"<b>留言活動名稱:</b>  "+data.activityName+"<br><br>"+
    						"<b>留言編號:</b>  "+data.messageId+"<br>"+
    						"<b>留言時間:</b>  "+messageTime+"<br>"+
    						"<b>被檢舉人留言:</b><br>  "+data.message+"<br><br>"+
    						"<div class='"+data.messageId+"2'>"+
    						"<b>回覆被檢舉人:</b>"+
    						"<textarea name='response' id='dialogResponse' rows='5' cols='30'></textarea>"+ 
    						  "</div>";
    						
    					
    					$( "#content2" ).html(txt)
    					$( "#dialogActivityId" ).val(data.activityId);
    					$( "#dialogActivityName" ).val(data.activityName);
//     					$( "#dialogEmail" ).val(data.email);
    					
    					$( "#dialogEmail" ).val(data.email);
    					$( "#dialogName" ).val(data.memberName);
    					$( "#dialogMessageNo" ).val(data.messageId);
    					$( "#dialogMessageTime" ).val(data.messageTime);
    					$( "#dialogMessageContent" ).val(data.message);
    					

    					var path = "/Final/"+data.email+"/showMemberImg";
//     					alert(path);
    					$("#img2").attr("src",path);
    					
    					
    			},
    			error: function(){
    				alert("ajax failed")
    			}	
    		})
    	   
       }else{
    	   $(".dialogButton").hide();
    	   $.ajax({
   			url: "/Final/reports/"+messageId,
   			type: "Get",
   			success: function(data){
   				console.log(data);
   				var messageTime = taskDate(new Date(data.messageTime));
   					txt = 
   						"<b>被檢舉人帳號:</b>  "+data.email+ "<br>"+
   						"<b>被檢舉人姓名:</b>  "+data.memberName+"<br>"+
   						"<b>被檢舉人違規次數:</b>  "+data.vCount+"<br><br>"+
   						"<b>留言活動編號:</b>  "+data.activityId+"<br>"+
						"<b>留言活動名稱:</b>  "+data.activityName+"<br><br>"+
   						"<b>留言編號:</b>  "+data.messageId+"<br>"+
   						"<b>留言時間:</b>  "+messageTime+"<br>"+
   						"<b>被檢舉人留言:</b><br>  "+data.message+"<br><br>"+
   						"<div class='"+data.messageId+"2'>"+
//    						"<b>回復時間:"+ data.responseTime+"</b>"
   						"<b>處理狀態: "+status+"</b><br>"+
   						"<b>回復時間: "+taskDate(new Date(data.responseTime))  +"</b><br>"+
   						"<b>回復內容: "+data.response1  +"</b>"
//    						"<b>回覆被檢舉人:</b>"+ data.response
   					
   						$( "#content2" ).html(txt)	
   					console.log(data)	
//    					$( "#content2" ).html(txt)
//    					$( "#dialogActivityId" ).val(data.activityId);
//    					$( "#dialogActivityName" ).val(data.activityName);
//    					$( "#dialogEmail" ).val(data.email);
   					
//    					$( "#dialogEmail" ).val(data.email);
//    					$( "#dialogName" ).val(data.memberName);
//    					$( "#dialogMessageNo" ).val(data.messageId);
//    					$( "#dialogMessageTime" ).val(data.messageTime);
//    					$( "#dialogMessageContent" ).val(data.message);
   					

   					var path = "/Final/"+data.email+"/showMemberImg";
// 					alert(path);
					$("#img2").attr("src",path);
   						
   			},
   			error: function(){
   				alert("ajax failed")
   			}	
   		})
			
			
			
		}
 	
 		
		
        $( "#dialog2" ).dialog( "open" );
        
       
    });
	
	
	$( ".dialogButton" ).on( "click", function() {
		
		
    	var violateType = $(this).html();
    	var memberEmail = $("#dialogEmail").val();
    	var memberName = $("#dialogName").val();
    	var messageNo = $("#dialogMessageNo").val();
    	var messageTime = $("#dialogMessageTime").val();
    	var messageContent = $("#dialogMessageContent").val();
    	var response = $("#dialogResponse").val();
    	var activityId = $("#dialogActivityId").val();
    	var activityName = $("#dialogActivityName").val();
    	
    	if(response.trim() != "" && violateType== "確認違規並送出"){
    		$(".dialogButton").hide();
        	//alert("aid="+activityId)
        	//alert("aname="+activityName)
//      		alert(violateType);
//     		alert(memberEmail);
//     		alert(memberName );
//     		alert(messageNo);
//     		alert(messageTime);
//     		alert(messageContent);
//     		alert(response);

    		
    		var Json = { 
    			"activityId": activityId,
    			"activityName": activityName,
    			"violateType": violateType, 
    			"memberEmail": memberEmail,
    			"memberName": memberName,
    			"messageNo": messageNo,
    			"messageTime": messageTime,
    			"messageContent": messageContent,
    			"response": response
    			};
    		
    		$.ajax({
    			url: "/Final/reportsUpdate",
    			type: "Post",
    			dataType: "json",
    			data: Json,
    			success: function(data){
    				
    				txt= data.violateType+", "+ data.responseTime+", "+ data.response;
    				
    				txt = "<b>處理狀態: "+data.violateType.substring(0,4)+"<br>"+
    					"回復時間: "+taskDate(new Date(data.responseTime))+"<br>"+
    					"回覆內容: "+data.response +"</b>"
    				
    				var messageId = "."+data.messageNo;
    				$(messageId+"2").html(txt);
    				
    				
    				$(messageId).html("<b>"+data.violateType.substring(0,4)+ "</b>");
    				$(messageId).attr('style',  'background-color:#F8F8FF')
//     				$("#dialogform2").html(txt);
    				console.log(data)
    				
    				
    				
    					
    			},
    			error: function(){
    				alert("ajax failed")
    			}	
    		})
    	}else if(response.trim() == "" && violateType== "確認違規並送出"){
    		alert("若確定違規, 請記得輸入回復被檢舉人欄位。")
    	}
    	
    	if(response.trim() == "" && violateType== "沒有違規"){
    		$(".dialogButton").hide();
    		var Json = { 
        			"activityId": activityId,
        			"activityName": activityName,
        			"violateType": violateType, 
        			"memberEmail": memberEmail,
        			"memberName": memberName,
        			"messageNo": messageNo,
        			"messageTime": messageTime,
        			"messageContent": messageContent,
        			"response": response
        			};
        		
        		$.ajax({
        			url: "/Final/reportsUpdate",
        			type: "Post",
        			dataType: "json",
        			data: Json,
        			success: function(data){
        				
        				txt= data.violateType+", "+ data.responseTime+", "+ data.response;
        				
        				txt = "<b>處理狀態: "+data.violateType.substring(0,4)+"<br>"+
        					"回復時間: "+taskDate(new Date(data.responseTime))+"<br>"+
        					"回覆內容: "+data.response +"</b>"
        				
        				var messageId = "."+data.messageNo;
        				$(messageId+"2").html(txt);
        				
        				
        				$(messageId).html("<b>"+data.violateType.substring(0,4)+ "</b>");
        				$(messageId).attr('style',  'background-color:#F8F8FF')
//         				$("#dialogform2").html(txt);
        				console.log(data)
        				
        				
        				
        					
        			},
        			error: function(){
        				alert("ajax failed")
        			}	
        		})
    	}else if(response.trim() != "" && violateType== "沒有違規"){
    		alert("若沒有違規, 請勿輸入回復被檢舉人欄位。")
    	}
    	
		
 		$( "#dialog2" ).dialog( "open" );
        
       
    });
});



$( function() {
    $( "#dialog" ).dialog({
    	
    	maxWidth:6000,
        maxHeight: 5000,
        width: 430,
        height: 690,
        position: { my: "center", at: "left+290px top+300px ", of: window  } ,
      autoOpen: false,
      show: {
        effect: "blind",
        duration: 10
      },
      hide: {
        effect: "blind",
        duration: 10
      }
    });
    
$( "#dialog2" ).dialog({
    	
    	maxWidth:6000,
        maxHeight: 5000,
        width: 430,
        height: 600,
        position: { my: "center", at: "left+290px top+300px ", of: window  } ,
      autoOpen: false,
      show: {
        effect: "blind",
        duration: 10
      },
      hide: {
        effect: "blind",
        duration: 10
      }
    });
 
    
  } );


		
</script>
<body style="font-family: Microsoft JhengHei">

<jsp:include page="backstageHead.jsp"></jsp:include>
<sql:query var="NoActivities" dataSource="jdbc/final">
    select count(*) AS count from activity where permission='待審核';
</sql:query>

<sql:query var="NoReports" dataSource="jdbc/final">
    select count(*) AS count from report where status='待處理';
</sql:query>
<div id="body" >

<div id="left" >
<nav>
<button id="link1"  class="btn btn-info btn-lg" onclick="location.href='<c:url value="/findMembers"></c:url>'">管理網站會員</button><br><br>
<button id="link2"  class="btn btn-info btn-lg" onclick="location.href='<c:url value="/findUnreviewed"></c:url>'">管理未審核的活動 (<c:forEach items="${NoActivities.rows}" var="result">${result.count}</c:forEach>)</button><br><br>
<button id="link3"  class="btn btn-info btn-lg" onclick="location.href='<c:url value="/findReports"></c:url>'">管理待處理的檢舉 (<c:forEach items="${NoReports.rows}" var="result">${result.count}</c:forEach>)</button><br><br>
<%-- <li><a id="link1" href="<c:url value="/findMembers"></c:url>">管理網站會員</a> --%>
<%-- <li><a id="link2" href="<c:url value="/findUnreviewed"></c:url>">管理未審核的活動</a> --%>
<%-- <li><a id="link3" href="<c:url value="/findReports"></c:url>">管理待處理的檢舉</a> --%>

</nav>
</div>





<div id="dialog" title="活動詳細資料" >
  <img id="img">
  <div id="content"></div>
</div>

<div id="dialog2" title="被檢舉人詳細資料" >
  <img id="img2">
  

		
  <div id="content2"></div>
  <br>
  
<!--   <div id="dialogform2"> -->
<!--   <b>回覆被檢舉人:</b> -->
<!-- 	<textarea name="response" id="dialogResponse" rows="5" cols="30"></textarea>   -->
<!--   </div> -->

		<input type="hidden" name="reportId" id="dialogReportId"  >
		<input type="hidden" name="activityId" id="dialogActivityId"  >
		<input type="hidden" name="activityName" id="dialogActivityName"  >
		<input type="hidden" name="email" id="dialogEmail"  >
		<input type="hidden" name="name" id="dialogName"  >
		<input type="hidden" name="messageNo" id="dialogMessageNo"  >
		<input type="hidden" name="messageTime" id="dialogMessageTime"  >
		<input type="hidden" name="messageContent" id="dialogMessageContent"  >
  		
		<button class="dialogButton">確認違規並送出</button>
		<button class="dialogButton">沒有違規</button>
  
  
  
</div>

<div id="right">


<!-- 檢舉內容 -->
<c:if test="${not empty reports }">

  <h2>處理檢舉</h2>
    
<table class="table table-hover" >
<thead>
<tr>
<th>編號</th>
<th>被檢舉人</th>
<th>檢舉人</th>
<th>檢舉類型</th>
<th>檢舉內容</th>
<th>檢舉時間</th>
<th>處理狀態</th>
<!-- <td>審核</td> -->
</tr>
</thead>
<tbody>
<c:forEach var="report" items="${reports }">
<tr class="place" OnClick="this.style.background='#F8F8FF'">
<td>
<button class="buttonLeft2">${report.activityMessage.messageId}</button>
</td>
<td>${report.memberByReportedEmail.email}</td>
<td>${report.memberByReportEmail.email}</td>

<td>${report.type}</td>
<td>${report.content }</td>
<td><fmt:formatDate value="${report.reportTime}" pattern="yyyy/MM/dd"/></td>
<td class="${report.activityMessage.messageId}">${report.status}</td>
<!-- <td> -->
<%-- <button class="buttonRight2" value="${report.reportId}">違規</button> --%>
<%-- <button class="buttonRight2" value="${report.reportId}">沒有違規</button> --%>
<!-- </td> -->
</tr>
</c:forEach>
</tbody>
</table>

</c:if>


<!-- 待審核活動 -->
<c:if test="${not empty unreviewedActivities }">

<h2>審核活動</h2>
<table class="table table-hover" >
<thead>
<tr>
<th>活動編號</th>
<th>活動名稱</th>
<th>活動類型</th>
<th>主辦人</th>
<th>活動狀態</th>
<th>活動審核狀態</th>
<th>審核</th>

<!-- <td>檢視詳細內容</td> -->
<!-- <td>照片</td> -->
</tr>
</thead>
<tbody>
<c:forEach var="unreviewedActivity" items="${unreviewedActivities }">
<tr class="place" OnClick="this.style.background='#F8F8FF'" >
<td>

<button class="buttonLeft">${unreviewedActivity.aid }</button>
</td>
<td>${unreviewedActivity.aname}</td>
<td>${unreviewedActivity.atype}</td>
<td>${unreviewedActivity.member.email}</td>


<td><div >${unreviewedActivity.status}</div></td>
<%-- <td>${unreviewedActivity.permission}</td> --%>
<td id="${unreviewedActivity.aid }">
${unreviewedActivity.permission}
<%-- <button class="buttonRight" value="${unreviewedActivity.aid}">待審核</button> --%>
</td>
<td>
<button class="buttonRight" value="${unreviewedActivity.aid}">通過</button>
<button class="buttonRight" value="${unreviewedActivity.aid}">不通過</button>
</td>

</tr>
</c:forEach>
</tbody>
</table>

</c:if>








<!-- 全部會員資料 -->
<c:if test="${not empty members }">
<h2>管理網站會員權限</h2>
<table class="table table-hover">
<thead>
<tr>
<!-- <td>會員編號</td> -->
<th>姓名</th>
<th>帳號</th>
<th>認證狀態</th>
<th>權限</th>
<th>違規次數</th>
<th>停權時間</th>
<!-- <td>照片</td> -->
</tr>
</thead>
<tbody>
<c:forEach var="member"   items="${members}"  >

<tr class="place" OnClick="this.style.background='#FFEE99'">
<%-- <td>${member.mno}</td> --%>
<td>${member.mname}</td>
<td>${member.email}</td>
<td>${member.identify}</td>

<td>
<c:if test="${member.permission=='普通會員'}">
<form  action="<c:url value="/updatePermission"></c:url>" method="post">
<input type="hidden" name="email" value="${member.email}">
<input type="hidden" name="permission" value="普通會員">
<input type="submit" style="color:black" value="普通會員">
</form>

<form  action="<c:url value="/updatePermission"></c:url>" method="post">
<input type="hidden" name="email" value="${member.email}">
<input type="hidden" name="permission" value="管理員">
<input type="submit" style="color:white" value="管理員">
</form>
</c:if>



<c:if test="${member.permission=='管理員'}">
<form action="<c:url value="/updatePermission"></c:url>" method="post">
<input type="hidden" name="email" value="${member.email}">
<input type="hidden" name="permission" value="普通會員">
<input OnClick="this.style.background='#FFEE99'" type="submit" style="color:white" value="普通會員">
</form>

<form  action="<c:url value="/updatePermission"></c:url>" method="post">
<input type="hidden" name="email" value="${member.email}">
<input type="hidden" name="permission" value="管理員">
<input OnClick="this.style.background='#FFEE99'" type="submit" style="color:black" value="管理員">
</form>
</c:if>
</td>

<td>${member.vcount}</td>
<td><fmt:formatDate value="${member.vtime}" pattern="yyyy/MM/dd"/></td>
<%-- <td>${member.photo}</td> --%>

</tr>
</c:forEach>
</tbody>
</table>

</c:if>

</div>



</div>
</body>
</html>