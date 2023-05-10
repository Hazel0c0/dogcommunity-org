package company.friendsdog.dogcommunity.repository;

<<<<<<< HEAD
import company.friendsdog.dogcommunity.entity.Pet;
import company.friendsdog.dogcommunity.entity.User;
=======
import company.friendsdog.dogcommunity.dto.response.PetProfileCardDTO;
import company.friendsdog.dogcommunity.entity.Pet;
>>>>>>> develop
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PetProfileMapper {
  // 펫 프로필 카드 조회
<<<<<<< HEAD
  void findPetProfile();

  // 펫 프로필 카드 삭제
  boolean deletePetProfile(int petNo);

  //insert가 필요한 경우  새로운 정보 투입 ! !(회원가입)
  //int를 안쓰고 boolean을 쓴 이유
   boolean  insert(User user);

  //펫 프로필 수정 클래스담아서

  boolean modify(Pet pet);

  // pet dto 수정할거 필드 2~3개


=======
  List<Pet> findPetProfile();
>>>>>>> develop
}
