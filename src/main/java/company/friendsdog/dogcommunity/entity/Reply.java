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
    private  int boardNo;
    private String userNickname;
    private int replyNo;
    private String comment;
    private LocalDateTime replyDateTime;

    //좋아요
    private int likes;
    //싫어요
    private int hate;


}
