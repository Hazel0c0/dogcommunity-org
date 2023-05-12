package company.friendsdog.dogcommunity.service;

import company.friendsdog.dogcommunity.dto.request.JoinRequestDTO;
import company.friendsdog.dogcommunity.dto.request.LoginRequestDTO;
import company.friendsdog.dogcommunity.entity.User;
import company.friendsdog.dogcommunity.repository.UserMapper;
import lombok.Builder;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import static company.friendsdog.dogcommunity.service.LoginResult.*;

@Service
@RequiredArgsConstructor
@Builder
@Slf4j
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

    int duplicateNum = userMapper.isDuplicate(type, keyword);
    return duplicateNum==1; //1== 중복이다
  }

  // 로그인 정보 확인
  public LoginResult loginAuthenticate(LoginRequestDTO dto) {
    User foundUser = userMapper.findUser(dto.getId());

    if (foundUser==null){
      log.info("{} 회원 정보 없음",dto);
      return NO_ACC;
    }
    if(dto.getPwd()!=foundUser.getPwd()){
      log.info("비밀번호 불일치");
      return NO_PW;
    }
    log.info("{}님 로그인 성공",foundUser.getUserNo());
    return SUCCESS;
  }
}
