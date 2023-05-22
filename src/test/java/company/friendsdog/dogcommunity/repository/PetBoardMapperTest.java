package company.friendsdog.dogcommunity.repository;

import company.friendsdog.dogcommunity.dto.page.Search;
import company.friendsdog.dogcommunity.entity.Board;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

@SpringBootTest
class PetBoardMapperTest {


    @Autowired
    BoardMapper mapper;
    @Test
    @DisplayName("게시물 작성")
    void save() {
        // given

            Board b = Board.builder()
                    .title("테스트제목2 ")
                    .content("테스트내용2 ")
                    .attachedImg("http://thumbnail.10x10.co.kr/webimage/image/basic600/290/B002903467.jpg?cmd=thumb&w=500&h=500&fit=true&ws=false")
                    .petNo(2L)
                    .build();
            mapper.save(b);


    }

    @Test
    @DisplayName("게시물 삭제")
    void delete() {
        Long petNo = 1L;
        mapper.delete(petNo);
    }
    @Test
    @DisplayName("게시물 수정")
    void modify() {
        Board b = Board.builder()
                .petNo(2L)
                .title("영시기2")
                .content("지워니2")
                .attachedImg("https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F2208AF3556A1D58E14")
                .build();
        mapper.modify(b);

    }
    @Test
    @DisplayName("하나의 게시물")
    void petFindOne() {
        Board board = mapper.petFindOne(3L);
        System.out.println("build = " + board);
    }

    @Test
    @DisplayName("게시물")
    void petFindAll() {
        Search search = new Search();
    List<Board> boards = mapper.petFindAll(search);
        System.out.println("boards = " + boards);

}

}