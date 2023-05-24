package company.friendsdog.dogcommunity.service;

import company.friendsdog.dogcommunity.dto.response.ReplyDetailResponseDTO;
import company.friendsdog.dogcommunity.dto.request.ReplyModifyRequestDTO;
import company.friendsdog.dogcommunity.dto.request.ReplyPostRequestDTO;
import company.friendsdog.dogcommunity.dto.response.ReplyListResponseDTO;
import company.friendsdog.dogcommunity.entity.Reply;
import company.friendsdog.dogcommunity.repository.BoardMapper;
import company.friendsdog.dogcommunity.repository.PetMapper;
import company.friendsdog.dogcommunity.repository.ReplyMapper;
import company.friendsdog.dogcommunity.util.LoginUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;

import static java.util.stream.Collectors.toList;


//request     response
@Service
@RequiredArgsConstructor
@Slf4j
public class ReplyService {

    private final PetMapper petMapper;
    private final ReplyMapper replyMapper;
    private final BoardMapper boardMapper;

    // 댓글목록 조회 서비스
    public ReplyListResponseDTO getList(long boardNo) {
        log.info("service board No : {}",boardNo);

        List<ReplyDetailResponseDTO> replies = replyMapper.findAll(boardNo)
                .stream()
                .map(reply -> new ReplyDetailResponseDTO(reply))
                .collect(toList());

        log.info("replies service DTO------ {}", replies);

        int count = replyMapper.count(boardNo);

        log.info("replies service count{}", count);


        return  ReplyListResponseDTO.builder()
                .count(count)
                .replies(replies)
                .build();


    }

    //댓글 등록 서비스
    public ReplyListResponseDTO register(final ReplyPostRequestDTO dto, HttpSession session)
            throws SQLException
    {
        Reply reply = dto.toEntity();
        log.info("service reply- {}", reply);
        Long userNoInfo = LoginUtil.getCurrentLoginUser(session).getUserNo();
        log.info("service userInfo - {}", userNoInfo);
        String petName = petMapper.userFindPet(userNoInfo).getPetName();
        log.info("service petName - {}", petName);
        reply.setPetName(petName);
        Long petNo = petMapper.userFindPet(userNoInfo).getPetNo();
        reply.setPetNo(petNo);
        String petPhoto = petMapper.userFindPet(userNoInfo).getPetPhoto();
        reply.setPetPhoto(petPhoto);
        reply.setReplyNo(dto.getReplyNo());
        reply.setBoardNo(dto.getBoardNo());
        reply.setComment(dto.getComment());
        //예외처리
        boolean flag = replyMapper.save(reply);
        if(!flag){
            log.warn("reply registered fail!");
            throw new SQLException("댓글 저장 실패!");
        }

        //ReplyLIST GET lIST 리턴
        return getList(reply.getBoardNo());
    }

    //댓글 삭제 서비스
    @Transactional //트랜잭션 처리
    public ReplyListResponseDTO remove(final Long replyNo)
            throws Exception{

        //findOne 함수선언
        Reply reply = replyMapper.findOne(replyNo);
        long boardNo = replyMapper.findOne(replyNo).getBoardNo();
        reply.setBoardNo(boardNo);

        replyMapper.remove(replyNo);
        return getList(reply.getBoardNo());
    }

    //댓글 수정
    @Transactional
    public ReplyListResponseDTO modify(final ReplyModifyRequestDTO dto)
            throws Exception{

        replyMapper.modify(dto.toEntity());
        return getList(dto.getBoardNo());

    }
}