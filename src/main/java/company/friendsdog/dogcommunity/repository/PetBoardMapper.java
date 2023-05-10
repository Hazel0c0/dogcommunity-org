package company.friendsdog.dogcommunity.repository;

import company.friendsdog.dogcommunity.entity.Board;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PetBoardMapper {

    // 게시물 전체 조회
    List<Board> petFindAll();

    // 게시물 상세 조회
    Board petFindOne(int boardNo);

    // 게시물 업로드
    boolean save(Board board);

    // 게시물 삭제
    boolean delete(int boardNo);

    // 게시물 수정
    boolean modify(Board board);


}
