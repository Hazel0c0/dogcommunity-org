package company.friendsdog.dogcommunity.entity;

import lombok.*;

import java.time.LocalDateTime;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
//펫번호,내용,댓글번호
// int 말고 Long
public class Reply {
    private Long boardNo;
    private Long petNo;
    private Long replyNo;
    private String comment;
    private LocalDateTime replyDateTime;
    private String petName;
    private String petPhoto;
}
