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
    private  Long bno;

    private String petName;

    private String petPhoto;


    public Reply toEntity(){
        return Reply.builder()
                .comment(this.comment)
                .boardNo(this.bno)
                .petName(this.petName)
                .petPhoto(this.petPhoto)
                .build();
    }

}
