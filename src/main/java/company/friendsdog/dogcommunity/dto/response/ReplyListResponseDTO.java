package company.friendsdog.dogcommunity.dto.response;

import company.friendsdog.dogcommunity.dto.page.PageMaker;
import company.friendsdog.dogcommunity.dto.response.ReplyDetailResponseDTO;
import lombok.*;

import java.util.List;

@Setter@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReplyListResponseDTO {

    // 총 댓글 수
    private int count;

    // 페이지 정보
//    private PageMaker pageInfo;

    // 댓글 리스트
    private List<ReplyDetailResponseDTO> replies;


}
