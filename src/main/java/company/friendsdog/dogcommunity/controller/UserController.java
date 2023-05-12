package company.friendsdog.dogcommunity.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/user")
@Slf4j
public class UserController {
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

  @GetMapping("/main")
  public String Main(){
    log.info("GET");
    return "/main/main";
  }
}
