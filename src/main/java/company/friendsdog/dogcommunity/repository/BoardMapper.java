package company.friendsdog.dogcommunity.repository;

import company.friendsdog.dogcommunity.dto.page.Search;
import company.friendsdog.dogcommunity.entity.Board;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardMapper {

    // 게시물 전체 조회
    List<Board> petFindAll(Search page);

    // 게시물 상세 조회
    Board petFindOne(Long boardNo);

    // 게시물 업로드
    boolean save(Board board);

    // 게시물 삭제
    boolean delete(Long boardNo);

    // 게시물 수정
    boolean modify(Board board);

    // 조회수 상승
    void upHitsCount(Long boardNo);

    // 총 게시물 수
    int count(Search search);

    boolean petFindInfo(Board board);
}
