package company.friendsdog.dogcommunity.dto.response;

import company.friendsdog.dogcommunity.entity.Gender;
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

  private int likes;
  private int hits;


  public PetProfileCardDTO(int petNo, String petName, int petAge, String petKind, Gender petGender, String petPhoto, LocalDateTime profileDateTime, int likes, int hits) {
    this.petNo = petNo;
    this.petName = petName;
    this.petAge = petAge;
    this.petKind = petKind;
    this.petGender = petGender;
    this.petPhoto = petPhoto;
    this.profileDateTime = profileDateTime;
    this.likes = likes;
    this.hits = hits;
  }
}
