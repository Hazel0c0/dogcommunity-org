package company.friendsdog.dogcommunity.repository;

import company.friendsdog.dogcommunity.entity.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {

  boolean save(User user);
  void findUser();
  void modify();
  void isDuplicate(String type, String keyword);
}
