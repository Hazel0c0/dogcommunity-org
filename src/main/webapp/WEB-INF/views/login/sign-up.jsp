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

    <%@ include file="../include/static-head.jsp" %>
    <link rel="stylesheet" href="/assets/css/sign-up.css">
</head>

<body>
<div class="loginWrap">
    <section class="logInwithFB">
        <h1><img src="/assets/img/logo-instagram.png" alt="로고이미지" id="petstaLogo">Petstagram</h1>
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
            <a href="/user/login" class="noneunderline">
                <p>Have an account?
                    <strong style="color:rgb(89, 166, 221)"> Log in</strong>
                </p>
            </a>
        </button>
    </section>
</div>
</body>
</html>