package company.friendsdog.dogcommunity.controller;

import company.friendsdog.dogcommunity.service.PetProfileService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/petprofile")
@Slf4j
public class PetProfileController {

    private final PetProfileService petProfileService;
    // 목록 조회 요청
    @GetMapping("/list")
    public String list(Model model) {
        log.info("/petprofile/list : GET");
//        petService.getList();

        return "";
    }
}
