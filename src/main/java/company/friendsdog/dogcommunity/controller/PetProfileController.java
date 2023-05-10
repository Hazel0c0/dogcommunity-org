//package company.friendsdog.dogcommunity.controller;
//
//import company.friendsdog.dogcommunity.dto.response.PetProfileCardDTO;
//import company.friendsdog.dogcommunity.service.PetProfileService;
//import lombok.RequiredArgsConstructor;
//import lombok.extern.slf4j.Slf4j;
//import org.springframework.http.ResponseEntity;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//import static org.springframework.http.ResponseEntity.ok;
//
//import java.util.List;
//
//@RestController
//@RequiredArgsConstructor
//@RequestMapping("/api/v1/petprofiles")
//@Slf4j
//public class PetProfileController {
//
//    private final PetProfileService petProfileService;
//    // 목록 조회 요청
////    @GetMapping("/{profileNo}/list/{pageNo}")
//    @GetMapping("/list")
////    public String list(
//    public ResponseEntity<?> list(
////                  @PathVariable int profileNo,
////                  @PathVariable int pageNo
//    )
//    {
////        log.info("api/v1/petprofiles/{profileNo}/list/{pageNo}: GET",
////                profileNo,pageNo);
//
//        // 펫 프로필 목록 (테마별 검색)
//        List<PetProfileCardDTO> petProfileList
//                = petProfileService.findPetProfile();
//
//        return ok().body(petProfileList);
//    }
//}
