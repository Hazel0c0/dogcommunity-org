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
public class User {

    // 회원가입 시 필요 정보
    private Long userNo;
    private String id;
    private String pwd;
    private String userName;
    private String email;
    private String phoneNum;
    private String adds;
    private LocalDateTime joinDate;

}
