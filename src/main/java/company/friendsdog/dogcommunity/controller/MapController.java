package company.friendsdog.dogcommunity.controller;

import company.friendsdog.dogcommunity.dto.request.MapRequestDTO;
import company.friendsdog.dogcommunity.entity.Pet;
import company.friendsdog.dogcommunity.entity.Place;
import company.friendsdog.dogcommunity.page.Page;
import company.friendsdog.dogcommunity.page.PageMaker;
import company.friendsdog.dogcommunity.service.BoardService;
import company.friendsdog.dogcommunity.service.PlaceService;
import company.friendsdog.dogcommunity.service.PetService;
import company.friendsdog.dogcommunity.util.LoginUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.catalina.Session;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.springframework.http.ResponseEntity.ok;

@Controller
@RequiredArgsConstructor
@RequestMapping("/map")
@Slf4j
public class MapController {
  private final PetService petService;
  private final BoardService boardService;
  private final PlaceService placeService;

  // 지도 띄워주기
  @GetMapping("/map")
  public String map(
      HttpSession session,
      Model model) {

    model.addAttribute("noneSidebar", true);

    return "map/map";
  }

  // 선택한 동네 띄우기
  @GetMapping("/point")
  public String map(
      MapRequestDTO mapDTO,
      Model model
  ) {

    model.addAttribute("map", mapDTO);
    model.addAttribute("noneSidebar", true);

    List<String> themeList = placeService.findTheme();
    model.addAttribute("themeList", themeList);

    return "map/point";
  }

  @ResponseBody
  @GetMapping("/api/point/{addr}/{keyword}")
  @CrossOrigin(origins = {"http://127.0.0.1:5500"})
  public ResponseEntity<?> themeSearch(
      @PathVariable String addr,
      @PathVariable String keyword) {
    log.info("addr {} , keywore {}", addr, keyword);

    List<Place> places = placeService.themeSearch(addr, keyword);
    System.out.println("places = " + places);
    return ok().body(places);
  }

  @ResponseBody
  @GetMapping("/api/point/{addr}")
  @CrossOrigin(origins = {"http://127.0.0.1:5500"})
  public ResponseEntity<?> point(
      @PathVariable String addr
  ) {
    List<Place> placeList = placeService.findPlace(addr);
//    System.out.println("placeList = " + placeList);
    return ok().body(placeList);
  }


  // 우리 동네 강아지 보기
  @GetMapping("/neighbor")
  public String findNeighbor(
      HttpSession session,
      Model model,
      Page page
  ) {
    model.addAttribute("noneSidebar", true);

    String addr = LoginUtil.getCurrentLoginUser(session).getAddr();
    List<Pet> foundPet = petService.findNeighbor(addr);

    model.addAttribute("addr", addr);
    model.addAttribute("petList", foundPet);

    PageMaker maker = new PageMaker(page, petService.petCount(addr));
    model.addAttribute("maker", maker);

    return "map/neighbor";
  }
}
