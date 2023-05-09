package company.friendsdog.dogcommunity.dto.response;

import company.friendsdog.dogcommunity.entity.Gender;
import company.friendsdog.dogcommunity.entity.Pet;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

import java.time.LocalDateTime;

@Getter
@ToString
@EqualsAndHashCode
// 클라이언트 프로필 카드 만들 때 정보
public class PetProfileCardDTO {
  private int petNo;
  private String petName;
  private int petAge;
  private String petKind;
  private Gender petGender;
  private String petPhoto;
  private LocalDateTime profileDateTime;

  private int likes; // 좋아요 수
  private int hits;  // 조회수

// 펫의 프로필 카드 객체
  public PetProfileCardDTO(Pet pet) {
    this.petNo = petNo;
    this.petName = petName;
    this.petAge = petAge;
    this.petKind = petKind;
    this.petGender = petGender;
    this.petPhoto = petPhoto;
    this.profileDateTime = profileDateTime;
    this.likes = 0;
    this.hits = 0;
  }
}
