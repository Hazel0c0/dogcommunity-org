//package company.friendsdog.dogcommunity.controller;
//
//import company.friendsdog.dogcommunity.dto.page.Search;
//import company.friendsdog.dogcommunity.dto.request.BoardRequestDTO;
//import company.friendsdog.dogcommunity.dto.response.BoardDetailResponseDTO;
//import company.friendsdog.dogcommunity.dto.response.BoardListResponseDTO;
//import company.friendsdog.dogcommunity.service.BoardService;
//import org.junit.jupiter.api.DisplayName;
//import org.junit.jupiter.api.Test;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.context.SpringBootTest;
//
//import java.util.List;
//
//@SpringBootTest
//class PetBoardControllerTest {
//    @Autowired
//    BoardService mapper;
//    @Autowired
//    BoardController boardController;
//    @Test
//    @DisplayName("게시물 작성")
//    void InsertTest() {
//        // given
//
//        BoardRequestDTO b = BoardRequestDTO.builder()
//                .content("호호")
//                .attachedImg("http://thumbnail.10x10.co.kr/webimage/image/basic600/290/B002903467.jpg?cmd=thumb&w=500&h=500&fit=true&ws=false")
//                .petNo(1L)
//                .petPhoto("ddd")
//                .petName("아아아")
//                .build();
//
//
//        boolean save = mapper.save(b, null, imgPath);
//        System.out.println("saveBoard = " + save);
//    }
//
//
//
//    @Test
//    @DisplayName("게시물 삭제")
//    void delete() {
//        Long petNo = 3L;
//        mapper.delete(petNo);
//    }
//
//    @Test
//    @DisplayName("게시물 수정")
//    void modify() {
//        BoardRequestDTO b = BoardRequestDTO.builder()
//                .petNo(1L)
//                .content("영식")
//                .build();
//        mapper.modify(b);
//    }
//    @Test
//    @DisplayName("하나의 게시물")
//    void petFindOne() {
//        BoardDetailResponseDTO board = mapper.petFindOne(1L);
//        System.out.println("build = " + board);
//    }
//
//    @Test
//    @DisplayName("게시물")
//    void petFindAll() {
//        Search search = new Search();
//        List<BoardListResponseDTO> dto = mapper.petFindAll(search);
//        System.out.println("boards = " + dto);
//    }
//
//}