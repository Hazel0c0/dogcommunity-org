package company.friendsdog.dogcommunity.repository;

import company.friendsdog.dogcommunity.dto.response.PetProfileCardDTO;
import company.friendsdog.dogcommunity.entity.Pet;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PetProfileMapper {
  // 펫 프로필 카드 조회
  List<Pet> findPetProfile();
}
