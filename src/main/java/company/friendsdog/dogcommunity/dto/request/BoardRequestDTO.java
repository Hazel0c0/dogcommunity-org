package company.friendsdog.dogcommunity.dto.request;

import company.friendsdog.dogcommunity.entity.Board;
import lombok.*;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@Builder

public class BoardRequestDTO {

    private Long boardNo;
    private String title;
    private String content;
    private String attachedImg;
    private Long petNo;
    private Long likes;
    private Long hits;

    public BoardRequestDTO(Long boardNo, String title, String content, String attachedImg, Long petNo, Long likes, Long hits) {
        this.boardNo = boardNo;
        this.title = title;
        this.content = content;
        this.attachedImg = attachedImg;
        this.petNo = petNo;
        this.likes = likes;
        this.hits = hits;
    }
}
