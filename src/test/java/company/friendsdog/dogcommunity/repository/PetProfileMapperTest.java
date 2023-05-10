package company.friendsdog.dogcommunity.repository;

<<<<<<< HEAD
=======
import company.friendsdog.dogcommunity.dto.response.PetProfileCardDTO;
>>>>>>> develop
import company.friendsdog.dogcommunity.entity.Pet;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
<<<<<<< HEAD
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;
=======

import java.util.List;
import java.util.stream.Collectors;
>>>>>>> develop

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class PetProfileMapperTest {
<<<<<<< HEAD

//    주입
    //mappertest에서 mapper가  필요함 아무거나 변수
    @Autowired
    PetProfileMapper pet;
    @Test
    void modifyTest(){
    //given
        Pet p = Pet.builder()
                .petPhoto("사진수정")
                .petNo(1)
                .build();


    //when
    boolean flag = pet.modify(p);

    //then

        assertTrue(flag);



}
=======
  @Autowired
  PetProfileMapper petProfileMapper;

  @Test
  @DisplayName("모든 펫 조회")
  void findAllTest() {
    petProfileMapper.findPetProfile()
        .stream()
        .forEach(pet ->
          System.out.println(pet))
            ;
  }
>>>>>>> develop


}