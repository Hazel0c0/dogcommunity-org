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

    public Reply toEntity(){
        return Reply.builder()
                .boardNo(this.bno)
                .replyNo(this.replyNo)
                .comment(this.comment)
                .build();
    }
}
