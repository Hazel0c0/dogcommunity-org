package company.friendsdog.dogcommunity.dto.page;

import lombok.Getter;
import lombok.ToString;

@Getter @ToString
public class PageMaker {

  private static final int PAGE_COUNT = 9;

  // 화면 렌더링시 페이지의 시작값과 끝값
  private int begin, end, finalPage;

  // 이전, 다음 버튼 활성화 여부
  private boolean prev, next;

  // 현재 요청 페이지 정보
  private Page page;

  // 총 게시물 수
  private Long totalCount;


  public PageMaker(Page page, Long totalCount) {
    this.page = page;
    this.totalCount = totalCount;
    makePageInfo();
  }

  private void makePageInfo() {

    // 1. end값 계산
    // 올림처리 (현재 위치한 페이지번호 / 한 화면에 배치할 페이지수 ) *  한 화면에 배치할 페이지 수
    this.end = (int) Math.ceil(page.getPageNo() / (double)PAGE_COUNT) * PAGE_COUNT;

    // 2. begin값 계산
    this.begin = this.end - PAGE_COUNT + 1;

    this.finalPage = (int) Math.ceil((double)totalCount / page.getAmount());

    // 마지막 페이지 구간에서만 엔드보정이 일어나야 함
    if (this.finalPage < this.end) this.end = this.finalPage;

    // 이전 버튼 활성화 여부
    this.prev = begin > 1;

    // 다음 버튼 활성화 여부
    this.next = end < this.finalPage;

  }

}
