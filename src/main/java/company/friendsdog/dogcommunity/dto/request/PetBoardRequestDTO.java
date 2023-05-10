package company.friendsdog.dogcommunity.dto.request;

import lombok.*;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
public class PetBoardRequestDTO {

    private String title;
    private String content;
    private String attachedImg;
}
