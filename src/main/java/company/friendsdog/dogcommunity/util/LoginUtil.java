package company.friendsdog.dogcommunity.util;

import company.friendsdog.dogcommunity.entity.User;

import javax.servlet.http.HttpSession;


public class LoginUtil {

    // 로그인 한 유저의 펫 - 세션키
    public static final String LOGIN_KEY = "loginUserPet";

    public static User getCurrentLoginUserNo(
            HttpSession session) {
        User loginUser = (User) session.getAttribute(LOGIN_KEY);
        return loginUser;
    }
}
