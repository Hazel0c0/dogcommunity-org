package company.friendsdog.dogcommunity.controller;

import company.friendsdog.dogcommunity.dto.PetProfileModifyRequestDTO;
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

import java.util.List;

import static org.springframework.http.ResponseEntity.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("/pet")
@Slf4j
public class PetController {

    @GetMapping("/profile")
    public String userJoin(){
        log.info("GET");
        return "/main/profile";
    }
    private final PetService petService;
    // 목록 조회 요청
    @GetMapping("/list")
    public String list(Model model) {
        log.info("/petprofile/list : GET");
        petService.findAll();

        return "/pet/list";
    }

    @PostMapping("/delete")
    public String delete(Long petNo) {
        log.info("/pet/delete : POST");
        petService.delete(petNo);
        return "redirect:/pet/list";

    }

    //프로필 조회 요청

    @GetMapping("/detail")
    public Pet detail(Long petNo){

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
