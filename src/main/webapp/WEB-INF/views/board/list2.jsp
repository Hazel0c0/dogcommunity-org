<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">


<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert title here</title>

    <%@ include file="../include/header.jsp" %>


    <!-- <script src="side-menu.js" defer></script> -->

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
    <!-- css -->
    <link rel="stylesheet" href="/assets/css/body.css">


    <style>
        .bi-heart-fill {
            display: none;
            color: pink;
        }

        .bi-heart.active {
            display: none;
        }

        .bi-heart.active+.bi-heart-fill {
            display: inline-block;
        }

        /* 모달창 좋아요 끝 */


        /* 리스트창 좋아요 시작 */
        .abl2.bi-heart-fill {
            display: none;
            color: pink;
        }

        .abl2.bi-heart.active {
            display: none;
        }

        .abl2.bi-heart.active+.bi-heart-fill {
            display: inline-block;
        }
    </style>
</head>

<body>

    <!--  모달 창 -->
    <!-- <form var="b" items="b"> -->


    <section class="backgr" style="display: none;">




        <div class="my-modal" id="modal">

            <!-- 닫기 버튼 -->
            <div class="xbutton" id="xbutton"><button><i class="bi bi-x-lg"></i></button></div>
            <!-- 상세보기 모달 창 -->
            <!-- <form action="/board/list2" method="get"> -->

            <!-- 이미지 박스  -->
            <div class="modal-imgbox bdrr">
                <!-- <img src="${attachedImg}" alt="#"> -->

                <!-- setAttribute 로 값 전달 -->
                <img class="boardimg" alt="#">
            </div>

            <!-- 본문 내용 박스 -->
            <div class="modal-mainbox bdrr">
                <!-- 프로필 사진 및 작성자 닉네임 박스 -->
                <div class="card-title topmini">
                    <div class="modal-miniprofile">
                        <!-- setAttribute 값 전달 -->
                        <img alt="#" class="profile top"></div>
                    <div class="modal-profile">
                        <!-- setAttribute 값 전달 -->
                        <h1 class="modal-nickname NN1"></h1>
                    </div>
                </div>

                <!-- 본문 내용 -->
                <div class="modal-content">
                    <!-- 유저 프로필 및 작성 내용 보여주는 박스 -->
                    <div class="user-Content">
                        <div class="card-title">
                            <!-- setAttribute 값 전달 -->
                            <div class="modal-miniprofile">
                                <img alt="#" class="profile PF1">
                            </div>
                            <!-- setAttribute 값 전달 -->
                            <h1 class="modal-nickname NN2"></h1>
                            <!-- setAttribute 값 전달 -->
                            <div class="modal-text shorttext"></div>
                        </div>

                    </div>

                    <!-- 사용자 및 다른 사용자가 작성한 댓글 목록 -->
                    <div class="usersReply" id="replies">
                        <!-- 댓글 내용 박스 -->
                        <div id="replyCollpase" class="replycard">
                            <div id="replyData">
                                <div class="float-left"><span id="replyCnt"></span></div>
                                <!-- <div class="reply">
                                    <div class="reply-profile">
                                        <img src="#" alt="#">
                                    </div>
                                    <div class="reply-writer">정동관1</div>
                                    <div class="reply-content">캬캬캬캬캬캬캬캬</div>
                                </div> -->
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
                        <span class="aamw"><button class="abl a2">
                                <i class="bi bi-heart"></i>
                                <i class="bi bi-heart-fill"></i>
                            </button></span>
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
                    <!-- </form> -->



                </section>
                <div class="userlikes">좋아요 누른사람 보기</div>
                <!-- 댓글 입력 박스 -->
                <div class="row" id="replies1">
                    <!-- 댓글 작성 카드 -->
                    <div class="modal-card">
                        <div class="xh xx">
                            <label for="newReplyText" hidden>댓글 내용</label>
                            <textarea name="replyText" id="newReplyText" cols="1" rows="1" placeholder="댓글달기.."
                                style="overflow: hidden;"></textarea>
                        </div>
                        <button class="inputbutton xh" id="output">게시</button>
                        <!-- <div class="inputbutton xh" role="button" id="output">게시</div> -->
                    </div>
                </div>


            </div>
        </div>
    </section>
    <!-- </form> -->

    <!-- 서브 모달도 앱솔루트 z index 줘서 위치 조정해야함 모달은 무조건 body 밑에 깔아야함-->

    <section class="like" style="display: none;">
        <div class="bodymodal">
            <div class="likesbutton"><button><i class="bi bi-x-lg"></i></button></div>
            <div class="titlelike">좋아요</div>
            <div class="text">userNickName 님은 이 게시물을 좋아한 총 사람 수를 볼 수 있습니다.</div>
            <div class="likebody">
                <!-- jsp로 좋아요 누른 사람들 나오게 만들어야함 -->
                <div class="users">
                    <div class="modal-miniprofile"><img src="/local/${b.petPhoto}" alt="#" class="profile"></div>
                    <div class="modal-profile">
                        <h1 class="modal-nickname">뭉치</h1>
                    </div>
                </div>
                <!-- jsp로 좋아요 누른 사람들 나오게 만들어야함  -->
            </div>
        </div>
    </section>


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
                        <div class="card-img"><img src="${b.attachedImg}" alt="게시글 사진"></div> <!-- 이미지-->

                        <div class="card-content">
                            <!-- 게시글 내용 시작 -->

                            <section class="eventbuttons">
                                <!-- 버튼 담는 박스 -->
                                <div class="th">
                                    <span class="aamw">
                                        <button class="abl abl2">
                                            <i class="bi bi-heart"></i>
                                            <i class="bi bi-heart-fill"></i>
                                        </button>
                                    </span>
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
        const URL = '/replies';
        const boardNo = '${b.boardNo}';

        const $boxRow1 = document.getElementById('boxRow1');
        const $cardContainer = document.getElementById('card-container');

        const $backgr = document.querySelector('.backgr');
        const modal = document.querySelector('.my-modal');
        const $closebutton = document.getElementById('xbutton');

        $boxRow1.addEventListener('click', e => {
            // console.log(e.target);
            // e.preventDefault();
            // const boardNo = e.target.parentElement.previousElementSibling.textContent;
            const $boardNo = e.target.closest('#card').dataset.bno;
            const $petPhoto = e.target.closest('#card').querySelector('.miniprofile img').src;
            const $attachedImg = e.target.src;
            const $petName = e.target.closest('#card').querySelector('.nickname').textContent;

            const $shortContent = e.target.closest('#card').querySelector('.card-text').textContent;
            // console.log($shortContent);

            // 모달창에 정보 전달

            // 모달에 글번호붙이기
            modal.dataset.bno = $boardNo;

            // console.log(
            // `boardNo: \${boardNo}, petPhoto: \${petPhoto}, attachedImg: \${attachedImg}, petName: \${petName},shortContent : \${shortContent}`);
            // 게시글 이미지 전달 
            const $boardimg = document.querySelector('.boardimg');
            $boardimg.setAttribute('src', $attachedImg);
            // 상단 미니 프로필 1
            const $boardprofile = document.querySelector('.profile');
            $boardprofile.setAttribute('src', $petPhoto);
            // 상단 미니 프로필 2 
            const $boardprofile2 = document.querySelector('.PF1');
            $boardprofile2.setAttribute('src', $petPhoto);
            // 상단 닉네임 1
            const $boarduserNickName1 = document.querySelector('.NN1');
            // console.log($boarduserNickName1);
            $boarduserNickName1.textContent = $petName;
            // 상단 닉네임 2 
            const $boarduserNickName2 = document.querySelector('.NN2');
            $boarduserNickName2.textContent = $petName;
            // 게시판 글 내용
            const $boardtext = document.querySelector('.shorttext');
            $boardtext.textContent = $shortContent;

            // 댓글 부르기
            getReplyList($boardNo);


            if (e.target.matches('.card-img img')) {
                // console.log('detail 클릭 !');
                $backgr.style.display = 'block';
            }
            // 닫기버튼
            $closebutton.addEventListener('click', e => {
                // console.log(e.target);
                if (e.target.matches('.xbutton button i')) {
                    // console.log('button 클릭!')
                    $backgr.style.display = 'none';
                    tag = '';
                }
            })

        });

        // 좋아요 누른사람 확인하는 모달

        // 좋아요 버튼
        const $userLikes = document.querySelector('.like');
        // const $userlikesButton = document.querySelector('.backgr');

        const replymodal = document.querySelector('.bodymodal');

        const $likeclose = document.querySelector('.likesbutton')

        $backgr.addEventListener('click', e => {
            // console.log(e.target)
            if (e.target.matches('.userlikes')) {
                $userLikes.style.display = 'block';


            }
            // 닫기버튼
            $likeclose.addEventListener('click', e => {
                // console.log(e.target);
                if (e.target.matches('.bi')) {
                    $userLikes.style.display = 'none';
                }
            });

        });

       
        // 댓글 목록 렌더링 함수
        function renderReplyList({
            count,
            replies
        }) {

            // 총 댓글 수 렌더링
            // document.getElementById('replyCnt').textContent = count;

            let tag = "";

            if (replies === null || replies.length === 0) {
                tag += "댓글이 없습니다"

            } else {

                // 댓글 내용 렌더링
                // 각 댓글 하나의 태그
                for (let rep of replies) {
                    const {
                        petNo,
                        replyNo,
                        comment,
                        petPhoto,
                        petName
                    } = rep;

                    tag += " <div class='reply' id='replybox' data-replyId='" + replyNo + "'>" +
                        "<div class='reply-profile'>" +
                        "<img src='" + petPhoto + "' alt='프사'>" +
                        "</div>" +
                        "<div class='reply-writer'>" + petName + "</div>" +
                        "<div class='reply-content'>" + comment + "</div>" +
                        "</div>";

                }

                // 생성된 댓글 tag 렌더링
                document.getElementById('replyData').innerHTML = tag;


            }

        }
        // 댓글 목록 불러오기 함수
        function getReplyList(boardNo = 1) {

            fetch(`\${URL}/\${boardNo}`)
                .then(res => res.json())
                .then(responseResult => {
                    console.log(responseResult);
                    renderReplyList(responseResult);
                });

        }


