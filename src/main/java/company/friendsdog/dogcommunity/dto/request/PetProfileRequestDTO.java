package company.friendsdog.dogcommunity.dto.request;

import company.friendsdog.dogcommunity.entity.Gender;
import lombok.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotBlank;

//@Getter
//@ToString
//@EqualsAndHashCode

// dto setter랑 noArgs 필수라서 추가 완료 : 빛나
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@Setter
// 클라이언트 프로필 카드 만들 때 정보
public class PetProfileRequestDTO {
  @NotBlank
  private String petName;
  private long petAge;
  @NotBlank
  private String petKind;
  @NotBlank
  private Gender petGender;
  @NotBlank
  private MultipartFile petPhoto;
  private String hashtag;

}
