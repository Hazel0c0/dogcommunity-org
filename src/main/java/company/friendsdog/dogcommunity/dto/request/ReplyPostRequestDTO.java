package company.friendsdog.dogcommunity.dto.request;


import company.friendsdog.dogcommunity.entity.Reply;
import lombok.*;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
@Setter@Getter
@ToString@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReplyPostRequestDTO {

    @NotBlank
    private String comment;

    @NotNull
    private  Long petNo;
    @NotNull
    private  Long boardNo;

    public Reply toEntity(){
        return Reply.builder()
                .comment(this.comment)
                .boardNo(this.boardNo)
                .build();
    }

}
