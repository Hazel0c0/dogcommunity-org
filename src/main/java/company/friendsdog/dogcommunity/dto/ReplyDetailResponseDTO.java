package company.friendsdog.dogcommunity.dto;

import company.friendsdog.dogcommunity.entity.Reply;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter@Getter
@ToString
@NoArgsConstructor
public class ReplyDetailResponseDTO {

    private Long petNo;

    private Long replyNo;

    private String petName;

    private String petPhoto;

    private String comment;


    //엔티티를 DTO로 변환하는 하는 생성자
    public ReplyDetailResponseDTO(Reply reply){
        this.petNo =reply.getPetNo();
        this.replyNo = reply.getReplyNo();
        this.comment = reply.getComment();
        this.petName = reply.getPetName();
        this.petPhoto = reply.getPetPhoto();


    }
}
