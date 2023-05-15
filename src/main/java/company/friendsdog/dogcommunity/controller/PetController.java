package company.friendsdog.dogcommunity.controller;

import company.friendsdog.dogcommunity.dto.PetProfileModifyRequestDTO;
import company.friendsdog.dogcommunity.dto.response.PetCardResponseDTO;
import company.friendsdog.dogcommunity.entity.Pet;
import company.friendsdog.dogcommunity.service.PetService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

import static org.springframework.http.ResponseEntity.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("/pet")
@Slf4j
public class PetController {

  // 펫 프로필 기입
  @GetMapping("/profile")
  public String petCard() {
    log.info("GET");
    return "/main/profile";
  }

  private final PetService petService;

  // 강남구 강아지 요청
  @GetMapping("/neighbor1")
  public String findingNeighbor(Model model
    ,HttpSession session //세션에 유저 정보 (ㅇㅇ구)
  ){


    return null;
  }



  // 이웃 펫 찾기
  @GetMapping("/neighbor2")
  public String findingNeighbor2(Model model
      , String keyword
//            , HttpSession session
  ) {
//        session=null;
    log.info("/petprofile/list : GET");

    // ㅇㅇ동 전체 강아지
    List<PetCardResponseDTO> petList = petService.findingNeighbor(null, keyword);

    // ㅇㅇ동 가장 인기있는 강아지
    PetCardResponseDTO bestPet = petList.stream()
                                        .findFirst().get();

    model.addAttribute("petList", petList);
    model.addAttribute("bestPet", bestPet);

    return "/pet/neighbor";
  }

  @PostMapping("/delete")
  public String delete(Long petNo) {
    log.info("/pet/delete : POST");
    petService.delete(petNo);
    return "redirect:/pet/list";

  }

  //프로필 조회 요청

  @GetMapping("/detail")
  public Pet detail(Long petNo) {

    Pet pet = petService.getDetail(petNo);
    //pet
    return pet;
  }


  @PostMapping("/modify")
  public String modifyData(PetProfileModifyRequestDTO dto) {

    // true / false 여부
    boolean flag = petService.modify(dto);

    return "";
  }
}
