package company.friendsdog.dogcommunity.repository;

import company.friendsdog.dogcommunity.entity.Pet;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PetProfileMapper {
  // 펫 프로필 카드 조회
  Pet findPetProfile(int petNo);

  // 펫 프로필 카드 삭제
  boolean deletePetProfile(int petNo);
}
