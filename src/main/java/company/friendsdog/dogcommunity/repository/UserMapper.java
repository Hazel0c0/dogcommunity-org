package company.friendsdog.dogcommunity.repository;

import company.friendsdog.dogcommunity.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UserMapper {

  boolean save(User user);
  User findUser(Long uNo);
  void modify();
  int isDuplicate(
      @Param("type") String type,
      @Param("keyword") String keyword);


}
