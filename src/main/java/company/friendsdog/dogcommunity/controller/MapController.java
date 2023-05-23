package company.friendsdog.dogcommunity.controller;

import company.friendsdog.dogcommunity.dto.request.MapRequestDTO;
import company.friendsdog.dogcommunity.entity.Pet;
import company.friendsdog.dogcommunity.entity.Place;
import company.friendsdog.dogcommunity.page.Page;
import company.friendsdog.dogcommunity.page.PageMaker;
import company.friendsdog.dogcommunity.service.BoardService;
import company.friendsdog.dogcommunity.service.PlaceService;
import company.friendsdog.dogcommunity.service.PetService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

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


    return "map/map";
  }

  // 선택한 동네 띄우기
  @GetMapping("/point")
  public String point(
      MapRequestDTO mapDTO,
      Model model) {
    System.out.println("mapDTO = " + mapDTO);

    List<Place> placeList = placeService.findPlace(mapDTO.getAddr());
    Place place = placeList.get(0);

    System.out.println("placeList = " + placeList);

    model.addAttribute("map", mapDTO);
    model.addAttribute("placeList", placeList);
    model.addAttribute("place", place);

    return "map/point";
  }

  /**
   * 선택한 동네 강아지 보기
   *
   * @param addr - 유저가 선택한 구
   */
  @GetMapping("/neighbor")
  public String findNeighbor(
      String addr,
      Model model,
      Page page
  ) {

    List<Pet> foundPet = petService.findNeighbor(addr);
    boolean noneSidebar = true;

    PageMaker maker = new PageMaker(page, petService.petCount(addr));

    model.addAttribute("addr", addr);
    model.addAttribute("petList", foundPet);
    model.addAttribute("maker", maker);
    model.addAttribute("noneSidebar", noneSidebar);

    return "map/neighbor";
  }
}
