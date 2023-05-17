package company.friendsdog.dogcommunity.repository;

import company.friendsdog.dogcommunity.controller.PetController;
import company.friendsdog.dogcommunity.entity.Pet;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class PetProfileMapperTest {

    PetMapper petMapper;

    @Test
    void saveTest(){
    }

    //조회
    @Test
    void  findOne(){

        //give
        Long petNo = 1L;
        //when
         Pet pet = mapper.findOne(petNo);
        //then
        assertEquals("뭉치",pet.getPetName());


    }



//    주입
    //mappertest에서 mapper가  필요함 아무거나 변수
    //번호를 입력 했을때
    @Autowired
    PetMapper mapper;
    @Test
    void modifyTest(){
    //given
        Pet p = Pet.builder()
                .petPhoto("사진수정")
                .hashtag("소개글수정")
                .petNo(6L)
                .build();


    //when
    boolean flag = mapper.modify(p);

    //then

        assertTrue(flag);



}


}