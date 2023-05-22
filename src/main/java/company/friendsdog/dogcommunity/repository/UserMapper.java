package company.friendsdog.dogcommunity.repository;

import company.friendsdog.dogcommunity.dto.AutoLoginDTO;
import company.friendsdog.dogcommunity.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UserMapper {

  boolean save(User user);
  User findUser(String id);
  void modify();
  int isDuplicate(
      @Param("type") String type,
      @Param("keyword") String keyword);


  // 자동로그인 쿠키 DB 저장
  void saveAutoLogin(AutoLoginDTO dto);

  // 쿠키값(세션아이디)으로 회원을 조회하는 기능
  User findUserByCookie(String sessionId);
}
