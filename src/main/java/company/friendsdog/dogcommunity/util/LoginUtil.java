package company.friendsdog.dogcommunity.util;

import company.friendsdog.dogcommunity.entity.Pet;

import javax.servlet.http.HttpSession;

public class LoginUtil {

    // 로그인 한 유저의 펫 - 세션키
    public static final String LOGIN_KEY = "loginUserPet";

    public static Long getCurrentLoginPetNo(
            HttpSession session) {
        Pet loginPet = (Pet) session.getAttribute(LOGIN_KEY);

        return loginPet.getPetNo();
    }
}
