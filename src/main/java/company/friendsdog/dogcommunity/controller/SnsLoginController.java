package company.friendsdog.dogcommunity.controller;

import company.friendsdog.dogcommunity.service.SmsLoginService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.HashMap;
import java.util.Map;

@Controller
@Slf4j
@RequiredArgsConstructor
public class SnsLoginController {

  private final SmsLoginService loginService;

  // 카카오 app key
  @Value("${sns.kakao.app-key}")
  private String kakaoAppKey;

  // 카카오 redirect uri
  @Value("${sns.kakao.redirect-uri}")
  private String kakaoRedirectURI;

  @GetMapping("/kakao/login")
  public String kakaoLogin() {
    log.info("kakao 인가요청");
    String requestUri
        = String.format("https://kauth.kakao.com/oauth/authorize?client_id=%s&redirect_uri=%s&response_type=code"
        ,kakaoAppKey,kakaoRedirectURI);
    return "redirect:" + requestUri;
  }

  @GetMapping("/sns/kakao")
  public String snsKakao(String code) {
    log.info("인가코드: {}", code);

    Map<String, String> map = new HashMap<>();
    map.put("appKey", kakaoAppKey);
    map.put("redirect", kakaoRedirectURI);
    map.put("code", code);

    loginService.kakaoService(map);

    return "";
  }
}
