package company.friendsdog.dogcommunity.repository;

import company.friendsdog.dogcommunity.entity.Pet;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PetMapper {
  // 펫 프로필 카드 조회
  List<Pet> findAll();

  // 펫 프로필 카드 삭제
//  boolean deletePetProfile(int petNo);
}
