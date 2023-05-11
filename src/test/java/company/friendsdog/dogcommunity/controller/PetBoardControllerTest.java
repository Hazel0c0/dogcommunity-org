package company.friendsdog.dogcommunity.controller;

import company.friendsdog.dogcommunity.dto.page.Search;
import company.friendsdog.dogcommunity.dto.request.PetBoardRequestDTO;
import company.friendsdog.dogcommunity.entity.Board;
import company.friendsdog.dogcommunity.repository.PetBoardMapper;
import company.friendsdog.dogcommunity.service.PetBoardService;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class PetBoardControllerTest {
    @Autowired
    PetBoardService mapper;
    @Test
    @DisplayName("게시물 작성")
    void InsertTest() {
        // given

        PetBoardRequestDTO b = PetBoardRequestDTO.builder()
                .title("하하")
                .content("하하하하")
                .attachedImg("http://thumbnail.10x10.co.kr/webimage/image/basic600/290/B002903467.jpg?cmd=thumb&w=500&h=500&fit=true&ws=false")
                .userNickname("영식")
                .build();
        mapper.save(b);
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
        PetBoardRequestDTO b = PetBoardRequestDTO.builder()
                .boardNo(4)
                .title("안녕")
                .content("안녕하세요")
                .attachedImg("https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F2208AF3556A1D58E14")
                .build();
        mapper.modify(b);

    }
    @Test
    @DisplayName("하나의 게시물")
    void petFindOne() {
        int boardNo = 2;
        Search search = new Search();
        String content = "아아";
//        assertEquals(content, board.getContent());

    }


}