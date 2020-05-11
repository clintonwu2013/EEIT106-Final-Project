<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>註冊</title>
</head>
<style>
    .allpage{
        width:1200px;
        margin:auto;

    }
    .head{
       
        height: 100px;
        
        border-bottom: 5px solid #FFEE99;
        /* background-color: red; */

        
    }

    .img1{
        /* margin-bottom: 0px; */
        width:300px;
        height:auto;
        /* padding-top:0px;
        padding-bottom: 0px; */

        padding-top:35px;
        padding-left: 150px;

    }
    .block1{
        width: 500px;
        margin-left:70px;
        float:left;
        margin-right: 40px
    }
    .img2{
        margin-top:50px;
        width:100%;
        height:auto;

    }
    
    .form{
        margin-top:50px;
        padding-left: 30px;
        margin-right:100px;
    }
    .rows{
        margin-top: 25px;
        margin-bottom: 25px;
        margin-left: 45px;
    }
    .register{
        font-size: 30px;
        font-family: Microsoft JhengHei;
        padding-left: 40px;
        padding-top: 20px;
    }

    .button1 {
            font-family: Microsoft JhengHei;
            font-size: 20px;
            background-color: #008CBA;
            color: white;
            border-radius: 8px;
            /* border: 2px solid #4CAF50; */
            /* Green */
        }

        .button1:hover {
            font-family: Microsoft JhengHei;
            font-size: 20px;
            border: 2px solid #008CBA;
            background-color: white;
            border-radius: 8px;
            /* Green */
            color: black;
            cursor: pointer;
        }


</style>
<script>
window.onload=function(){
    document.getElementById("email").addEventListener("click",function(){
        this.placeholder="";
    })
    document.getElementById("email").addEventListener("blur",function(){
        this.placeholder="請輸入email";
    })
    document.getElementById("password").addEventListener("click",function(){
        this.placeholder="";
    }
    )
    document.getElementById("password").addEventListener("blur",function(){
        this.placeholder="請輸入密碼Password";
    }
    )
}


</script>
<body >
    
    <div class="allpage">
        <div class="head">
            <img class="img1" src="images/amahuang2.png">

        </div>

        <div class="block1">
                <img class="img2" src="images/lulu.jpg">
    
        </div>
        

        <div class="form">
        
            <form action="<c:url value="/login.controller"></c:url>" method="get">
                <fieldset >
                    <div class="register">
                        管理員登入
                    </div>
                    <div  class="rows">
                            <input id="email" name="id" type="text"  size="30px" style="font-size:20px" placeholder="請輸入email">
                    </div>
                    <div class="rows">
                            <input id="password" name="password" type="password" size="30px"  style="font-size:20px" placeholder="請輸入密碼Password">
                    </div>

                    <div class="rows" >
                    	<input type="submit">
<!--                          <button class="button1">登入</button>&nbsp&nbsp -->
                          <a href="">忘記密碼?</a>&nbsp&nbsp
                           <a href="register.jsp">還沒註冊?</a>

                            
                    </div>

                    <div class="rows" >
                            <input type="checkbox" id="check1" > <label for="check1">記住我</label>
                               
                    </div>


                        
                        

                </fieldset>
                    

            </form>

        </div>


    </div>
</body>
</html>