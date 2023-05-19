package company.friendsdog.dogcommunity.controller;

import company.friendsdog.dogcommunity.dto.PetProfileModifyRequestDTO;
import company.friendsdog.dogcommunity.dto.request.PetProfileRequestDTO;
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
  private final PetService petService;

  // 펫 프로필 카드 만들기 페이지 요청
  @GetMapping("/profile")
  public String petCardMake() {
    log.info("펫 카드 만들기 GET");

    return "/main/profile";
  }

  // 펫 프로필 정보 요청
  @PostMapping("/profile")
  public String petCardMake(PetProfileRequestDTO dto, HttpSession session) {
    log.info("펫 입력 정보 : {}", dto);
    log.info("세션 : {}", session);

    boolean petSave = petService.petCardMake(dto, session);
    log.info("펫 저장 : {}", petSave);

    return "/user/main";
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
