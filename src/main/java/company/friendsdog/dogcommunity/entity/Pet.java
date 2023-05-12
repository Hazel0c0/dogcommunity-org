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


    // int petNo;
    // 기본값이 0 인데 이 0이 유효한 0인지 유효하지 않은 0인지 몰라요
    // Long 은 기본값이 null 이라서 0을 넣으면 무조건 유효한 0임을 알 수 있어서 랩퍼 타입으로

    private Long petNo;
    private String petName;


    private Gender petGender;
    private String petPhoto;
    private LocalDateTime profileDateTime;

}
