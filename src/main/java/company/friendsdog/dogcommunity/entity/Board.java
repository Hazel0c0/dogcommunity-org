package company.friendsdog.dogcommunity.entity;

import company.friendsdog.dogcommunity.dto.request.PetBoardRequestDTO;
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
    private int likes;
    private int hits;

    public Board(PetBoardRequestDTO dto) {
        this.userNickname = dto.getUserNickname();
        this.title = dto.getTitle();
        this.content = dto.getContent();
        this.attachedImg = dto.getAttachedImg();
        this.boardDateTime = LocalDateTime.now();
        this.boardNo = dto.getBoardNo();
        this.likes = dto.getLikes();
    }
}
