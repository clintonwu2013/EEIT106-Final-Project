<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>註冊</title>
</head>
<style>
    .allpage {
        width: 1200px;
        margin: auto;

    }

    .head {

        height: 100px;

        border-bottom: 5px solid #FFEE99;
        /* background-color: red; */


    }

    .img1 {
        /* margin-bottom: 0px; */
        width: 300px;
        height: auto;
        /* padding-top:0px;
        padding-bottom: 0px; */

        padding-top: 35px;
        padding-left: 150px;

    }

    .block1 {
        width: 400px;
        margin-left: 70px;
        float: left;
        margin-right: 40px
    }

    .img2 {
        margin-top: 50px;
        width: 100%;
        height: auto;

    }

    .form {
        margin-top: 50px;
        padding-left: 30px;
        margin-right: 100px;
    }

    .rows {
        margin-top: 25px;
        margin-bottom: 25px;
        margin-left: 45px;
        font-size: 20px;
    }

    .register {
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

    body {
        font-family: Microsoft JhengHei;
    }
</style>
<script>
    window.onload = function () {

        document.getElementById("name").addEventListener("click", function () {
            this.placeholder = "";
        })
        document.getElementById("name").addEventListener("blur", function () {
            this.placeholder = "請輸入您的姓名";
        })

        document.getElementById("birth").addEventListener("click", function () {
            this.placeholder = "";
        })
        document.getElementById("birth").addEventListener("blur", function () {
            this.placeholder = "請輸入您的生日";
        })


        document.getElementById("email").addEventListener("click", function () {
            this.placeholder = "";
        })
        document.getElementById("email").addEventListener("blur", function () {
            this.placeholder = "請輸入您的email";
        })
        document.getElementById("password").addEventListener("click", function () {
            this.placeholder = "";
        }
        )
        document.getElementById("password").addEventListener("blur", function () {
            this.placeholder = "請輸入密碼(至少8個字元)";
        }
        )

        document.getElementById("passwordcheck").addEventListener("click", function () {
            this.placeholder = "";
        }
        )
        document.getElementById("passwordcheck").addEventListener("blur", function () {
            this.placeholder = "請再輸入一次密碼";
        }
        )
    }


</script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.9.1.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet" href="http://jqueryui.com/resources/demos/style.css">
<script>
    $(function () {
        //設定中文語系
        $.datepicker.regional['zh-TW'] = {
            dayNames: ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"],
            dayNamesMin: ["日", "一", "二", "三", "四", "五", "六"],
            monthNames: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
            monthNamesShort: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
            prevText: "上月",
            nextText: "次月",
            weekHeader: "週"
        };
        //將預設語系設定為中文
        $.datepicker.setDefaults($.datepicker.regional["zh-TW"]);
        //套用到表單
        $("#birth").datepicker(
            {
                dateFormat: 'yy-mm-dd',
                changeYear: true,
                changeMonth: true,
                yearRange: 'c-100:c'//前30年和后10年

            }
        );
    });


</script>

<body>

    <div class="allpage">
        <div class="head">
            <img class="img1" src="images/amahuang2.png">

        </div>

        <div class="block1">
            <img class="img2" src="images/register.jpg">

        </div>


        <div class="form">
            <form>
                <fieldset>
                    <div class="register">
                        註冊成為會員
                    </div>

                    <div class="rows">
                        姓名: <input id="name" type="text" size="30px" style="font-size:20px" placeholder="請輸入您的姓名">
                    </div>

                    <div class="rows">
                        生日: <input id="birth" type="text" size="30px" style="font-size:20px" placeholder="請輸入您的生日">
                    </div>

                    <div class="rows">
                        性別: <input type="radio" name="gender" value="male" id="male"> <label for="male">男</label>
                        &nbsp&nbsp<input type="radio" name="gender" value="female"> <label for="female">女</label>
                    </div>


                    <div class="rows">
                        E-mail: <input id="email" type="text" size="30px" style="font-size:20px"
                            placeholder="請輸入您的email">
                    </div>
                    <div class="rows">
                        密碼: <input id="password" type="password" size="30px" style="font-size:20px"
                            placeholder="請輸入密碼(至少8個字元)">
                    </div>
                    <div class="rows">
                        確認密碼: <input id="passwordcheck" type="password" size="30px" style="font-size:20px"
                            placeholder="請再輸入一次密碼">
                    </div>

                    <div class="rows">
                        <button class="button1">確認送出</button>&nbsp&nbsp




                    </div>







                </fieldset>


            </form>

        </div>


    </div>
</body>

</html>