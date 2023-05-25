package company.friendsdog.dogcommunity.dto.response;

import com.fasterxml.jackson.annotation.JsonFormat;
import company.friendsdog.dogcommunity.entity.Reply;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

import java.time.LocalDateTime;
import java.util.List;

@Setter@Getter
@ToString
@NoArgsConstructor
@Slf4j
public class ReplyDetailResponseDTO {

    private Long boardNo;
    private Long petNo;

    private Long replyNo;

    private String comment;
    private String petPhoto;
    private String petName;

    @JsonFormat(pattern = "yyyy년 MM월 dd일 HH:mm")
    private LocalDateTime replyDateTime;



    //엔티티를 DTO로 변환하는 하는 생성자
    public ReplyDetailResponseDTO(Reply reply){
        log.info("ReplyDetailResponseDTO reply - {}", reply);
        this.petNo =reply.getPetNo();
        this.replyNo = reply.getReplyNo();
        this.boardNo = reply.getBoardNo();
        this.comment = reply.getComment();
        this.petName = reply.getPetName();
        this.petPhoto = reply.getPetPhoto();
        this.replyDateTime = reply.getReplyDateTime();
    }
}
