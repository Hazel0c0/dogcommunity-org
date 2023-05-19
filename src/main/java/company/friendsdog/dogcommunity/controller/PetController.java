package company.friendsdog.dogcommunity.controller;

import company.friendsdog.dogcommunity.dto.PetProfileModifyRequestDTO;
import company.friendsdog.dogcommunity.dto.request.PetProfileRequestDTO;
import company.friendsdog.dogcommunity.dto.response.PetCardResponseDTO;
import company.friendsdog.dogcommunity.entity.Pet;
import company.friendsdog.dogcommunity.entity.User;
import company.friendsdog.dogcommunity.service.PetService;
import company.friendsdog.dogcommunity.util.LoginUtil;
import company.friendsdog.dogcommunity.util.upload.FileUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.List;

import static company.friendsdog.dogcommunity.util.LoginUtil.getCurrentLoginUser;
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

        return "neighbor/profileMod";
    }

  @Value("${file-upload.root-path}")
  private String rootPath;

    // 펫 프로필 정보 요청
    @PostMapping("/profile")
    public String petCardMake(PetProfileRequestDTO dto, HttpSession session) {
        log.info("펫 입력 정보 : {}", dto);
//    log.info("세션 : {}", session);

        // 파일 업로드
        String savePath = null;
        MultipartFile petPhoto = dto.getPetPhoto();
        if(!petPhoto.isEmpty()){
            savePath = FileUtil.uploadFile(petPhoto, rootPath);
        }

        boolean petSave = petService.petCardMake(dto, session,savePath);
//    log.info("펫 저장 : {}", petSave);

        // 추후 수정페이지로 보내줄거임
        return "/main/profile";
    }



    // 지도 띄워주기
    @GetMapping("/map")
    public String map(
            HttpSession session,
            Model model) {
        // 유저 있는 동네 보내주기
        List<String> dongList = petService.findAddrDetail(session);
        log.info("dong  : {}", dongList);

        model.addAttribute("dong", dongList);

        return "neighbor/map";
    }

    /**
     * 선택한 동네 강아지 보기
     *
     * @param addDetail - 유저가 선택한 동
     */
    @GetMapping("/neighbor")
    public String findNeighbor(
            String addDetail
            , Model model) {
        List<Pet> foundPet = petService.findNeighbor(addDetail);

        model.addAttribute("petList", foundPet);

        return "neighbor/neighbor";
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


    @GetMapping("/modify") // 수정 폼 을 열어주는애
    // 페이지 이동
    // db에서 업데이트를 할려면 뭐가 필요한지
    public String modifyData(HttpSession session, Model model) {

//        // true / false 여부
//        boolean flag = petService.modify(dto);

//        Long userNo = getCurrentLoginUser(session).getUserNo();
////        currUser.getPwd();
//
//        Long petNo = petService.findOne(userNo).getPetNo();
//
//        // 하나 하나 로그 찍어보기
//        log.info("mod petNo{}",petNo);
//
//
//        String hashTag = petService.getDetail((long) petNo).getHashtag();

        model.addAttribute("petNo", petNo);
        model.addAttribute("hashTag", hashTag);
//        model.addAttribute("session", session);


        log.info("petNo : {} ", petNo);

        return "neighbor/profileMod";
    }

    @PostMapping("/modify") //수정 폼안에 있는 데이터를 보내주는애, 수정하기 버튼 눌렀을 때
    public String modifyData(HttpSession session, PetProfileModifyRequestDTO dto, Model model) {

        log.info("mod POST");



        Long userNo = getCurrentLoginUser(session).getUserNo();
//        currUser.getPwd();

        Long petNo = petService.findOne(userNo).getPetNo();

        // 하나 하나 로그 찍어보기
        log.info("mod petNo{}",petNo);


        String hashTag = petService.getDetail((long) petNo).getHashtag();
        // 세션에서 유저 정보 가져오기
        User currUser = getCurrentLoginUser(session);

        Long userNo = currUser.getUserNo();
        // true / false 여부

        // 서비스에 dto(클라이언트에서 수정된값) + 세션에서 받아온 유저넘버 같이 넘겨주기 <=해결
        boolean flag = petService.modify(dto,userNo);

        //어디로 이동할지 정하기
        return "redirect:/pet/modify";
    }
}

