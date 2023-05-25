package company.friendsdog.dogcommunity.util;

import company.friendsdog.dogcommunity.entity.User;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class LoginUtil {

    // 로그인 한 유저의 펫 - 세션키
    public static final String LOGIN_KEY = "loginUser";
    // 자동로그인 쿠키
    public static final String AUTO_LOGIN_COOKIE="auto";

    // 세션에서 유저 객체 가져오기 이놈이 문제 도와줘 ..!
    public static User getCurrentLoginUser(
            HttpSession session) {

        return (User) session.getAttribute(LOGIN_KEY);
    }

    //로그인 여부 확인
    public static boolean isLogin(HttpSession session) {
        return session.getAttribute(LOGIN_KEY) != null;
    }

    // 자동 로그인 여부 확인
    public static boolean isAutoLogin(HttpServletRequest request) {
        return WebUtils.getCookie(request, AUTO_LOGIN_COOKIE) != null;
    }

    // 쿠키 가져오기
    public static Cookie getCookie(HttpServletRequest request){
        return WebUtils.getCookie(request, LoginUtil.AUTO_LOGIN_COOKIE);
    }

    // 로그인한 사람의 계정명을 반환하는 메서드
//    public static String getCurrentLoginMemberAccount(HttpSession session) {
//        LoginUserResponseDTO loginUserInfo = (LoginUserResponseDTO) session.getAttribute(LOGIN_KEY);
//        // 다운 캐스팅 object에서 dto로 변환
//        return loginUserInfo.getAccount();
//
//    }

}
