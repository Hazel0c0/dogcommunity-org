package company.friendsdog.dogcommunity.dto.request;

import company.friendsdog.dogcommunity.entity.Gender;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
@EqualsAndHashCode
// 클라이언트 프로필 카드 만들 때 정보
public class PetProfileRequestDTO {
  private String petName;
  private int petAge;
  private String petKind;
  private Gender petGender;
  private String petPhoto;
  private String hashtag;
}
