package company.friendsdog.dogcommunity.dto.response;

import company.friendsdog.dogcommunity.entity.Board;
import company.friendsdog.dogcommunity.entity.Pet;
import company.friendsdog.dogcommunity.repository.BoardMapper;
import company.friendsdog.dogcommunity.repository.PetMapper;
import lombok.*;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
public class BoardListResponseDTO {
    private Long petNo;
    private Long boardNo;
    private String petName;
    private String petPhoto;
    private String shortTitle;
    private String shortContent;
    private String date;
    private String attachedImg;
    private Long likes;
    private Long hits;

    public BoardListResponseDTO(Board board) {
        this.petNo = board.getPetNo();
        this.boardNo = board.getBoardNo();
        this.shortTitle = board.getTitle();
        this.shortContent = makeShortContent(board.getContent());
        this.date = makePrettierDateString(board.getBoardDateTime());
        this.attachedImg = board.getAttachedImg();
        this.likes = board.getLikes();
        this.hits = board.getHits();
        this.petName = board.getPetName();
        this.petPhoto = board.getPetPhoto();
    }
    static String makePrettierDateString(LocalDateTime regDateTime) {
        DateTimeFormatter pattern = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        return pattern.format(regDateTime);
    }

    private String makeShortContent(String originContent) {
        return sliceString(originContent, 40);
    }


//    private String makeShortTitle(String originTitle) {
//        return sliceString(originTitle, 10);
//    }
    private static String sliceString(String targetString, int wishLength) {
        return (targetString.length() > wishLength)
                ? targetString.substring(0, wishLength) + "..."
                : targetString
                ;
    }
}
