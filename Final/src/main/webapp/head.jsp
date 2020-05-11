<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style>
    body {
      margin: 0;
      padding: 0px;
    }

    .act {

      /* text-align: center; */
      font-family: Microsoft JhengHei;
      width: 100%;
      /* margin:auto;  */
      /* margin-left: 1%; */
      /* margin-right: 1%;  */
      margin-bottom: 50px;
      /* background-color: red; */
      float: left;


    }

    #banner {
      background-image: url("images/cat.jpg");
      background-repeat: no-repeat;
      /* background-position: center; */
      background-size: 100%;
      /* background-color: blueviolet; */
      /* height: 200px; */
      height: 600px;
      width: 100%;
      opacity: 0;
      /* position: obsolute; */
      /* background: rgb(255, 0, 0); */
      transition: opacity 2s;
      /* animation: showup 5s;  */

    }

    .inner {
      /* background-color: red; */
      font-family: Microsoft JhengHei;
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

    .navFixed {
      z-index: 10;
      position: fixed;
      top: 0;
      left: 0;
      margin-top: 0;
      min-width: 100%;
      opacity: 0.94;
      transition: opacity .5s ease-out;
    }


    .logo {
      width: 130px;
      height: 72px;
      float: left;
      border-bottom: 5px yellow solid;
    }

    .menue {

      height: 72px;
      font-family: Microsoft JhengHei;
      /* width:900px; */
      overflow: auto;
      background-color: white;
      list-style-type: none;
      border-bottom: 5px yellow solid;
      margin-bottom: 0;
      margin-top: 0;
    }

    .menue li {

      height: 60px;
      width: 7em;
      float: right;
      
      /* border-right: 1px solid black */
    }

    .menue li a {
      /* padding-top: 2px; */
      padding-top: 10px;
      height: 60px;
      display: block;
      width: 100%;
      text-align: center;
      text-decoration: none;
      line-height: 2.5em;
      color: #333333;
    }

    .menue li a:hover {

      /* color: black; */
      background-color: #F5F5F5;

    }

    .menue #login:hover {
      
      /* color: black; */
      background-color: #F5F5F5;

    }

    .menue #login{
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

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  <script src="http://apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
  <script src="http://apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>

  <link rel="stylesheet" href="http://apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
  <link rel="stylesheet" href="jqueryui/style.css">



  <script>


    $(function () {
      $(window).scroll(function () {
        if ($(this).scrollTop() > 0) {          /* 要滑動到選單的距離 */
          $('.dropdowns').addClass('navFixed');   /* 幫選單加上固定效果 */
        } else {
          $('.dropdowns').removeClass('navFixed'); /* 移除選單固定效果 */
        }
      });
    });


    window.onload = function () {
      var box = document.getElementById("banner");
      box.style.opacity = 1;
    }



    
  </script>
</head>
<body>
<div class="dropdowns">
    <img class="logo" src="images/meetup.png"></img>
    <nav>
      <ul class="menue">




        <li>
          <a href="register.jsp">Sign up</a>
        </li>

        <li>
            <a href="login.jsp">Log in</a>
          </li>
        <!-- <li id="login" class="opener2">
          Log in
        </li> -->

        <!-- <button id="opener">打开对话框</button> -->
        <li>

          <img class="opener" id="profile" title="個人資料" src="images/profile.PNG" />

        </li>
        <li>
          <img class="opener" title="聊天室" src="images/message.PNG" />
        </li>
        <li>
          <img class="opener" title="通知" src="images/bell.PNG" />
        </li>
        <li>
          <a href="HostAdopt.jsp">發起送養文</a>
        </li>
        <li>
          <a href="index.jsp">首頁</a>
        </li>

      </ul>

    </nav>
    </div>
</body>
</html>