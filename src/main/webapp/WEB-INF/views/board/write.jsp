<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>게시판 글쓰기</title>

    <%@ include file="../include/static-head.jsp" %>

    <!-- ck editor -->
    <script src="https://cdn.ckeditor.com/4.17.2/standard/ckeditor.js"></script>
    <style>
        .form-container {
            width: 500px;
            margin: auto;
            padding: 20px;
            background-image: linear-gradient(135deg, #a1c4fd, #fbc2eb);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border-radius: 4px;
            font-size: 18px;
        }

        .form-container h1 {
            font-size: 40px;
            font-weight: 700;
            letter-spacing: 10px;
            text-align: center;
            margin-bottom: 20px;
            color: #ffffff;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-size: 20px;
        }

        input[type="text"],
        textarea {
            font-size: 18px;
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            border: 2px solid #ffffff;
            border-radius: 8px;
            margin-bottom: 10px;
            background-color: rgba(255, 255, 255, 0.8);
        }

        textarea {
            resize: none;
            height: 200px;
        }

        .buttons {
            display: flex;
            justify-content: flex-end;
            margin-top: 20px;
        }

        button {
            font-size: 20px;
            padding: 10px 20px;
            border: none;
            margin-right: 10px;
            background-color: #4caf50;
            color: white;
            cursor: pointer;
            border-radius: 4px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s;
        }

        button.list-btn {
            background: #e61e8c;
        }

        button:hover {
            background-color: #3d8b40;
        }

        button.list-btn:hover {
            background: #e61e8c93;
        }

        .attachedImg {
        margin-bottom: 70px;
        text-align: center;
    }
    .attachedImg label {
        font-weight: 700;
        font-size: 1.2em;
        cursor: pointer;
        color: rgb(140, 217, 248);
    }
    .attachedImg .thumbnail-box {
        width: 200px;
        height: 200px;
        border-radius: 50%;
        overflow: hidden;
        margin: 30px auto 10px;
        cursor: pointer;
    }
  
    .attachedImg .thumbnail-box img {
        width: 200px;
        height: 200px;
    }

    </style>
</head>

<body>
    <%-- <%@ include file="../include/header.jsp" %> --%>

    <div id="wrap" class="form-container">
        <h1>꾸러기 게시판 글쓰기</h1>
        <form action="/board/write" method="post" enctype="multipart/form-data">
            <label for="likes">좋아요 수</label>
            <input type="text" id="likes" name="likes" required />
            <div class="attachedImg">
                <div class="thumbnail-box">
                    <img src="/assets/img/dog.png" alt="프로필 썸네일">
                </div>
    
                <label>첨부 이미지 추가</label>
    
                <input 
                    type="file"
                    id="attached-img" 
                    accept="image/*"
                    style="display: none;"
                    name="attachedImg"
                >
            </div>
            <label for="content">글내용</label>
            <textarea id="content" name="content" maxlength="200" required></textarea>
            <div class="buttons">
                <button class="list-btn" type="button" onclick="window.location.href='/board/list'">
                    목록
                </button>
                <button type="submit">글쓰기</button>
            </div>
        </form>
    </div>
    <script>
        // 프로필 사진 관련 스크립트
        const $profile = document.querySelector('.attachedImg');
        const $fileInput = document.getElementById('attached-img');

        // 프로필 추가 영역 클릭 이벤트
        $profile.onclick = e => {
            $fileInput.click();
        };

        // 프로필 사진 선택시 썸네일 이벤트
        $fileInput.onchange = e => {
            // 첨부한 파일의 데이터를 읽어오기
            const fileData = $fileInput.files[0];
            // console.log(fileData);

            // 첨부파일의 바이트데이터를 읽어들이는 객체 생성
            const reader = new FileReader();

            // 파일의 바이트데이터를 읽어서 img태그의 src속성이나
            // a태그의 href속성에 넣기 위한 형태로 읽음
            reader.readAsDataURL(fileData);

            // 첨부파일이 등록되는 순간 img태그에 이미지를 세팅
            reader.onloadend = e => {
                const $imgTag = document.querySelector('.thumbnail-box img');
                $imgTag.setAttribute('src', reader.result);
            };
        };
    </script>
</body>

</html>