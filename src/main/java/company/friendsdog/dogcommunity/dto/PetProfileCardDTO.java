package company.friendsdog.dogcommunity.dto;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
@EqualsAndHashCode
// 클라이언트 프로필 카드 만들 때 정보
// @NoArgsConstructor
//@AllArgsConstructor 생성자 다받아 와서 생성자를 따로 만들필요가 없다.
public class PetProfileCardDTO {
    private int likes;
    private int hits;

  public PetProfileCardDTO(int likes, int hits) {
    this.likes = likes;
    this.hits = hits;
  }
}
