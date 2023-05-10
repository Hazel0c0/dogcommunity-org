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


    private Gender petGender;
    private String petPhoto;
    private LocalDateTime profileDateTime;

}
