package company.friendsdog.dogcommunity.entity;

import company.friendsdog.dogcommunity.dto.request.BoardRequestDTO;
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
    private Long petNo; // <= userNo 역할을 대신 해주는 거닌깐
    private Long boardNo;
    private String title;
    private String content;
    private LocalDateTime boardDateTime;
    private String attachedImg;
    private Long likes;
    private Long hits;
    private String petName;
    private String petPhoto;

    public Board(BoardRequestDTO dto) {
        this.petNo = dto.getPetNo();
        this.title = dto.getTitle();
        this.content = dto.getContent();
//        this.attachedImg = dto.getAttachedImg();
        this.boardDateTime = LocalDateTime.now();
        this.boardNo = dto.getBoardNo();
        this.likes = 0L;
        this.hits = 0L;
        this.petName = dto.getPetName();
        this.petPhoto = dto.getPetPhoto();
    }
}
