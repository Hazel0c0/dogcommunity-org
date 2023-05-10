package company.friendsdog.dogcommunity.repository;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class PetProfileMapperTest {

    @Autowired
    PetProfileMapper mapper;

    @Test
    @DisplayName("게시물 삭제")
    void delete() {
        int petNo = 1;
        mapper.deletePetProfile(petNo);

    }

}