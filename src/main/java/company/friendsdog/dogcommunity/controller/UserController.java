package company.friendsdog.dogcommunity.controller;

import company.friendsdog.dogcommunity.dto.request.JoinRequestDTO;
import company.friendsdog.dogcommunity.dto.request.LoginRequestDTO;
import company.friendsdog.dogcommunity.service.LoginResult;
import company.friendsdog.dogcommunity.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import static company.friendsdog.dogcommunity.service.LoginResult.*;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/user")
public class UserController {

  private final UserService userService;

  @GetMapping("/main")
  public String Main(){
    log.info("GET");
    return "/main/main";
  }

  // 회원가입
  // 회원가입창
  @GetMapping("/join")
  public String userJoin(){
    log.info("회원가입 GET");
    return "/login/sign-up";
  }

  // 회원가입 처리 요청
  @PostMapping("/sign-up")
  public String userJoin(JoinRequestDTO dto){
    log.info("회원가입 POST : {}",dto);
    boolean flag = userService.userJoin(dto);

    // 회원가입 끝나면 main 창으로
    return "redirect:/main/main";
  }

  // 아이디,이메일,폰번호 중복 검사
  // 비동기 요청처리
  @GetMapping
  public void joinCheckValue(String type, String keyword) {
    userService.joinCheckValue(type, keyword);
  }


  // ==============로그인 화면 요청======================================
  @GetMapping("/login")
  public String login(HttpServletRequest request) {
    log.info("/members/sign-in GET - forwarding to jsp");

    return "/login/login";
  }

  // 로그인 검증 요청
  @PostMapping("/login")
  public String signIn(LoginRequestDTO dto){
    LoginResult loginResult = userService.loginAuthenticate(dto);

    if (loginResult== SUCCESS){
      log.info("로그인 성공 : {}",loginResult);
      userService.maintainLoginState(dto.getId());
      return "redirect:/";
    }

    log.info("로그인 실패");
    return "redirect:/members/sign-in";
  }

  // 로그아웃 요청 처리
  @GetMapping("/logout")
  public String logout(HttpSession session){

    return "redirect:/";
  }
}
