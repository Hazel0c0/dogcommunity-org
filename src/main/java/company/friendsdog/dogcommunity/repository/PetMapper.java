package company.friendsdog.dogcommunity.repository;

import company.friendsdog.dogcommunity.dto.response.PetCardResponseDTO;
import company.friendsdog.dogcommunity.entity.Pet;
import company.friendsdog.dogcommunity.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface PetMapper {

  // 펫 추가하기
  boolean save(Pet pet);
  // '구'로 동 찾기
  List<String> findDong(String addr);
  // '동'으로 펫 찾기
  List<Pet> findPetByAddr(String addDetail);




  Pet findOne(Long petNo);

  // 펫 프로필 카드 삭제
  boolean delete(Long petNo);

  //insert가 필요한 경우  새로운 정보 투입 ! !(회원가입)
  //int를 안쓰고 boolean을 쓴 이유
   boolean  insert(User user);

  //펫 프로필 수정 클래스담아서

  boolean modify(Pet pet);

  PetCardResponseDTO randomPet(String addDetail);



  // pet dto 수정할거 필드 2~3개
}
