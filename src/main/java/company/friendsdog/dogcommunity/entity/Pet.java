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
public class Pet {
    private Long userNo;
    private Long petNo;
    private String petName;
    private Long petAge;
    private String petKind;
    private Gender petGender;
    private String petPhoto;
    private LocalDateTime profileDateTime;
    private String hashtag;
}