//===============================좋아요 버튼=======================================

        const likeButton = document.querySelector('.aamw .abl');

        likeButton.addEventListener('click', function () {
            const heartIcon = likeButton.querySelector('.bi-heart');
            const fillHeartIcon = likeButton.querySelector('.bi-heart-fill');
            heartIcon.classList.toggle('active');
            fillHeartIcon.classList.toggle('active');
        });



        const likeButton2 = document.querySelector('.aamw .abl2');

        likeButton.addEventListener('click', function () {
            event.stopPropagation();
            const heartIcon2 = likeButton2.querySelector('.bi-heart-main');
            const fillHeartIcon2 = likeButton2.querySelector('.bi-heart-fill-main');
            heartIcon2.classList.toggle('active');
            fillHeartIcon2.classList.toggle('active');
        });

//======================================================================

        // 댓글 등록 처리 이벤트 함수
        function makeReplyRegisterClickEvent() {

            //  댓글 게시 버튼
            // const $regBtn = document.getElementById('inputbutton');
            const $regBtn = document.getElementById('output');
            // console.log('btn:',$regBtn);
            $regBtn.addEventListener('click', e => {

                // console.log("댓글쓰기버튼 누름!");
                //  댓글 입력창
                const $rt = document.getElementById('newReplyText');
             
               
                // console.log($rt.value);

                // 입력 값 검증 == 시작 == 

                // 입력 값 검증 === 끝 ===
            
                        // 서버로 보낼 데이터
                        const payload = {
                            comment: $rt.value,
                            boardNo: modal.dataset.bno
                        };
              
                      const requestInfo = {
                    method : 'POST',
                    Headers : {
                        'content-Type': 'application/json'
                    },
                    body: JSON.stringify(payload)
                }
                // console.log(payload);
                // console.log(requestInfo);


                        // 댓글 등록 요청 보내기
                        fetch('/replies', {
                                method: 'POST',
                                headers: {
                                    'content-Type': 'application/json',
                                },
                                body: JSON.stringify(payload)
                            })
                            .then(response => response.json())
                            .then(responseData => {
                                if (responseData === 200) {
                                    // alert(`댓글이 정상 등록되었습니다`)
                                    $rt.value = '';
                                    // 등록 후 댓글 목록을 다시 불러옴
                                  getReplyList(payload.boardNo);
                                }
                            });

                    });

            };
       
            
    




        // 메인 실행 부 

        (function () {
            //댓글 등록 
            makeReplyRegisterClickEvent();
            
            // const initialBoardNo = modal.dataset.bno; // 초기 게시글 번호를 여기에 설정해주세요
            //  getReplyList(initialBoardNo);
        })();







        // 전역 이벤트로 좋아요 누른사람 보기 모달 창 닫기
        // window.addEventListener('click' e =>{
        //     if(e.target === $userLikes){
        //         modal.style.display = 'none';
        //     }
        // })

        // function makeDtailPageButtonClickEvent() {
        //     const $pageUI = document.querySelector('card-container');
        //     $pageUI.
        // }
    </script>
</body>




</html>