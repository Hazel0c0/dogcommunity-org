package company.friendsdog.dogcommunity.controller;

import company.friendsdog.dogcommunity.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@Slf4j
@RequiredArgsConstructor
public class UserController {

  private final UserService userService;

  // 회원가입
  // 회원가입창
  @GetMapping
  public void userJoin(){
    log.info("GET");
  }

  // 회원가입 처리 요청
  @PostMapping
  public void userJoin(String s){
    boolean flag = userService.userJoin();
  }

  // 아이디,이메일,폰번호 중복 검사
  // 비동기 요청처리
  @GetMapping
  public void joinCheckValue(String type, String keyword) {
    userService.joinCheckValue(type,keyword);
  }
}
