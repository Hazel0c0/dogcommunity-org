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
}
