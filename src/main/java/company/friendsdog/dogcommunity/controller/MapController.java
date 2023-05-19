package company.friendsdog.dogcommunity.controller;

import company.friendsdog.dogcommunity.entity.Pet;
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

  // 지도 띄워주기
  @GetMapping("/map")
  public String map(
      HttpSession session,
      Model model) {
    // 유저 있는 동네 보내주기
    List<String> dongList = petService.findAddrDetail(session);
    log.info("dong  : {}", dongList);

    model.addAttribute("dong", dongList);

    return "neighbor/map";
  }
  /**
   * 선택한 동네 강아지 보기
   *
   * @param addDetail - 유저가 선택한 동
   */
  @GetMapping("/neighbor")
  public String findNeighbor(
      String addDetail
      , Model model) {
    List<Pet> foundPet = petService.findNeighbor(addDetail);

    model.addAttribute("petList",foundPet);

    return "neighbor/neighbor";
  }
}