package company.friendsdog.dogcommunity.repository;

import company.friendsdog.dogcommunity.entity.Board;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class PetBoardMapperTest {


    @Autowired
    PetBoardMapper mapper;
    @Test
    @DisplayName("게시물 작성")
    void InsertTest() {
        // given
        for (int i = 1; i <= 10; i++) {
            Board b = Board.builder()
                    .title("테스트제목 " + i)
                    .content("테스트내용 " + i)
                    .attachedImg("http://thumbnail.10x10.co.kr/webimage/image/basic600/290/B002903467.jpg?cmd=thumb&w=500&h=500&fit=true&ws=false")
                    .build();
            mapper.save(b);
        }

    }

    @Test
    @DisplayName("게시물 삭제")
    void delete() {
        int boardNo = 1;
        mapper.delete(boardNo);

    }
    @Test
    @DisplayName("게시물 수정")
    void modify() {
        Board b = Board.builder()
                .boardNo(2)
                .title("영시기")
                .content("지워니")
                .attachedImg("https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F2208AF3556A1D58E14")
                .build();
        mapper.modify(b);

    }
//    @Test
//    @DisplayName("하나의 게시물")
//    void petFindOne() {
//        int boardNo = 2;
//        mapper.petFindOne(2);
//
//    }



}