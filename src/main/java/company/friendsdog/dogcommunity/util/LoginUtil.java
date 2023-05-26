package company.friendsdog.dogcommunity.util;

import company.friendsdog.dogcommunity.entity.User;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
@Slf4j
public class LoginUtil {

    // 로그인 한 유저의 펫 - 세션키
    public static final String LOGIN_KEY = "loginUser";
    // 자동로그인 쿠키
    public static final String AUTO_LOGIN_COOKIE="auto";

    // 세션에서 유저 객체 가져오기
    public static User getCurrentLoginUser(
            HttpSession session) {
        User loginUser = (User) session.getAttribute(LOGIN_KEY);
        log.info("loginUser- {}", loginUser);
        return loginUser;
    }

    //로그인 여부 확인
    public static boolean isLogin(HttpSession session) {
        return session.getAttribute(LOGIN_KEY) != null;
    }
    public static boolean isPet(HttpSession session) {
        return session.getAttribute("loginPet") != null;
    }

    // 자동 로그인 여부 확인
    public static boolean isAutoLogin(HttpServletRequest request) {
        return WebUtils.getCookie(request, AUTO_LOGIN_COOKIE) != null;
    }

    // 쿠키 가져오기
    public static Cookie getCookie(HttpServletRequest request){
        return WebUtils.getCookie(request, LoginUtil.AUTO_LOGIN_COOKIE);
    }


}
