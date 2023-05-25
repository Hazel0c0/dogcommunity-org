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

  <!--공통 JSP-->
  <%@ include file="../include/static-head.jsp" %>
  <!--로그인 CSS-->
  <link rel="stylesheet" href="/assets/css/login.css">

</head>

<body>
<div class="wrap">
  <form action="/user/login" name="login" method="post">
    <section class="loginPage">
      <h1><img src="/assets/img/logo-instagram.png" alt="로고이미지" id="petstaLogo">Petstagram</h1>
      <input type="text" placeholder="아이디 " class="logInPart" name="id">
      <input type="password" placeholder="비밀번호" class="logInPart" name="pwd">
      <label for="auto-login">
        <em>
          자동 로그인 <input type="checkbox" id="auto-login" name="autoLogin">
        </em>
      </label>
      <input type="submit" id="logInBtn" value="Log In"
             style="  background: rgb(61, 61, 227); color: white; letter-spacing: 2px; margin-top: 10px;">
    </section>

    <a id="custom-login-btn" href="/kakao/login">
      <img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="250"/>
    </a>

    <section class="loginOtherWay">
      <div>
        <div class="or"> OR</div>
      </div>
      <div>
        <a href="https://www.facebook.com/" class="loginFB"><span class="fab fa-facebook"></span> Log in with
          Facebook</a>
      </div>
      <div>
        <a href="#" class="forgotPwd">Forget password?</a>
      </div>
    </section>
  </form>
  <section class="joinUs">
    <button class="makeAccount" style="border-color: darkgrey;">
      <a href="/user/join">
        <p>Don't have an account?
          <strong style="color:rgb(89, 166, 221)"> Sign up</strong>
        </p>
      </a>
    </button>
  </section>
</div>
<script>

  const serverMessage = '${msg}';
  console.log('msg:' + serverMessage);

  if (serverMessage == 'NO_ACC') {
    alert('회원가입부터 하십시오.');
  } else if (serverMessage == 'NO_PW') {
    alert('비밀번호가 틀렸습니다.');
  }


</script>
</body>
</html>

