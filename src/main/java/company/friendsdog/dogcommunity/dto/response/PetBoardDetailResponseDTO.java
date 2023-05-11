package company.friendsdog.dogcommunity.dto.response;

import company.friendsdog.dogcommunity.entity.Board;
import lombok.*;

import java.time.LocalDateTime;


@Getter
@ToString
@EqualsAndHashCode
public class PetBoardDetailResponseDTO {

    private final int boardNo;
    private final String userNickname;
    private final String title;
    private final String content;
    private final String date;
    private final String attachedImg;
    private final int likes;
    private final int hits;

    public PetBoardDetailResponseDTO(Board board) {
        this.boardNo = board.getBoardNo();
        this.userNickname = board.getUserNickname();
        this.title = board.getTitle();
        this.content = board.getContent();
        this.date = PetBoardListResponseDTO.makePrettierDateString(board.getBoardDateTime());
        this.attachedImg = board.getAttachedImg();
        this.likes = board.getLikes();
        this.hits = board.getHits();
    }
}



