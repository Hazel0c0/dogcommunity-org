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
</head>
<style>
    @import url(https://fonts.googleapis.com/css?family=Montserrat);

    section {
        width: 50%;
        /*border: 4px solid red;*/
        margin-top: 200px;
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

    /* 메세지 보낼때 시간찍혀 보내지는 글씨 크기 및 위치 조정 */
    .timestamp {
        text-align: right;
        font-size: 80%;
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
    </div>
    <!-- Chat Interface -->
    <div class="chat-container">
        <div class="chat-log"></div>
        <div class="message-input">
            <input type="text" placeholder="보내실 메세지를 작성하세요">
            <select id="pet-select">
                <option value="1">미미</option>
                <option value="2">순한개</option>
                <option value="3">무는개</option>
            </select>
            <button onclick="sendMessage()">Send</button>
        </div>
    </div>
</section>

<script>
    // Pet numbers for the two pets
    const petNo1 = 1;
    const petNo2 = 2;
    const petNo3 = 3;

    // Pet names
    const petNames = {
        1: "미미",
        2: "순한개",
        3: "무는개"
    };

    // Message sending function
    function sendMessage() {
        const input = document.querySelector('.message-input input[type="text"]');
        const message = input.value.trim();
        const petSelect = document.getElementById('pet-select');
        const selectedPetNo = parseInt(petSelect.value);

        if (message !== '') {
            const chatLog = document.querySelector('.chat-log');
            const newMessage = document.createElement('div');
            newMessage.classList.add('message', 'my-text');
            newMessage.textContent = message;
            chatLog.appendChild(newMessage);

            const lineBreak = document.createElement('br');
            chatLog.appendChild(lineBreak);
            chatLog.appendChild(lineBreak.cloneNode());
            input.value = '';

            // Get current time
            let currentTime = new Date();
            const hours = currentTime.getHours().toString().padStart(2, '0');
            const minutes = currentTime.getMinutes().toString().padStart(2, '0');

            // Create timestamp message
            const selectedPetName = petNames[selectedPetNo];
            // fetch(`\${URL}/\${bno}/page/\${page}`)를 참고하여 작성하니 뜨더이다..
            const timestampMessage = `\${hours}:\${minutes} \${selectedPetName}에게 메시지를 보냈습니다.`;
            console.log(hours, minutes, selectedPetName);
            // Display timestamp in chat log
            const timestampElement = document.createElement('div');
            timestampElement.classList.add('timestamp');
            timestampElement.textContent = timestampMessage;
            chatLog.appendChild(timestampElement);

        }
    }

    // Message receiving function
    function receiveMessage(message, petNo) {
        const chatLog = document.querySelector('.chat-log');
        const newMessage = document.createElement('div');
        newMessage.classList.add('message', 'friend-text');
        newMessage.textContent = message + ' (From Pet ' + petNo + ')';
        chatLog.appendChild(newMessage);

        const lineBreak = document.createElement('br');
        chatLog.appendChild(lineBreak);
        // chatLog.appendChild(lineBreak.cloneNode());
    }

    // Handle key press event
    function handleKeyPress(event) {
        if (event.keyCode === 13) {
            sendMessage();
        }
    }

    document.addEventListener('DOMContentLoaded', function () {
        const input = document.querySelector('.message-input input[type="text"]');
        input.addEventListener('keypress', handleKeyPress);
    });


    // fetch 부분
    document.getElementById('insert').onclick = e => {

        // 요청 헤더와 요청 바디를 저장하는 객체
        const requestInfo = {
            method: 'POST',
            headers: {
                'content-type': 'application/json'
            },
            body: JSON.stringify({
                petNo: document.querySelector('[name=text]').value

            })
        };

        fetch('http://localhost:8585', requestInfo)
            .then(res => {
                if (res.status === 200) {
                    alert('등록 성공!');
                    return res.json();
                } else {
                    alert('등록 실패!');
                }
            })
            .then(result => {
                console.log(result);
            });
    };




</script>
</body>

</html>

