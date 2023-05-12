package company.friendsdog.dogcommunity.dto.request;

import lombok.*;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder

public class PetBoardRequestDTO {

    private Long boardNo;
    private String title;
    private String content;
    private String attachedImg;
    private Long petNo;
    private Long likes;
}
