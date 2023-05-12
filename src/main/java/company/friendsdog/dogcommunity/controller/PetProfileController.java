package company.friendsdog.dogcommunity.controller;

import company.friendsdog.dogcommunity.dto.PetProfileModifyRequestDTO;
import company.friendsdog.dogcommunity.entity.Pet;
import company.friendsdog.dogcommunity.service.PetProfileService;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/petprofile")
@Slf4j
public class PetProfileController {

    private final PetProfileService petProfileService;
    private List<company.friendsdog.dogcommunity.entity.Pet> Pet;

    //프로필 조회 요청
    @GetMapping("/detail")

    public List<Pet> detail(Long petNo){

        //pet

        return Pet;
    }



    @PostMapping("/modify")
    public String modifyData(PetProfileModifyRequestDTO dto) {

        // true / false 여부
        boolean flag = petProfileService.modify(dto);

        return "";
    }
}
