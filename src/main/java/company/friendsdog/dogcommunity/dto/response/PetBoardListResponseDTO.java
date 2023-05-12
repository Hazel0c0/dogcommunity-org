package company.friendsdog.dogcommunity.dto.response;

import company.friendsdog.dogcommunity.entity.Board;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Getter
@ToString
@EqualsAndHashCode
public class PetBoardListResponseDTO {
    private final Long petNo;
    private final Long boardNo;
    private final String shortTitle;
    private final String shortContent;
    private final String date;
    private final String attachedImg;
    private final Long likes;
    private final Long hits;

    public PetBoardListResponseDTO(Board board) {
        this.petNo = board.getPetNo();
        this.boardNo = board.getBoardNo();
        this.shortTitle = makeShortTitle(board.getTitle());
        this.shortContent = makeShortContent(board.getContent());
        this.date = makePrettierDateString(board.getBoardDateTime());
        this.attachedImg = board.getAttachedImg();
        this.likes = board.getLikes();
        this.hits = board.getHits();
    }
    static String makePrettierDateString(LocalDateTime regDateTime) {
        DateTimeFormatter pattern = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        return pattern.format(regDateTime);
    }

    private String makeShortContent(String originContent) {
        return sliceString(originContent, 40);
    }


    private String makeShortTitle(String originTitle) {
        return sliceString(originTitle, 10);
    }
    private static String sliceString(String targetString, int wishLength) {
        return (targetString.length() > wishLength)
                ? targetString.substring(0, wishLength) + "..."
                : targetString
                ;
    }
}
