package company.friendsdog.dogcommunity.repository;

import company.friendsdog.dogcommunity.dto.response.PetProfileCardDTO;
import company.friendsdog.dogcommunity.entity.Pet;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;
import java.util.stream.Collectors;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class PetProfileMapperTest {
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


}