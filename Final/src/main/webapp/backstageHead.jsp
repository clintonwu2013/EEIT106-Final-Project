<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Permanent+Marker&display=swap">
<style>

@font-face {
	font-family: HanyiSentyTang;
	src: url(fonts/HanyiSentyTang.ttf);
}
	.notification {
  
  color: white;
  text-decoration: none;
  
  position: relative;
  display: inline-block;
  border-radius: 2px;
}

/* .notification:hover { */
/*   background: red; */
/* } */

.notification .badge {
  position: absolute;
  top: 5px;
  right: -10px;
  padding: 5px 10px;
  border-radius: 50%;
  background: red;
  color: white;
}

    body {
      margin: 0;
      padding: 0px;
    }

    .act {

      /* text-align: center; */
      font-family: HanyiSentyTang;
      width: 100%;
      /* margin:auto;  */
      /* margin-left: 1%; */
      /* margin-right: 1%;  */
      margin-bottom: 50px;
      /* background-color: red; */
      float: left;


    }

/*     #banner { */
/*       background-image: url("images/cat.jpg"); */
/*       background-repeat: no-repeat; */
/*       /* background-position: center; */ */
/*       background-size: 100%; */
/*       /* background-color: blueviolet; */ */
/*       /* height: 200px; */ */
/*       height: 600px; */
/*       width: 100%; */
/*       opacity: 0; */
/*       /* position: obsolute; */ */
/*       /* background: rgb(255, 0, 0); */ */
/*       transition: opacity 2s; */
/*       /* animation: showup 5s;  */ */

/*     } */

    .inner {
      /* background-color: red; */
      font-family: HanyiSentyTang;
      color: azure;
      height: 400px;
      width: 100%;
      text-align: center;
      padding-top: 140px;
      /* padding-top: 49%;  */

      /* opacity:0; */
      /* animation: showup 1s; */
      transition: opacity 1s;


    }

    .opener {
      cursor: pointer;

      margin-top: 10px;
      margin-left: 40px;
      height: 50px;
      width: 40%;
    }

/*     .navFixed { */
/*       z-index: 10; */
/*       position: fixed; */
/*       top: 0; */
/*       left: 0; */
/*       margin-top: 0; */
/*       min-width: 100%; */
/*       opacity: 0.94; */
/*       transition: opacity .5s ease-out; */
/*     } */


    .logo {
      width: 350px;
      height: 72px;
      float: left;
      border-bottom: 3px yellow solid;
      font-family: 'Permanent Marker', cursive;
      padding-top:15px;
      padding-left:15px;
      color:red;
      font-size:30px;
    }

    .menue2 {

      height: 72px;
      font-family: HanyiSentyTang;
      /* width:900px; */
      overflow: auto;
      background-color: white;
      list-style-type: none;
      border-bottom: 3px yellow solid;
      margin-bottom: 0;
      margin-top: 0;
    }

    .menue2 li {

      height: 60px;
      width: 7em;
      float: right;
      
      /* border-right: 1px solid black */
    }

    .menue2 li a {
      /* padding-top: 2px; */
      padding-top: 10px;
      height: 60px;
      display: block;
      width: 100%;
      text-align: center;
      text-decoration: none;
      line-height: 2.5em;
      color: #333333;
       font-size:28px; 
    }

    .menue2 li a:hover {

      /* color: black; */
      background-color: #F5F5F5;

    }

    .menue2 #login:hover {
      
      /* color: black; */
      background-color: #F5F5F5;

    }

    .menue2 #login{
       /* display: block; */
      padding-top: 20px;
      height: 52px;
      text-align: center;
      color: #333333
    }


    /* @keyframes showup{ 
			0%{opacity: 0.7;}
			
			100%{opacity: 1;}

		} */


    }
  </style>





<script>
  
 	function link(){
		 window.location.href = "/Final/backstageChat.jsp";
		}	
 
</script>


</head>
<body>
<div class="dropdowns">
    
    
    <div class="logo" >Let's Go Backstage</div>
    <div class="dropdowns">
<%--     <img class="logo" src="/Final/${member.email}/showMemberImg"></img> --%>
    <nav>
      <ul class="menue2">



 		

		
        <li>
          <a href="logoutController"> Log out</a>
        </li>


<%--         <sql:query var="results" dataSource="jdbc/final"> --%>
<%--     		select * from mail where email2= '${member.email }' and status='未讀' --%>
<%-- 		</sql:query> --%>
<%-- 		<sql:query var="NoActivities" dataSource="jdbc/final"> --%>
<!--     		select * from activity where permission='待審核'; -->
<%-- 		</sql:query> --%>

<%-- 		<sql:query var="NoReports" dataSource="jdbc/final"> --%>
<!--     		select * from report where status='待處理'; -->
<%-- 		</sql:query> --%>
		<li>
          <a href="backstageData1.jsp">統計數據</a>
        </li>
        <li>
          <img class="opener" title="聊天室" src="images/message.PNG" onclick="link()"/>
        </li>
        <li>
          <a href="/Final/findMails" class="notification" >
          	<span>系統訊息</span>
          <span class="badge">new</span>
          </a>
        </li>
        <li>
          <a href="/Final/findUnreviewed" class="notification">
          	<span>最新任務</span>
          	<span class="badge">new</span>
          	</a>
        </li>
        <li>
          <a href="backstageIndex.jsp">後台首頁</a>
        </li>

      </ul>

    </nav>
    </div>
    </div>
    
</body>
</html>