package company.friendsdog.dogcommunity.service;

import company.friendsdog.dogcommunity.dto.response.ReplyDetailResponseDTO;
import company.friendsdog.dogcommunity.dto.response.ReplyListResponseDTO;
import company.friendsdog.dogcommunity.entity.Reply;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import javax.servlet.http.HttpSession;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class ReplyServiceTest {

@Autowired
ReplyService replyService;

    @Test
    @DisplayName("23번 게시판 조회")
    void findAllTest() {
        Long boardNo = 23L;
        ReplyListResponseDTO list = replyService.getList(boardNo);
        System.out.println("list = " + list);
    }

@Test
    @DisplayName("댓글 저장")
    void save() {
    long replyNo = 4L;
    Reply newReply = Reply.builder()
            .comment("테스트입니다")
            .replyNo(replyNo)
            .boardNo(4L)
            .petNo(7L)
            .petName("리트")
            .petPhoto("https://cdn.imweb.me/upload/S201807025b39d1981b0b0/5cad95219ca68.jpg")
            .build();
    //when
    HttpSession session;



}


}