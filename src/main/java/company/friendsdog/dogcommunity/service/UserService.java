package company.friendsdog.dogcommunity.service;

import company.friendsdog.dogcommunity.dto.request.JoinRequestDTO;
import company.friendsdog.dogcommunity.dto.request.LoginRequestDTO;
import company.friendsdog.dogcommunity.dto.response.LoginPetResponseDTO;
import company.friendsdog.dogcommunity.entity.Pet;
import company.friendsdog.dogcommunity.entity.User;
import company.friendsdog.dogcommunity.repository.PetMapper;
import company.friendsdog.dogcommunity.repository.UserMapper;
import lombok.Builder;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;

import static company.friendsdog.dogcommunity.service.LoginResult.*;

@Service
@RequiredArgsConstructor
@Slf4j
public class UserService {
    private final UserMapper userMapper;
    private final PetMapper petMapper;
    private final PasswordEncoder encoder;


    // 회원가입 처리
    public boolean userJoin(JoinRequestDTO dto) {

        User newUser = User.builder()
                .id(dto.getId())
                // 비밀번호 인코딩
                .pwd(encoder.encode(dto.getPwd()))
                .userName(dto.getUserName())
                .email(dto.getEmail())
                .phoneNum(dto.getPhoneNum())
                .adds(dto.getAdds())
                .build();

        return userMapper.save(newUser);
    }

    // 회원가입 중복 검사
    public boolean joinCheckValue(String type, String keyword) {

        userMapper.isDuplicate(type, keyword);
        return false;
    }

    // 로그인 인증
    public LoginResult loginAuthenticate(LoginRequestDTO dto) {
        User foundUser = userMapper.findUser(dto.getId());

        if (foundUser == null) {
            log.info("{} 회원 정보 없음", dto);
            return NO_ACC;
        }
        if (!encoder.matches(dto.getPwd(), foundUser.getPwd())) {
            log.info("비밀번호 불일치");
            return NO_PW;
        }
        log.info("{}님 로그인 성공", foundUser.getUserNo());
        return SUCCESS;
    }

    //로그인 상태 유지 (session 저장하기)
    public void maintainLoginState(
            HttpSession session, Long uNo) {
        // 현재 로그인한 사람의 정보
        Pet findPet = findPet(uNo);
        LoginPetResponseDTO loginDto = LoginPetResponseDTO.builder()
                .petNo(findPet.getPetNo())
                .petName(findPet.getPetName())
                .petPhoto(findPet.getPetPhoto())
                .build();
        session.setAttribute("loginUserPet", loginDto);
        session.setMaxInactiveInterval(60 * 60); // 세션 - 1시간
    }

    // id로 유저 찾기
    private Pet findPet(Long uNo) {
        return petMapper.userFindPet(uNo);
    }
}
