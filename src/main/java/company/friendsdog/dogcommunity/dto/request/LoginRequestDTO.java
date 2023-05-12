package company.friendsdog.dogcommunity.dto.request;

import lombok.*;

  @Setter
  @Getter
  @NoArgsConstructor
  @ToString
  @EqualsAndHashCode
  public class LoginRequestDTO {
    private String id;
    private String pwd;
    private boolean autoLogin; //자동로그인 체크 여부
}


