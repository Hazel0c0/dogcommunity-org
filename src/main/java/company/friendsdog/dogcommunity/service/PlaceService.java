package company.friendsdog.dogcommunity.service;

import company.friendsdog.dogcommunity.entity.Place;
import company.friendsdog.dogcommunity.repository.PlaceMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class PlaceService {
  private final PlaceMapper placeMapper;

  public List<Place> findPlace(String addr) {

    List<Place> placeList = placeMapper.findAll(addr);

    return placeList;
  }

  public List<String> findTheme() {
    List<String> themeList = placeMapper.findTheme();

    return themeList;
  }
  public List<Place> themeSearch(String addr, String keyword) {

    return placeMapper.search(addr,keyword);
  }
}
