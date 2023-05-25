package company.friendsdog.dogcommunity.dto.request;

import lombok.*;

import javax.validation.constraints.NotBlank;

@Setter@Getter
@ToString@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ChatPostResponseDTO {
    @NotBlank
    private String message;

}
