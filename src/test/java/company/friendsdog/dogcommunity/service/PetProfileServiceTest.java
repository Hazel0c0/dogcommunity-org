package company.friendsdog.dogcommunity.service;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class PetProfileServiceTest {

    @Autowired
    PetService mapper;

    @Test
    @DisplayName("프로필 삭제")
    void delete() {
        int petNo = 2;
//        mapper.deletePetProfile(petNo);

    }


}