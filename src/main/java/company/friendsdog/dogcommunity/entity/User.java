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
    private int userNo;
    private String id;
    private String password;
    private String userName;
    private String email;
    private String nickname;
    private String adds;
    private LocalDateTime userDate;

}
