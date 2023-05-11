package company.friendsdog.dogcommunity.service;

import company.friendsdog.dogcommunity.repository.PetProfileMapper;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class PetProfileServiceTest {

    @Autowired
    PetProfileService mapper;

    @Test
    @DisplayName("프로필 삭제")
    void delete() {
        int petNo = 2;
        mapper.deletePetProfile(petNo);

    }


}