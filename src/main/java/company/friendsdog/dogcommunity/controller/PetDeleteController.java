package company.friendsdog.dogcommunity.controller;

import company.friendsdog.dogcommunity.service.PetProfileService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
@Controller
@RequiredArgsConstructor
@RequestMapping("/petprofile")
@Slf4j
public class PetDeleteController {

    private final PetProfileService petProfileService;
    
    // 삭제 기능 요청
    @PostMapping("/delete")
    public String deletePetProfile(int petNo) {
        log.info("/petprofile/delete : POST");
        petProfileService.deletePetProfile(petNo);
        return "redirect:/petprofile/list";

    }
}
