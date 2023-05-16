package company.friendsdog.dogcommunity.util;

import company.friendsdog.dogcommunity.entity.Pet;
import company.friendsdog.dogcommunity.entity.User;

import javax.servlet.http.HttpSession;

public class LoginUtil {

    // 로그인 한 유저의 펫 - 세션키
    public static final String LOGIN_KEY = "loginUser";

    // 세션에서 유저 객체 가져오기
    public static User getCurrentLoginUser(
            HttpSession session) {
        User loginUser = (User) session.getAttribute(LOGIN_KEY);

        return loginUser;
    }

    //로그인 여부 확인 : 범용으로 쓰게 static 로그인을 했는지 알려면 세션 받아오기
    public static boolean isLogin(HttpSession session) {
        return session.getAttribute(LOGIN_KEY) != null;
    }

    // 로그인한 사람의 계정명을 반환하는 메서드
//    public static String getCurrentLoginMemberAccount(HttpSession session) {
//        LoginUserResponseDTO loginUserInfo = (LoginUserResponseDTO) session.getAttribute(LOGIN_KEY);
//        // 다운 캐스팅 object에서 dto로 변환
//        return loginUserInfo.getAccount();
//
//    }

}
