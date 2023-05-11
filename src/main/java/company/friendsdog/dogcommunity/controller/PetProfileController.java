package company.friendsdog.dogcommunity.controller;

import company.friendsdog.dogcommunity.dto.response.PetProfileCardDTO;
import company.friendsdog.dogcommunity.service.PetProfileService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

import static org.springframework.http.ResponseEntity.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("/petprofile")
@Slf4j
public class PetProfileController {

    private final PetProfileService petProfileService;


    @PostMapping("/delete")
    public String deletePetProfile(int petNo) {
        log.info("/petprofile/delete : POST");
        petProfileService.deletePetProfile(petNo);
        return "redirect:/petprofile/list";

    }
}
