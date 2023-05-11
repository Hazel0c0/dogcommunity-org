package company.friendsdog.dogcommunity.service;

import company.friendsdog.dogcommunity.entity.User;
import company.friendsdog.dogcommunity.repository.UserMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserService {
  private final UserMapper userMapper;
  public boolean userJoin() {
    User.builder().build();

    return false;
  }

  // 회원가입 중복 검사
  public boolean joinCheckValue(String type, String keyword) {

    userMapper.isDuplicate(type, keyword);
    return false;
  }
}
