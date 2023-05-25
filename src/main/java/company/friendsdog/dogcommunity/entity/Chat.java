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
public class Chat {
    private String petPhoto;
    private LocalDateTime chatCurrentTime;
    private Long petNo;
    private String message;
    private String petName;

}
