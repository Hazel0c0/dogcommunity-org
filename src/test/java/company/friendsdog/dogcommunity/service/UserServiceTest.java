package company.friendsdog.dogcommunity.service;

import company.friendsdog.dogcommunity.dto.request.JoinRequestDTO;
import company.friendsdog.dogcommunity.entity.User;
import company.friendsdog.dogcommunity.repository.UserMapper;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.password.PasswordEncoder;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class UserServiceTest {

    @Autowired
    UserService service;
    @Autowired
    PasswordEncoder encoder;
    @Autowired
    UserMapper userMapper;
    @Test
    void userJoinTest() {
        service.userJoin(
                new JoinRequestDTO(
                        "asdf124"
                        ,"asdf1234"
                        ,"test1"
                        ,"asdf@anasd.com"
                        ,"010-1111-2222"
                        ,"dong"));
    }

    @Test
    @DisplayName("회원가입에 성공해야 한다")
    void joinTest() {
        User newUser= User.builder()
                .id("lion223")
                .pwd(encoder.encode("aaa1234"))
                .userName("monggo")
                .email("lion223@naver.com")
                .phoneNum("010-1111-2222")
                .adds("3dong")
                .build();
        boolean flag = userMapper.save(newUser);
        assertTrue(flag);
    }
}