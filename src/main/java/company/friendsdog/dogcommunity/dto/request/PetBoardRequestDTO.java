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

    private int boardNo;
    private String title;
    private String content;
    private String attachedImg;
    private int petNo;
    private int likes;
}