package company.friendsdog.dogcommunity.dto.response;

import company.friendsdog.dogcommunity.entity.Board;
import lombok.*;


@Getter
@ToString
@EqualsAndHashCode
public class BoardDetailResponseDTO {

    private Long boardNo;
    private Long petNo;
    private String petName;
    private String petPhoto;
    private String title;
    private String content;
    private String boardDateTime;
    private String attachedImg;
    private Long likes;
    private Long hits;

    public BoardDetailResponseDTO(Board board) {
        this.boardNo = board.getBoardNo();
        this.petNo = board.getPetNo();
        this.title = board.getTitle();
        this.content = board.getContent();
        this.boardDateTime = BoardListResponseDTO.makePrettierDateString(board.getBoardDateTime());
        this.attachedImg = board.getAttachedImg();
        this.likes = board.getLikes();
        this.hits = board.getHits();
        this.petName = board.getPetName();
        this.petPhoto = board.getPetPhoto();
    }
}



