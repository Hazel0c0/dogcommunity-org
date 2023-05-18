package company.friendsdog.dogcommunity.service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.util.Map;

@Service
@Slf4j
public class SmsLoginService {

  // 카카오 로그인 서비스
  public void kakaoService(Map<String, String> requestMap) {
    String accessToken = getKakaoAccessToken(requestMap);

  }

  private String getKakaoAccessToken(Map<String, String> requestMap) {

    String requestUri = "https://kauth.kakao.com/oauth/token";

  }
}
