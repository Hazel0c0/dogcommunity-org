<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <!-- common css -->
    <link rel="stylesheet" href="/assets/css/common.css">

    <!-- reset -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">

    <!-- fontawesome css: https://fontawesome.com -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">

    <!-- https://linearicons.com/free#cdn -->
    <link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">

    <!-- bootstrap css 와 js를 같이 넣어야지 적용 됨 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<style>
    /* CSS 코드 */
    @keyframes moveBackground {
        0% {
            background-position: 0% 30%;
        }

        100% {
            background-position: 0% 0%;
        }
    }

    body {
        background-image: url('/static/assets/img/bulldog.jpg');
        background-size: 700px 500px;
        animation: moveBackground 10s linear infinite;
    }

    /* body {
        background: rgb(236, 181, 92);
        color: gray;
    } */

    a {
        color: inherit;
        text-decoration: none;
    }

    .wrap {
        background: rgba(255, 255, 255, 0.955);
        /* border: 1px solid black; */
        border-radius: 10px;
        width: 27%;
        margin: 150px auto;
        text-align: center;
    }

    section {
        /* border: 3px solid red; */
        padding: 25px;

    }

    section.loginPage {
        display: flex;
        flex-direction: column;
        /* margin: 10px; */
        /* border: 3px solid blue; */

    }

    section>* {
        width: 70%;
        margin: 3px auto;
        border-radius: 5px;
    }

    section.loginPage h1 {
        /* border: 1px solid #000; */
        color: black;
        margin-top: 20px;
        margin-bottom: 20px;
        font-weight: 700;
    }

    section.loginPage #petstaLogo {
        width: 50px;
        /* border: 1px solid #000; */
        margin-right: 20px;
        margin-left: -5%;
        margin-bottom: 10px;
    }

    section.loginPage input {
        line-height: 35px;
    }

    section.loginPage button {
        background: rgb(61, 61, 227);
        color: white;
        letter-spacing: 2px;
        margin-top: 10px;
    }

    section.loginOtherWay>* {
        /* border: 1px solid #000; */
        font-weight: bold;
        margin-bottom: 10px;
    }

    section.loginOtherWay .loginFB {
        color: rgb(13, 13, 196);
        font-size: 1.2em;
    }

    section.loginOtherWay .forgotPW {
        color: rgb(89, 166, 221);
    }

    section.joinUs>* {
        width: 90%;
        font-size: 1.2em;
        background: white;
    }

    section.joinUs p {
        /* border: 1px solid #000; */
        margin-top: 20px;
    }
</style>
<body>
<div class="wrap">
    <section class="loginPage">
        <h1><img src="/static/assets/img/logo-instagram.png" alt="로고이미지" id="petstaLogo">Petstagram</h1>
        <input type="text" placeholder="전화번호, 이메일 또는 아이디 " class="logInPart" name="id">
        <input type="password" placeholder="비밀번호" class="logInPart" name="pwd">
        <button class="logInPart ordinaryLogin unactivatedLoginColor">Log In</button>
    </section>
    <section class="loginOtherWay">
        <div>
            <div class="or"> OR </div>
        </div>
        <div>
            <a href="https://www.facebook.com/" class="loginFB"><span class="fab fa-facebook"></span> Log in with
                Facebook</a>
        </div>
        <div>
            <a href="#" class="forgotPwd">Forget password?</a>
        </div>
    </section>
    <section class="joinUs">
        <button class="makeAccount" style="border-color: darkgrey;">
            <a href="/webapp/WEB-INF/views/login/sign-up.jsp" class="noneunderline">
                <p>Don't have an account?
                    <strong style="color:rgb(89, 166, 221)"> Sign up</strong>
                </p>
            </a>
        </button>
    </section>
</div>
</body>
</html>

