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
public class Reply {
    private Long boardNo;
    private Long petNo;
    private Long replyNo;
    private String comment;
    private LocalDateTime replyDateTime;



}
