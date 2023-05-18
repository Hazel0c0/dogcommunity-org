package company.friendsdog.dogcommunity.interceptor;

import company.friendsdog.dogcommunity.entity.User;
import company.friendsdog.dogcommunity.repository.UserMapper;
import company.friendsdog.dogcommunity.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.time.LocalDateTime;

import static company.friendsdog.dogcommunity.util.LoginUtil.AUTO_LOGIN_COOKIE;

@Configuration
@RequiredArgsConstructor
@Slf4j
public class AutoLoginInterceptor implements HandlerInterceptor {
  private final UserMapper userMapper;
  private final UserService userService;
  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
//    log.info("auto login");
    // getCookies
    Cookie c = WebUtils.getCookie(request, AUTO_LOGIN_COOKIE);

    if (c!=null){
      String sessionId = c.getValue(); // 쿠키에 저장된 session id
      log.info("세션아이디 : {}",sessionId);

      // 세션아이디로 유저 조회하기
      User foundUser = userMapper.findUserByCookie(sessionId);

      if (foundUser!= null // 회원이 있고
          && LocalDateTime.now().isBefore( // 자동로그인 만료일 이전
          foundUser.getCookieLimitTime())){
        // 5. 로그인 처리
          userService.maintainLoginState(
              request.getSession(),foundUser.getId());
      }
    }
    return true;
  }
}
