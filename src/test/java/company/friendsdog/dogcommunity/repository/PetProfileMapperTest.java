package company.friendsdog.dogcommunity.repository;

import company.friendsdog.dogcommunity.entity.Pet;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class PetProfileMapperTest {

  //    주입
  @Autowired
  PetProfileMapper petProfileMapper;

  @Test
  void modifyTest() {
    //given
    Pet p = Pet.builder()
        .petPhoto("사진수정")
        .petNo(1)
        .build();


    //when
    boolean flag = petProfileMapper.modify(p);

    //then
    assertTrue(flag);

  }

  @Test
  @DisplayName("모든 펫 조회")
  void findAllTest() {
    petProfileMapper.findAll()
//        .stream()
//        .forEach(pet ->
//            System.out.println(pet))
    ;
  }
}