package company.friendsdog.dogcommunity.service;

import company.friendsdog.dogcommunity.controller.PetBoardController;
import company.friendsdog.dogcommunity.dto.request.PetBoardRequestDTO;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class PetBoardServiceTest {
    @Autowired
    PetBoardService mapper;

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
}