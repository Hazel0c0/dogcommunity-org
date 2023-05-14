package company.friendsdog.dogcommunity.repository;

import company.friendsdog.dogcommunity.entity.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {

  boolean save(User user);
  User findUser(Long uNo);
  void modify();
  int isDuplicate(String type, String keyword);


}
