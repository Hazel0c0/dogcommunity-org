package company.friendsdog.dogcommunity.controller;

import company.friendsdog.dogcommunity.service.PetProfileService;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class PetProfileControllerTest {


    @Autowired
    PetProfileController mapper;

    @Test
    @DisplayName("프로필 삭제")
    void delete() {
        int petNo = 3;
        mapper.deletePetProfile(petNo);

    }
}