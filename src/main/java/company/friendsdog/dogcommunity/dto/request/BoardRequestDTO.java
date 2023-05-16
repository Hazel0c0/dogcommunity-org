package company.friendsdog.dogcommunity.dto.request;

import company.friendsdog.dogcommunity.entity.Board;
import lombok.*;
import org.springframework.web.multipart.MultipartFile;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@Builder
@AllArgsConstructor

public class BoardRequestDTO {

    private Long boardNo;
    private String title;
    private String content;
    private MultipartFile attachedImg;
    private Long petNo;
    private String petName;
    private String petPhoto;
    private Long likes;
    private Long hits;


}
