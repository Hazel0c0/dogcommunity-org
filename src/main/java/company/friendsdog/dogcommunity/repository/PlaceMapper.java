package company.friendsdog.dogcommunity.repository;

import company.friendsdog.dogcommunity.entity.Place;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PlaceMapper {

  List<Place> findAll(String addr);
}
