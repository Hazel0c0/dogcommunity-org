package company.friendsdog.dogcommunity.service;

import company.friendsdog.dogcommunity.dto.request.JoinRequestDTO;
import company.friendsdog.dogcommunity.entity.User;
import company.friendsdog.dogcommunity.repository.UserMapper;
import lombok.Builder;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Builder
public class UserService {
  private final UserMapper userMapper;

  // 회원가입 처리
  public boolean userJoin(JoinRequestDTO dto) {

    User newUser = User.builder()
        .id(dto.getId())
        .pwd(dto.getPwd())
        .userName(dto.getUserName())
        .email(dto.getEmail())
        .phoneNum(dto.getPhoneNum())
        .adds(dto.getAdds())
        .build();

    return userMapper.save(newUser);
  }

  // 회원가입 중복 검사
  public boolean joinCheckValue(String type, String keyword) {

    userMapper.isDuplicate(type, keyword);
    return false;
  }
}
