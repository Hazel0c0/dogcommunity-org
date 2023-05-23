package company.friendsdog.dogcommunity.dto.request;

import company.friendsdog.dogcommunity.entity.Reply;
import lombok.*;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Setter@Getter
@NoArgsConstructor
@ToString@EqualsAndHashCode


public class ReplyModifyRequestDTO {


    private String comment;

    private Long petNo;

    private Long boardNo;

    private String petName;
    private String petPhoto;

    public Reply toEntity(){
        return Reply.builder()
                .comment(this.comment)
                .boardNo(this.boardNo)
                .petPhoto(this.petPhoto)
                .petName(this.petName)
                .petNo(this.petNo)
                .build();
    }
}
