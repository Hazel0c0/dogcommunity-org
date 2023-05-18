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
public class PetCardResponseDTO {
  private int petNo;
  private String petName;
  private int petAge;
  private String petKind;
  private Gender petGender;
  private String petPhoto;
  private LocalDateTime petDateTime;
  private String hashtag;

  private String addr;
  private String addDetail;

  private int likes; // 좋아요 수
  private int hits;  // 조회수

// 펫의 프로필 카드 객체


  public PetCardResponseDTO(int petNo, String petName, int petAge, String petKind, Gender petGender, String petPhoto, LocalDateTime petDateTime, String hashtag, String addr, String addDetail) {
    this.petNo = petNo;
    this.petName = petName;
    this.petAge = petAge;
    this.petKind = petKind;
    this.petGender = petGender;
    this.petPhoto = petPhoto;
    this.petDateTime = petDateTime;
    this.hashtag = hashtag;
    this.addr = addr;
    this.addDetail = addDetail;
  }
}
