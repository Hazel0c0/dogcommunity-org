package company.friendsdog.dogcommunity.service;

import company.friendsdog.dogcommunity.dto.AutoLoginDTO;
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
import org.springframework.web.util.WebUtils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.net.http.HttpResponse;
import java.time.LocalDateTime;

import static company.friendsdog.dogcommunity.service.LoginResult.*;
import static company.friendsdog.dogcommunity.util.LoginUtil.getCurrentLoginUser;

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
    return duplicateNum == 1; //1== 중복이다
  }

  // 로그인 인증
  public LoginResult loginAuthenticate(LoginRequestDTO dto,
                                       HttpSession session,
                                       HttpServletResponse response) {

    User foundUser = userMapper.findUser(dto.getId());

    if (foundUser == null) {
      log.info("{} 회원 정보 없음", dto.getId());
      return NO_ACC;
    }
    if (!encoder.matches(dto.getPwd(), foundUser.getPwd())) {
      log.info("비밀번호 불일치");
      return NO_PW;
    }

    // 자동로그인 ck
    if (dto.isAutoLogin()) {
      Cookie autoLoginCookie
          = new Cookie(LoginUtil.AUTO_LOGIN_COOKIE, session.getId());
      autoLoginCookie.setMaxAge(60 * 60 * 24); // 쿠키 사용 시간 (1일)
      autoLoginCookie.setPath("/"); //전체경로 설정

      log.info("service cookie : {}", autoLoginCookie);
      // 쿠키 응답 전송
      response.addCookie(autoLoginCookie);

      // DB 유저 정보에 쿠키값 저장하기
      AutoLoginDTO autoDTO = AutoLoginDTO.builder()
          .sessionId(session.getId())
          .id(dto.getId())
          .cookieLimitTime(LocalDateTime.now().plusDays(30))
          .build();

      userMapper.saveAutoLogin(autoDTO);
    }
    log.info("{}님 로그인 성공", foundUser.getUserName());
    return SUCCESS;
  }

  //로그인 상태 유지 (session 저장하기)
  public void maintainLoginState(
      HttpSession session, String id) {
    // 현재 로그인한 사람의 정보
    User foundUser = findUser(id);

    Pet loginPet = petMapper.userFindPet(foundUser.getUserNo());
    session.setAttribute("loginPet",loginPet);

    session.setAttribute(LoginUtil.LOGIN_KEY, foundUser);
    session.setMaxInactiveInterval(60 * 60 * 24); // 세션 - 1시간

    Object sessionInfo = session.getAttribute(LoginUtil.LOGIN_KEY);
//    log.info("세션 {}", sessionInfo);
  }

  // id로 유저 찾기
  private User findUser(String id) {
    return userMapper.findUser(id);
  }

  // 자동로그인 해제
  public void autoLoginClear(HttpServletRequest request, HttpServletResponse response) {
    Cookie cookie = LoginUtil.getCookie(request);

    // 쿠키 삭제
    if (cookie != null) {
      cookie.setMaxAge(0);
      cookie.setPath("/");
      response.addCookie(cookie);
    }

    // DB 자동로그인 해제
    userMapper.saveAutoLogin(
        AutoLoginDTO.builder()
            .sessionId("none")
            .cookieLimitTime(LocalDateTime.now())
            .id(LoginUtil.getCurrentLoginUser(request.getSession()).getId())
            .build()
    );


  }
}
