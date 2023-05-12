package company.friendsdog.dogcommunity.controller;

import company.friendsdog.dogcommunity.dto.page.Search;
import company.friendsdog.dogcommunity.dto.request.BoardRequestDTO;
import company.friendsdog.dogcommunity.dto.response.BoardDetailResponseDTO;
import company.friendsdog.dogcommunity.dto.response.BoardListResponseDTO;
import company.friendsdog.dogcommunity.service.BoardService;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
class PetBoardControllerTest {
    @Autowired
    BoardService mapper;
    @Test
    @DisplayName("게시물 작성")
    void InsertTest() {
        // given
        BoardRequestDTO b = BoardRequestDTO.builder()
                .title("지워니")
                .content("영시기")
                .attachedImg("http://thumbnail.10x10.co.kr/webimage/image/basic600/290/B002903467.jpg?cmd=thumb&w=500&h=500&fit=true&ws=false")
                .petNo(1L)
                .build();
        mapper.save(b);
        }



    @Test
    @DisplayName("게시물 삭제")
    void delete() {
        Long petNo = 3L;
        mapper.delete(petNo);
    }

    @Test
    @DisplayName("게시물 수정")
    void modify() {
        BoardRequestDTO b = BoardRequestDTO.builder()
                .petNo(2L)
                .title("안녕하세요")
                .content("영식")
                .attachedImg("https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F2208AF3556A1D58E14")
                .build();
        mapper.modify(b);
    }
    @Test
    @DisplayName("하나의 게시물")
    void petFindOne() {
        BoardDetailResponseDTO board = mapper.petFindOne(2L);
        System.out.println("build = " + board);
    }

    @Test
    @DisplayName("게시물")
    void petFindAll() {
        Search search = new Search();
        List<BoardListResponseDTO> dto = mapper.petFindAll(search);
        System.out.println("boards = " + dto);
    }

}