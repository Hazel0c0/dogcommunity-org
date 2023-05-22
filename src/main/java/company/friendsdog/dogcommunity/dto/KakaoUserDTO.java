package company.friendsdog.dogcommunity.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.time.LocalDateTime;

public class KakaoUserDTO {
  private long id;

  @JsonProperty("connected_at")
  private LocalDateTime connectedAt;

  @JsonProperty("kakao_account")
  private KakaoAccount kakaoAccount;

  @Setter
  @Getter
  @ToString
  public static class KakaoAccount {

    private String email;
    private Profile profile;

    @Setter @Getter @ToString
    public static class Profile {

      private String nickname;

      @JsonProperty("profile_image_url")
      private String profileImageUrl;
    }

  }
}
