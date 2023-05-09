package company.friendsdog.dogcommunity.repository;

import lombok.RequiredArgsConstructor;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PetProfileMapper {
  // 펫 프로필 카드 조회
  void findPetProfile();

  // 펫 프로필 카드 삭제
  boolean deletePetProfile(int petNo);
}
