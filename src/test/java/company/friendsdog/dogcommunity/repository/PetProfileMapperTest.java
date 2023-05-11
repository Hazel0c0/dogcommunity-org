package company.friendsdog.dogcommunity.repository;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class PetProfileMapperTest {

    @Autowired
    PetMapper mapper;

    @Test
    @DisplayName("프로필 삭제")
    void delete() {
        int petNo = 1;
        mapper.deletePetProfile(petNo);

    }

}