package company.friendsdog.dogcommunity.dto.request;

import company.friendsdog.dogcommunity.entity.Reply;
import lombok.*;

@Setter@Getter
@NoArgsConstructor
@ToString@EqualsAndHashCode


public class ReplyModifyRequestDTO {

    private  Long bno;

    private Long replyNo;

    private String comment;

    private String petName;

    private String petPhoto;


    public Reply toEntity(){
        return Reply.builder()
                .boardNo(this.bno)
                .replyNo(this.replyNo)
                .petPhoto(this.petPhoto)
                .petName(this.petName)
                .comment(this.comment)
                .build();
    }
}
