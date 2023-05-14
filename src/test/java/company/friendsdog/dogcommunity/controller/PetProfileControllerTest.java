package company.friendsdog.dogcommunity.controller;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class PetProfileControllerTest {


    @Autowired
    PetController mapper;

    @Test
    @DisplayName("프로필 삭제")
    void delete() {
        Long petNo = 3L;
        mapper.delete(petNo);
    }
}