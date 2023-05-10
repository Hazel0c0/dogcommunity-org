package company.friendsdog.dogcommunity.controller;

import company.friendsdog.dogcommunity.dto.response.PetProfileCardDTO;
import company.friendsdog.dogcommunity.service.PetProfileService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import static org.springframework.http.ResponseEntity.ok;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/api/v1/petprofiles")
@Slf4j
public class PetProfileController {

    private final PetProfileService petProfileService;

    // 목록 조회 요청
//    @GetMapping("/{profileNo}/list/{pageNo}")
//    @ResponseBody
//    public ResponseEntity<?> list(
//            @PathVariable int profileNo,
//            @PathVariable int pageNo) {
//        log.info("api/v1/petprofiles/{profileNo}/list/{pageNo}: GET",
//                profileNo, pageNo);
//
//        // 펫 프로필 목록 (테마별 검색)
//        List<PetProfileCardDTO> petProfileList
//                = petProfileService.findPetProfile();
//
//        return ok().body(petProfileList);
//    }

    // 삭제 기능 요청
    @PostMapping("/delete")
    public String deletePetProfile(int petNo) {
        log.info("/petprofile/delete : POST");
        petProfileService.deletePetProfile(petNo);
        return "redirect:/petprofile/list";
    }

//    @DeleteMapping("/{petNo}")
//    public ResponseEntity<?> deletePetProfile(
//            @PathVariable(required = false) int petNo
//    ) {
//
//        log.info("api/v1/petprofiles/{} DELETE!", petNo);
//
//        try {
//            petProfileService.deletePetProfile(petNo);
//            log.info("flag: {} ", petProfileService.deletePetProfile(petNo));
//            log.info("petProfile: {}", petProfileService.findPetProfile());
//            return ResponseEntity
//                    .ok()
//                    .body(petProfileService.findPetProfile());
//        } catch (Exception e) {
//            return ResponseEntity
//                    .internalServerError()
//                    .body(e.getMessage());
//        }
//    }

}
