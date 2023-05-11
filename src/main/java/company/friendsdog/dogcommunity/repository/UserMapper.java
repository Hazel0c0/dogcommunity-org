package company.friendsdog.dogcommunity.repository;

public interface UserMapper {

  void findUser();
  void modify();
  void isDuplicate(String type, String keyword);
}
