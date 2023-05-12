package company.friendsdog.dogcommunity.controller;

import company.friendsdog.dogcommunity.service.PetService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/pet")
@Slf4j
public class PetController {

    private final PetService petService;
    // 목록 조회 요청
    @GetMapping("/list")
    public String list(Model model) {
        log.info("/petprofile/list : GET");
        petService.findAll();

        return "/";
    }

//    @PostMapping("/delete")
//    public String deletePetProfile(int petNo) {
//        log.info("/petprofile/delete : POST");
//        petService.deletePetProfile(petNo);
//        return "redirect:/petprofile/list";
//
//    }
}
