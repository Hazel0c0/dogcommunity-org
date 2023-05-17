package company.friendsdog.dogcommunity.dto.request;

import company.friendsdog.dogcommunity.entity.Gender;
import lombok.*;

//@Getter
//@ToString
//@EqualsAndHashCode

// dto setter랑 noArgs 필수라서 추가 완료 : 빛나
@Setter
@Getter
@NoArgsConstructor
@ToString
@EqualsAndHashCode
// 클라이언트 프로필 카드 만들 때 정보
public class PetProfileRequestDTO {
  private String petName;
  private long petAge;
  private String petKind;
  private Gender petGender;
  private String petPhoto;
  private String hashtag;

}
