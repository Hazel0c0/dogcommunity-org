package company.friendsdog.dogcommunity.controller;

import company.friendsdog.dogcommunity.dto.request.JoinRequestDTO;
import company.friendsdog.dogcommunity.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/user")
public class UserController {

  private final UserService userService;
//로그인
@GetMapping("/login")
public String login(){
  log.info("GET");
  return "/login/login";
}


  // 회원가입
  // 회원가입창
  @GetMapping("/join")
  public String userJoin(){
    log.info("GET");
    return "/login/sign-up";
  }

  // 회원가입 처리 요청
  @PostMapping("/sign-up")
  public void userJoin(JoinRequestDTO dto){
    boolean flag = userService.userJoin(dto);
  }

  // 아이디,이메일,폰번호 중복 검사
  // 비동기 요청처리
  @GetMapping
  public void joinCheckValue(String type, String keyword) {
    userService.joinCheckValue(type, keyword);
  }
}
