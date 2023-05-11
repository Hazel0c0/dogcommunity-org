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
public class Board {
    private String userNickname;
    private int boardNo;
    private String title;
    private String content;
    private LocalDateTime boardDateTime;
    private String attachedImg;

}
