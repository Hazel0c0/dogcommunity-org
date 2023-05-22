package company.friendsdog.dogcommunity.repository;

import company.friendsdog.dogcommunity.entity.Reply;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class ReplyMapperTest {

    @Autowired
    ReplyMapper replyMapper;


    @Test
    @DisplayName("댓글등록")

    void saveTest() {

        //given
        long replyNo = 1L;
        Reply newReply = Reply.builder()
                .comment("피카츄")
                .replyNo(replyNo)
                .build();
        //when
        boolean flag = replyMapper.save(newReply);

        //then
        // 세이브가 성공했을것이라고 단언
        assertTrue(flag);

    }


    @Test
    @DisplayName("댓글번호 1 번 댓글 삭제")

    void removeTest() {
        //given
        long replyNo = 1L;

        //when
        boolean flag = replyMapper.remove(replyNo);

        //then
        assertTrue(flag);

    }

    @Test
    @DisplayName("1번 댓글 수정후" + "다시조회했을때 댓글이 수정되어야 함")
    @Transactional
    @Rollback
    void modifyTest() {
        //given
        long replyNo = 1L;
        String newReplyComment = "수정댓글";
        Reply r = Reply.builder()
                .comment(newReplyComment)
                .replyNo(replyNo)
                .build();

        //when
        boolean flag = replyMapper.modify(r);
        //then
        assertTrue(flag);
    }

    @Test
    @DisplayName("1번댓글 조회했을때")
    void findOneTest() {
        //given
        long replyNo = 1L;
        //when
        Reply reply = replyMapper.findOne(replyNo);
        //then
        assertEquals("피카츄",reply.getComment());
    }

    @Test
    @DisplayName("1번 게시판 조회")
    void findAllTest() {
        long boardNo = 23L;
        List<Reply> reply = replyMapper.findAll(boardNo);
        System.out.println("reply = " + reply);
    }
}