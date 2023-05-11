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
    private int petNo;
    private String petName;
    private int petAge;
    private String petKind;
    private String petGender;
    private String petPhoto;
    private LocalDateTime profileDateTime;
}
