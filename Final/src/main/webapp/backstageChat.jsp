<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<title>管理員聊天室</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js"></script>
<style type="text/css">
#body {
	width: 1500px;
	height: 600px;
	/* border:solid 1px grey; */
	margin: auto;
	margin-top: 40px;
	padding-top: 40px;
	background-color: #F5F5F5;
	padding-left: 70px;
}

#left {
	/* 	text-align: center; */
	margin-left: 0px;
	width: 20%;
	float: left;
	/*   background-color: grey; */
	background-color: #F5F5F5;
	font-family: Microsoft JhengHei;
}

#right {
	padding-left: 2%;
	padding-right: 10%;
	padding-bottom: 10px;
	margin-bottom: 15px;
	margin-left: 350px;
	height: 450px;
	width: 900px;
	overflow-y: scroll;
	font-family: Microsoft JhengHei;
	background-color: white;
}

#recFromServer {
	padding-left: 25%;
	padding-right: 5%;
}

body {
	background-color: #F5F5F5;
	font-family: Microsoft JhengHei;
}

tr td {
	width: 500px;
}

.chatLineLeft {
	background-color: #99FF33;
	margin-bottom: 1px;
	width: 300px;
	padding-top: 10px;
	padding-bottom: 10px;
	padding-left: 20px;
	border-radius: 10px;
	word-break: break-all;
}

.chatLineRight {
	background-color: #99FF33;
	margin-bottom: 1px;
	margin-left: 70%;
	width: 300px;
	padding-top: 10px;
	padding-bottom: 10px;
	padding-left: 20px;
	border-radius: 10px;
	word-break: break-all;
}

.bottom {
	width: 50%;
	margin-left: 60%;
}

.chatNameRight {
	margin-left: 70%;
}

.chatNameLeft {
	margin-left: 100%;
}

.dateRight {
	margin-left: 70%;
	margin-bottom: 1px;
	font-size: 2px;
}

.dateLeft {
	margin-bottom: 1px; font-size: 2px;
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


<script>
Date.prototype.Format = function (fmt) { 
    var o = {
        "M+": this.getMonth() + 1, //月份 
        "d+": this.getDate(), //日 
        "h+": this.getHours(), //小时 
        "m+": this.getMinutes(), //分 
        "s+": this.getSeconds(), //秒 
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
        "S": this.getMilliseconds() //毫秒 
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}

	//创建sockJS协议
	var socket = new SockJS("<c:url value='/ws'/>");
	var stompClient = Stomp.over(socket);
	//连接服务器
	//stompClient.connect("guest", "guest", function() {}); 用户名和密码
	stompClient.connect({}, function(frame) {
		//setConnected(true);
		console.log('Connected: ' + frame);

		//subscribe:订阅一个主题，“/topic”前缀是在：
		stompClient.subscribe('/topic/greetings', function(greeting) {
			
			console.log(greeting.body);
			console.log("自己的操作！");

			//判斷是否為使用者
			var name = $("#senderName").val()
			var content = greeting.body;
			var array = content.split(":")
			
			if(name==array[0]){
				$("#chatBox").append("<br><span class='chatNameRight'><b>"+array[0]+":</b></span><div class='chatLineRight'>" + 
						array[1] + "</div>"+
						"<div class='dateRight'>"+new Date().Format("yyyy/MM/dd hh:mm:ss")+"</div>"
						);
				
				var div = document.getElementById('right');
				div.scrollTop = div.scrollHeight;//这里是关键的实现
				$("#message").val("");
			}else{
				$("#chatBox").append("<br><b>"+array[0]+":</b><div class='chatLineLeft'>" + 
						array[1] + "</div>"+
						"<div class='dateLeft'>"+new Date().Format("yyyy/MM/dd hh:mm:ss")+"</div>"
						);
				
				var div = document.getElementById('right');
				div.scrollTop = div.scrollHeight;//这里是关键的实现
				$("#message").val("");
			}
			
		});
	});

	function sendMessage() {
		
		//发送信息给服务器
		stompClient.send("/app/greeting", {}, JSON.stringify({
			'sender' : $("#sender").val(),
			'senderName' : $("#senderName").val(),
			'reciever' : $("#reciever").val(),
			'message' : $("#message").val()
		}));
	}
	window.onload=function(){
		var div = document.getElementById('right');
		div.scrollTop = div.scrollHeight;//这里是关键的实现
	}
</script>
</head>
<body>
	<jsp:include page="backstageHead.jsp"></jsp:include>

	<sql:query var="friends" dataSource="jdbc/final">
    select *  from member where permission='管理員'
	</sql:query>

	<sql:query var="chats" dataSource="jdbc/final">
    select *  from chat join member on chat.email1=member.email where chat.email2 is null order by messageTime asc;
	</sql:query>

	<div id="body">
		<div id="left">
			管理員名單:<br>
			<table>
				<c:forEach items="${friends.rows}" var="friend">

					<tr>
						<td>${friend.email}(${friend.mname})</td>
					</tr>

				</c:forEach>

			</table>

		</div>
		<div style="font-family: Microsoft JhengHei; margin-left: 350px;">
			<h2>管理員聊天室</h2>
		</div>

		<div id="right">


			<c:if test="${not empty chats }">

				<div id="chatBox">

					<c:forEach items="${chats.rows}" var="chat">
						<c:if test="${chat.email1 != member.email }">
							<b>${chat.mName}:</b>
							<div class="chatLineLeft">${chat.content}</div>

							<div class='dateLeft'>
								<fmt:formatDate value="${chat.messageTime}"
									pattern="yyyy/MM/dd hh:mm:ss" />
							</div>

						</c:if>

						<c:if test="${chat.email1 == member.email }">
							<span class='chatNameRight'><b>${chat.mName}:</b></span>
							<div class="chatLineRight">${chat.content}</div>

							<div class='dateRight'>
								<fmt:formatDate value="${chat.messageTime}"
									pattern="yyyy/MM/dd HH:mm:ss" />
							</div>

						</c:if>



					</c:forEach>

				</div>

			</c:if>


			<input id="senderName" value="${member.mname  }" type="hidden">

		</div>
		<div class="bottom">
			<input id="sender" value="${member.email}" type="hidden"> <input
				id="reciever" value="管理員聊天室" type="hidden"> <input
				id="message" type="text"> <input type="button"
				onclick="sendMessage()" value="傳送訊息">

		</div>





	</div>
</body>
</html>