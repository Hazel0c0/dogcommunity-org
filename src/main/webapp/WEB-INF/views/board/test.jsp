      <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <!DOCTYPE html>
      <html>

      <head>
          <meta charset="UTF-8">
          <title>Insert title here</title>

          <%@ include file="../include/static-head.jsp" %>

          <link rel="stylesheet" href="/assets/css/list.css">
         
      </head>

      <body>

      <%-- <%@ include file="../include/header.jsp" %> --%>

      <div id="wrap">


          <div class="main-title-wrapper">
              <h1 class="main-title">게시판</h1>

                  <button class="add-btn">새 글 쓰기</button>

          </div>

          <div class="top-section">
              <!-- 검색창 영역 -->
              <div class="search">
                  <form action="/board/list" method="get">

                      <select class="form-select" name="type" id="search-type">
                          <option value="content">내용</option>
                          <option value="petName">작성자</option>
                      </select>

                      <input type="text" class="form-control" name="keyword" value="${p.keyword}">

                      <button class="btn btn-primary" type="submit">
                          <i class="fas fa-search"></i>
                      </button>

                  </form>
              </div>
          </div>

          <div class="card-container">

              <c:forEach var="b" items="${bList}">
                  
                  <div class="card-wrapper">
                    <div>${b.petName}</div>
                    <div><img src="/local${b.petPhoto}"> </div>
                    <div><img src="/local${b.attachedImg}" alt=""> </div>
                      <section class="card" data-boardNo="${b.boardNo}">
                        <input type="hidden" name="boardNo" value="${b.boardNo}">
                          <div class="card-title-wrapper">
                              <h2 class="card-title">${b.likes}</h2>
                              <h2 class="card-title">${b.shortTitle}</h2>
                              <div class="time-view-wrapper">
                                  <div class="time">
                                      <i class="far fa-clock"></i>
                                          ${b.boardDateTime}</div>
                                  <div class="view">
                                      <i class="fas fa-eye"></i>
                                      <span class="view-count">${b.hits}</span>
                                  </div>
                              </div>
                          </div>
                          <div class="card-content">
                                  ${b.shortContent}
                          </div>
                      </section>
                      <form action="/board/delete" method="post">
                          <div class="card-btn-group">
                              <button type="submit">삭제</button>
                          </div>
                          <input type="hidden" name="boardNo" value="${b.boardNo}">
                      </form>
                  </div>

              </c:forEach>


          </div>
          <!-- end card container -->


      </div>

      </div>

      <!-- 모달 창 -->
      <div class="modal" id="modal">
          <div class="modal-content">
              <p>정말로 삭제할까요?</p>
              <div class="modal-buttons">
                  <button class="confirm" id="confirmDelete"><i class="fas fa-check"></i> 예</button>
                  <button class="cancel" id="cancelDelete"><i class="fas fa-times"></i> 아니오</button>
              </div>
          </div>
      </div>



      <script>

          const $cardContainer = document.querySelector('.card-container');

          //================= 삭제버튼 스크립트 =================//
          const modal = document.getElementById('modal'); // 모달창 얻기
          const confirmDelete = document.getElementById('confirmDelete'); // 모달 삭제 확인버튼
          const cancelDelete = document.getElementById('cancelDelete'); // 모달 삭제 취소 버튼

          $cardContainer.addEventListener('click', e => {
              // 삭제 버튼을 눌렀다면~
              if (e.target.matches('.card-btn-group *')) {
                  console.log('삭제버튼 클릭');
                  modal.style.display = 'flex'; // 모달 창 띄움

                  const $delBtn = e.target.closest('.del-btn');
                  const deleteLocation = $delBtn.dataset.href;

                  // 확인 버튼 이벤트
                  confirmDelete.onclick = e => {
                      // 삭제 처리 로직
                      window.location.href = deleteLocation;

                      modal.style.display = 'none'; // 모달 창 닫기
                  };


                  // 취소 버튼 이벤트
                  cancelDelete.onclick = e => {
                      modal.style.display = 'none'; // 모달 창 닫기
                  };
              } else { // 삭제 버튼 제외한 부분은 글 상세조회 요청

                  // section태그에 붙은 글번호 읽기
                  const boardNo = e.target.closest('.card').dataset.boardno;
                  // 상세 조회 요청 보내기
                  console.log(boardNo);
                  window.location.href= '/board/detail?boardNo=' + boardNo + '&type=${s.type}&keyword=${s.keyword}';
              }
          });

          // 전역 이벤트로 모달창 닫기
          window.addEventListener('click', e => {
              if (e.target === modal) {
                  modal.style.display = 'none';
              }
          });

          //========== 게시물 목록 스크립트 ============//

          function removeDown(e) {
              if (!e.target.matches('.card-container *')) return;
              const $targetCard = e.target.closest('.card-wrapper');
              $targetCard?.removeAttribute('id', 'card-down');
          }

          function removeHover(e) {
              if (!e.target.matches('.card-container *')) return;
              const $targetCard = e.target.closest('.card');
              $targetCard?.classList.remove('card-hover');

              const $delBtn = e.target.closest('.card-wrapper')?.querySelector('.del-btn');
              $delBtn.style.opacity = '0';
          }



          $cardContainer.onmouseover = e => {

              if (!e.target.matches('.card-container *')) return;

              const $targetCard = e.target.closest('.card');
              $targetCard?.classList.add('card-hover');

              const $delBtn = e.target.closest('.card-wrapper')?.querySelector('.del-btn');
              $delBtn.style.opacity = '1';
          }

          $cardContainer.onmousedown = e => {

              if (e.target.matches('.card-container .card-btn-group *')) return;

              const $targetCard = e.target.closest('.card-wrapper');
              $targetCard?.setAttribute('id', 'card-down');
          };

          $cardContainer.onmouseup = removeDown;

          $cardContainer.addEventListener('mouseout', removeDown);
          $cardContainer.addEventListener('mouseout', removeHover);

          // write button event
              document.querySelector('.add-btn').onclick = e => {
              window.location.href = '/board/write';
          };



          // 셀렉트옵션 검색타입 태그 고정
          function fixSearchOption() {
              const $select = document.getElementById('search-type');

              for (let $opt of [...$select.children]) {
                  if ($opt.value === '${p.type}') {
                      $opt.setAttribute('selected', 'selected');
                      break;
                  }
              }
          }

          appendPageActive();
          fixSearchOption();


      </script>

      </body>

      </html>