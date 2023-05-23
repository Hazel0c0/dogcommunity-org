<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <!--메인 화면 공통 부분 JSP-->
    <%@ include file="../include/header.jsp" %>
    <!-- css -->
    <link rel="stylesheet" href="/assets/css/main-static.css">

</head>
<style>
    @import url(https://fonts.googleapis.com/css?family=Montserrat);


    section {
        width: 50%;
        /*border: 4px solid red;*/
        margin-top: 180px;
        margin-left: 100px;
        padding: 20px;
        border-radius: 10px;
        border: 3px solid hotpink;
        background: url('/assets/img/feet.jpg');
        background-size: cover;
    }

    .base-container {
        width: 100%;
    }

    .friend-text-div {
        display: flex;
        margin-left: 0.5rem;
    }

    .friend-text-div>img {
        height: 3rem;
        align-self: flex-end;
        border-radius: 50%;
    }

    .friend-text-container {
        width: 10rem;
        display: flex;
        flex-direction: column;
    }

    .friend-text {
        background: #262626;
        border-radius: 0.5rem;
        color: #fff;
        height: fit-content;
        width: fit-content;
        padding: 0.5rem 1rem;
        margin: 0.12rem 0.5rem;
    }

    .my-text-div {
        display: flex;
        justify-content: flex-end;
    }

    .my-text-container {
        display: flex;
        flex-direction: column;
        align-items: flex-end;
    }

    .my-text {
        background: linear-gradient(180deg,
        rgba(139, 47, 184, 1) 0%,
        rgba(103, 88, 205, 1) 51%,
        rgba(89, 116, 219, 1) 92%) no-repeat center;
        background-attachment: fixed;
        color: #fff;
        border-radius: 0.5rem 0.2rem 0.2rem 0.5rem;
        height: fit-content;
        width: fit-content;
        padding: 0.5rem 1rem;
        margin: 0.12rem 0.5rem;
    }

    .my-text-container>div:first-child {
        border-radius: 0.5rem 1rem 0.2rem 0.5rem;
    }

    .my-text-container>div:last-child {
        border-radius: 0.5rem 0.2rem 1rem 0.5rem;
    }

    .friend-text-container>div:first-child {
        border-radius: 1rem 0.5rem 0.2rem 0.5rem;
    }

    .friend-text-container>div:last-child {
        border-radius: 0.5rem 0.2rem 0.5rem 1rem;
    }

    /*  아래 대화를 전송하는 창 */

    .chat-container {
        margin-top: 50px;
        display: flex;
        flex-direction: column;

    }

    .message-input {
        margin-top: 10px;
        display: flex;
    }

    .message-input input[type="text"] {
        flex: 1;
        padding: 5px;
        border: none;
        border-radius: 5px;
        border: 2px solid rgb(208, 77, 121);
    }

    .message-input button {
        margin-left: 10px;
        padding: 5px 10px;
        border: none;
        border-radius: 5px;
        background-color: rgb(224, 125, 141);
        color: white;
    }

    .message-input button:hover {
        background-color: rgb(210, 57, 83);
    }

    .chat-log {
        margin-top: 10px;
    }

    .chat-log .message {
        margin-bottom: 5px;
        padding: 5px;
        border-radius: 5px;
        background-color: #f1f1f1;
    }

    .chat-log .my-text {
        background: linear-gradient(180deg,
        rgba(139, 47, 184, 1) 0%,
        rgba(103, 88, 205, 1) 51%,
        rgba(89, 116, 219, 1) 92%) no-repeat center;
        background-attachment: fixed;
        color: #fff;
        border-radius: 0.5rem 0.2rem 0.2rem 0.5rem;
        height: fit-content;
        width: fit-content;
        padding: 0.5rem 1rem;
        margin: 0.12rem 0.5rem;
        float: right;
    }

</style>

<body>
<section>
    <div class="base-container">
        <div class="friend-text-div">
            <img src="/assets/img/poodle.jpeg" alt="말거는 강아지 이미지">
            <div class="friend-text-container">
                <div class="friend-text">안녕!</div>
                <div class="friend-text">나는 미미라고해!</div>
                <div class="friend-text">만나서 반가워!</div>
            </div>
        </div>
        <div class="my-text-div">
            <div class="my-text-container">
                <div class="my-text">미미 안뇽!</div>
                <div class="my-text">나는 뭉치라고해</div>
                <div class="my-text">나는 불독인데 너는 뭐니?</div>
            </div>
        </div>
        <div class="friend-text-div">
            <img src="/assets/img/poodle.jpeg " alt="말거는 강아지 이미지">
            <div class="friend-text-container">
                <div class="friend-text">나는 푸들!</div>
                <div class="friend-text">혹시 나랑 산책갈래?</div>
            </div>
        </div>
        <div class="my-text-div">
            <div class="my-text-container">
                <div class="my-text">그럴까?</div>
                <div class="my-text">우리 동내에 사는구나!</div>
                <div class="my-text">같이 산책가자 ㅎ</div>
            </div>
        </div>
    </div>

    <!-- Chat Interface -->
    <div class="chat-container">
        <div class="chat-log"></div>
        <div class="message-input">
            <input type="text" placeholder="메세지를 작성하세요" />
            <button onclick="sendMessage()">Send</button>
        </div>
    </div>
</section>

<script>
    function sendMessage() {
        const input = document.querySelector('.message-input input[type="text"]');
        const message = input.value;

        if (message.trim() !== '') {
            const chatLog = document.querySelector('.chat-log');
            const newMessage = document.createElement('div');
            newMessage.classList.add('message', 'my-text');
            newMessage.textContent = message;
            chatLog.appendChild(newMessage);

            const lineBreak = document.createElement('br');
            chatLog.appendChild(lineBreak);
            chatLog.appendChild(lineBreak.cloneNode());
            input.value = '';
        }
    }

    function handleKeyPress(event) {
        if (event.keyCode === 13) { // Check if the Enter key is pressed (keyCode 13)
            sendMessage();
        }
    }

    document.addEventListener('DOMContentLoaded', function () {
        const input = document.querySelector('.message-input input[type="text"]');
        input.addEventListener('keypress', handleKeyPress);
    });
</script>
</body>

</html>