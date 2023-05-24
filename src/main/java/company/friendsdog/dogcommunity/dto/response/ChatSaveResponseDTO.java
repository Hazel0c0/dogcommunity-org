package company.friendsdog.dogcommunity.dto.response;

import lombok.*;

import java.time.LocalDateTime;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
public class ChatSaveResponseDTO {

    private String petPhoto;
    private Long petNo;
    private String message;
    private String petName;


}
