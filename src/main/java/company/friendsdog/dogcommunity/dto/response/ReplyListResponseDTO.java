package company.friendsdog.dogcommunity.dto.response;

import company.friendsdog.dogcommunity.dto.response.ReplyDetailResponseDTO;
import lombok.*;

import java.util.List;

@Setter@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReplyListResponseDTO {

    private int count;

    private List<ReplyDetailResponseDTO> replies;


}
