package company.friendsdog.dogcommunity.service;

import company.friendsdog.dogcommunity.dto.KakaoUserDTO;
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
    log.info("token : {}", accessToken);

    KakaoUserDTO dto = getKakaoUserInfo(accessToken);

  }

  private KakaoUserDTO getKakaoUserInfo(String accessToken) {
    String requestUri = "https://kapi.kakao.com/v2/user/me";

    // 요청 헤더 설정
    HttpHeaders headers = new HttpHeaders();
    headers.add("Authorization", "Bearer " + accessToken);

    // 요청 보내기
    RestTemplate template = new RestTemplate();
    ResponseEntity<KakaoUserDTO> responseEntity = template.exchange(
        requestUri,
        HttpMethod.GET,
        new HttpEntity<>(headers),
        KakaoUserDTO.class
    );

    // 응답 바디 읽기
    KakaoUserDTO responseData = responseEntity.getBody();
    log.info("user profile: {}", responseData);

    return responseData;
  }

  private String getKakaoAccessToken(Map<String, String> requestMap) {
    log.info("토큰 requestMap : {}", requestMap);

    String requestUri = "https://kauth.kakao.com/oauth/token";


    MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
    params.add("grant_type", "authorization_code");
    params.add("client_id", requestMap.get("appkey"));
    params.add("redirect_uri", requestMap.get("redirect"));
    params.add("code", requestMap.get("code"));

    RestTemplate template = new RestTemplate();

    HttpHeaders headers = new HttpHeaders();
    headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

    HttpEntity<Object> requestEntity = new HttpEntity<>(params, headers);

    ResponseEntity<Map> responseEntity = template.exchange
        (requestUri, HttpMethod.POST, requestEntity, Map.class);

    Map<String, Object> responseData
        = (Map<String, Object>) responseEntity.getBody();

    log.info("토큰 요청 응답데이터: {}", responseData);

    return (String) responseData.get("access_token");

  }
}
