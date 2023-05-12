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

    <link rel="stylesheet" href="/assets/css/login.css">

</head>

<body>
<div class="wrap">
    <section class="loginPage">
        <h1><img src="/assets/img/logo-instagram.png" alt="로고이미지" id="petstaLogo">Petstagram</h1>
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
            <a href="/login/signUp.jsp" class="noneunderline">
                <p>Don't have an account?
                    <strong style="color:rgb(89, 166, 221)"> Sign up</strong>
                </p>
            </a>
        </button>
    </section>
</div>
</body>
</html>

