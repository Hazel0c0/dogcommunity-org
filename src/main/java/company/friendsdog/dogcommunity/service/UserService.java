package company.friendsdog.dogcommunity.service;

import company.friendsdog.dogcommunity.dto.request.JoinRequestDTO;
import company.friendsdog.dogcommunity.dto.request.LoginRequestDTO;
import company.friendsdog.dogcommunity.dto.response.LoginPetResponseDTO;
import company.friendsdog.dogcommunity.entity.Pet;
import company.friendsdog.dogcommunity.entity.User;
import company.friendsdog.dogcommunity.repository.PetMapper;
import company.friendsdog.dogcommunity.repository.UserMapper;
import company.friendsdog.dogcommunity.util.LoginUtil;
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
                .addr(dto.getAddr())
                .addDetail(dto.getAddDetail())
                .build();

        return userMapper.save(newUser);
    }

    // 회원가입 중복 검사
    public boolean joinCheckValue(String type, String keyword) {


    int duplicateNum = userMapper.isDuplicate(type, keyword);
    return duplicateNum==1; //1== 중복이다
  }

    // 로그인 인증
    public LoginResult loginAuthenticate(LoginRequestDTO dto) {

        User foundUser = userMapper.findUser(dto.getId());

        if (foundUser == null) {
            log.info("{} 회원 정보 없음", dto.getId());
            return NO_ACC;
        }
        if (!encoder.matches(dto.getPwd(), foundUser.getPwd())) {
            log.info("비밀번호 불일치");
            return NO_PW;
        }
        log.info("{}님 로그인 성공", foundUser.getUserName());
        return SUCCESS;
    }

    //로그인 상태 유지 (session 저장하기)
    public void maintainLoginState(
            HttpSession session, String id) {
        // 현재 로그인한 사람의 정보
        User foundUser = findUser(id);
        session.setAttribute(LoginUtil.LOGIN_KEY, foundUser);
        session.setMaxInactiveInterval(60 * 60); // 세션 - 1시간

      Object sessionInfo = session.getAttribute(LoginUtil.LOGIN_KEY);
      log.info("세션 {}",sessionInfo);
    }

    // id로 유저 찾기
    private User findUser(String id) {
        return userMapper.findUser(id);
    }
}
