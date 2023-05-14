package company.friendsdog.dogcommunity.dto.response;

import lombok.*;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class LoginPetResponseDTO {
    private Long petNo;
    private String petName;
    private String petPhoto;
}
