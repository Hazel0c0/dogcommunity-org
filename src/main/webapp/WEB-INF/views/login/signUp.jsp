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
    <link rel="stylesheet" href="../../common.css">

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
        background-image: url('/img/bulldog.jpg');
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

    .loginWrap {
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

    section>* {
        width: 80%;
        margin: 3px auto;
        border-radius: 5px;
    }
    /* 상단부 페북으로 로그인 */

    section.logInwithFB{
        /* border: 1px solid #000; */
        padding-bottom: 0;
        line-height: 30px;
    }

    section.logInwithFB h1 {
        /* border: 1px solid #000; */
        color: black;
        margin-top: 20px;
        margin-bottom: 20px;
    }

    section.logInwithFB #petstaLogo {
        width: 50px;
        /* border: 1px solid #000; */
        margin-right: 20px;
        margin-left: -5%;
        margin-bottom: 10px;
    }

    section.logInwithFB>* {
        /* border: 1px solid #000; */
        font-weight: bold;
        margin-bottom: 10px;
    }

    section.logInwithFB button {
        background: rgb(61, 61, 227);
    }

    section.logInwithFB .loginFB {
        color: white;
        font-weight: 500;
        /* font-size: 1.2em; */
    }
    /* 회원가입 양식 */
    section.signUpPage {
        display: flex;
        flex-direction: column;
        /* margin: 10px; */
        /* border: 3px solid blue; */

    }

    section.signUpPage input {
        line-height: 40px;
    }

    section.signUpPage button {
        background: rgb(61, 61, 227);
        color: white;
        font-weight: 500;
        letter-spacing: 2px;
        margin-top: 10px;
    }

    /* 하단부 로그인 */
    section.logIn>* {
        width: 90%;
        font-size: 1.2em;
        background: white;
    }

    section.logIn p {
        /* border: 1px solid #000; */
        margin-top: 20px;
    }
</style>
<body>
<div class="loginWrap">
    <section class="logInwithFB">
        <h1><img src="/img/logo-instagram.png" alt="로고이미지" id="petstaLogo">Petstagram</h1>
        <p>Sign up to see photos and videos from your friends</p>
        <button>
            <a href="https://www.facebook.com/" class="loginFB"><span class="fab fa-facebook"></span> Log in with Facebook</a>
        </button>
        <div>
            <div class="or"> OR </div>
        </div>
    </section>
    <section class="signUpPage">
        <input type="text" placeholder="전화번호 또는 이메일" name="phoneOrEmail" class="inlineToBlock">
        <input type="text" placeholder="주소" name="addr" class="inlineToBlock">
        <input type="text" placeholder="사용자 이름" name="userName" class="inlineToBlock">
        <input type="text" placeholder="아이디" name="id" class="inlineToBlock">
        <input type="text" placeholder="비밀번호" name="pwd" class="inlineToBlock">
        <button class="inlineToBlock ordinaryLogin unactivatedLoginColor">Sign Up</button>
        <p>By signing up, you agree to our Terms, Data Policy and Cookies Policy.</p>
    </section>
    <section class="logIn">
        <button class="haveAccount" style="border-color: darkgrey;">
            <a href="login.html" class="noneunderline">
                <p>Have an account?
                    <strong style="color:rgb(89, 166, 221)"> Log in</strong>
                </p>
            </a>
        </button>
    </section>
</div>
</body>
</html>