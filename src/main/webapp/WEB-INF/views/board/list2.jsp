<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">


<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert title here</title>

    <%@ include file="../include/static-head.jsp" %>


    <script src="side-menu.js" defer></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
    <!-- css -->
    <link rel="stylesheet" href="/assets/css/main.css">

</head>

<body>

    <!--  모달 창 -->

    <section class="backgr" style="display: none;">


        <!-- 닫기 버튼 -->
        <div class="xbutton" id="xbutton"><button><i class="bi bi-x-lg"></i></button></div>
        <!-- 상세보기 모달 창 -->
        <div class="my-modal" id="modal">
            <!-- 이미지 박스  -->
            <div class="modal-imgbox bdrr">
                <img src="../petstagram/뭉치.jpg" alt="#">
            </div>

            <!-- 본문 내용 박스 -->
            <div class="modal-mainbox bdrr">
                <!-- 프로필 사진 및 작성자 닉네임 박스 -->
                <div class="card-title topmini">
                    <div class="modal-miniprofile"><img src="../petstagram/불독2.png" alt="#" class="profile"></div>
                    <div class="modal-profile">
                        <h1 class="modal-nickname">뭉치</h1>
                    </div>
                </div>

                <!-- 본문 내용 -->
                <div class="modal-content">
                    <!-- 유저 프로필 및 작성 내용 보여주는 박스 -->
                    <div class="user-Content">
                        <div class="card-title">
                            <div class="modal-miniprofile"><img src="../petstagram/불독2.png" alt="#" class="profile">
                            </div>
                            <h1 class="modal-nickname">뭉치</h1>
                            <div class="modal-text"> 하하하하하하하</div>
                        </div>

                    </div>

                    <!-- 사용자 및 다른 사용자가 작성한 댓글 목록 -->
                    <div class="usersReply">
                        <!-- 댓글 내용 박스 -->
                        <div id="replyCollpase" class="replycard">
                            <div id="replyData">
                                <!-- Js로 댓글 정보 DIV  -->
                                <!-- 닉네임 및 댓글내용 (15자 이상 자세히보기) -->
                                <!-- 기본으로 15개 보여주고 넘어갈시 페이징으로 불러오기 해야함 -->
                            </div>
                            <!-- 댓글 페이징 영역 -->
                            <div id="replyPlus">
                                <ul class="pagination">
                                    <!-- Js로 페이징 버튼 만들기 -->
                                    <!-- 버튼 누르면 댓글 더 불러오기 -->
                                    <!-- 안되면 다음 페이지로 넘어가게 만들기 -->
                                </ul>
                            </div>
                        </div>
                    </div>

                </div>

                <!-- 버튼 담는 박스 -->
                <section class="eventbuttons">
                    <!-- 버튼 담는 박스 -->
                    <div class="th">
                        <span class="aamw"><button class="abl"><i class="bi bi-heart"></i></button></span>
                        <!-- 좋아요 버튼-->
                        <span class="aamx"><button class="abl"><i class="bi bi-chat"></i></button></span>
                        <!-- 댓글 버튼-->
                        <span class="aamy"><button class="abl"><i class="bi bi-messenger"></i></button></span>
                        <!-- 메세지 버튼-->
                    </div>
                    <div class="tj">
                        <span class="aamz"><button class="abl"><i class="bi bi-lightning"></i></button></span>
                        <!-- 저장 버튼 (보류) viewcount 로 대체예정-->
                    </div>
                </section>
                <div class="userlikes">좋아요 누른사람 보기</div>
                <!-- 댓글 입력 박스 -->
                <div class="row" id="replies">
                    <!-- 댓글 작성 카드 -->
                    <div class="modal-card">
                        <div class="xh xx">
                            <label for="newReplyText" hidden>댓글 내용</label>
                            <textarea name="replyText" id="newReplyText" cols="1" rows="1"
                                placeholder="댓글달기.."></textarea>
                        </div>
                        <div class="inputbutton xh" role="button">게시</div>
                    </div>
                </div>


            </div>
        </div>
    </section>


    <!-- 서브 모달도 앱솔루트 z index 줘서 위치 조정해야함 모달은 무조건 body 밑에 깔아야함-->

    <section class="like" style="display: none;">
        <div class="bodymodal">
            <div class="xbutton"><button><i class="bi bi-x-lg"></i></button></div>
            <div class="titlelike">좋아요</div>
            <div class="text">userNickName 님은 이 게시물을 좋아한 총 사람 수를 볼 수 있습니다.</div>
            <div class="likebody">
                <!-- jsp로 좋아요 누른 사람들 나오게 만들어야함 -->
                <div class="users">
                    <div class="modal-miniprofile"><img src="../petstagram/불독2.png" alt="#" class="profile"></div>
                    <div class="modal-profile">
                        <h1 class="modal-nickname">뭉치</h1>
                    </div>
                </div>
                <!-- jsp로 좋아요 누른 사람들 나오게 만들어야함  -->
            </div>
        </div>
    </section>
    <!-- header -->
    <header>
        <div class="inner-header">
            <h1 class="logo">
                <a href="main.html">
                    <img src="/src/main/resources/static/assets/img/logo-instagram.png" alt="로고이미지">
                </a>
            </h1>
            <h2 class="intro-text"><a href="main.html">Petstagram</a></h2>
            <a href="#" class="menu-open">
                <span class="menu-txt">MENU</span>
                <span class="lnr lnr-menu"></span>
            </a>
        </div>

        <nav class="gnb">
            <a href="#" class="close">
                <span class="lnr lnr-cross"></span>
            </a>
            <ul>
                <li><a href="#"><span class="lnr lnr-home"> 홈</span></a></li>
                <li><a href="#"><span class="lnr lnr-magnifier"> 검색</span></a></li>
                <li><a href="#"><span class="lnr lnr-map"> 내 주변 친구</span></a></li>
                <li><a href="#"><span class="lnr lnr-heart"> 자랑하기</span></a></li>
                <li><a href="#"><span class="lnr lnr-bubble"> 메시지</span></a></li>
                <li><a href="#"><span class="lnr lnr-alarm"> 알림</span></a></li>
                <li><a href="/pet/profile"><span class="lnr lnr-user"> 프로필</span></a></li>
            </ul>
        </nav>
    </header>



    <!--main sidebar-->
    <aside class="sidebar">
        <div class="profile-box">
            <div class="profile-img"><a href=""></a></div>
            <h3><a href="">멍뭉이</a></h3>
            <p id="profileIntro"> #왈왈으르릉 #가까이오지마</p>
        </div>
    </aside>


    <!-- body -->

    <section id="boxRow1">

        <c:forEach var="b" items="${bList}">

            <div id="card-container">
                <!--메인박스-->
                <div id="card-wrapper">
                    <!-- 메인박스 안 작은박스-->
                    <section id="card" data-bno="${b.boardNo}">
                        <!-- 실제 내용을 담는 박스-->
                        <div class="card-title">
                            <!-- 사용자 이름 박스 시작-->
                            <div class="miniprofile"><img src="${b.petPhoto}" alt="#"></div>
                            <div class="profile">
                                <h1 class="nickname">${b.petName}</h1>
                            </div>

                        </div> <!-- 사용자 이름 박스 끝-->
                        <div class="card-img"><img src="${b.attachedImg}" alt="#"></div> <!-- 이미지-->

                        <div class="card-content">
                            <!-- 게시글 내용 시작 -->

                            <section class="eventbuttons">
                                <!-- 버튼 담는 박스 -->
                                <div class="th">
                                    <span class="aamw"><button class="abl"><i class="bi bi-heart"></i></button></span>
                                    <!-- 좋아요 버튼-->
                                    <span class="aamx"><button class="abl"><i class="bi bi-chat"></i></button></span>
                                    <!-- 댓글 버튼-->
                                    <span class="aamy"><button class="abl"><i
                                                class="bi bi-messenger"></i></button></span>
                                    <!-- 메세지 버튼-->
                                </div>
                                <div class="tj">
                                    <span class="aamz"><button class="abl"><i
                                                class="bi bi-lightning"></i></button></span>
                                    <!-- 저장 버튼 (보류) viewcount 로 대체예정-->
                                </div>
                            </section>
                            <div class="card-text">${b.petName} , ${b.shortContent}</div> <!-- 작성내용   -->
                            <div class="regdate"> ${b.boardDateTime} 작성일자시간</div>
                        </div> <!-- 게시글 내용 끝-->
                    </section>
                </div>
            </div>
        </c:forEach>

    </section>
    <!--// body-->



    <script>
        const $boxRow1 = document.getElementById('boxRow1');
        const $cardContainer = document.getElementById('card-container');

        const $backgr = document.querySelector('.backgr');
        const modal = document.querySelector('.my-modal');
        const $closebutton = document.getElementById('xbutton');

        $boxRow1.addEventListener('click', e => {
            // console.log(e.target);

            // e.preventDefault();

            if (e.target.matches('.card-img img')) {
                // console.log('detail 클릭 !');
                $backgr.style.display = 'block';

                // 닫기버튼
                // closebutton.onclick = e => {
                //     $backger.style.display = 'none';
                // }

            }
            // 닫기버튼
            $closebutton.addEventListener('click', e => {
                console.log(e.target);
                if(e.target.matches('.xbutton button')){
                    console.log('button 클릭!')
                    $backgr.style.display = 'none';
                }
            })

        });

        // 좋아요 누른사람 확인하는 모달
        
        // 좋아요 버튼
        const $userLikes = document.querySelector('.like');
        // const $userlikesButton = document.querySelector('.backgr');

        const replymodal = document.querySelector('.bodymodal');

        $backgr.addEventListener('click', e => {
            console.log(e.target)
            if(e.target.matches('.userlikes')){
                $userLikes.style.display = 'block';
            }
        })



    </script>
</body>




</html>