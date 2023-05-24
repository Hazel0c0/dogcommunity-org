package company.friendsdog.dogcommunity.repository;

import company.friendsdog.dogcommunity.entity.Place;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface PlaceMapper {

  List<Place> findAll(String addr);

  List<String> findTheme(String addr);

  List<Place> search(
      @Param("addr") String addr,
      @Param("keyword") String keyword);
}
