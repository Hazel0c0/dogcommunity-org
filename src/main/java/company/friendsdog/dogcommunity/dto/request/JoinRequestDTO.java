package company.friendsdog.dogcommunity.dto.request;

import lombok.*;

@Setter @Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
public class JoinRequestDTO {
  private String id;
  private String pwd;
  private String userName;
  private String email;
  private String phoneNum;
  private String addr;
}
