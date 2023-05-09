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
    private int replyNo;
    private String comment;
    private LocalDateTime replyDateTime;
    private int likes;
    private int hate;
}
