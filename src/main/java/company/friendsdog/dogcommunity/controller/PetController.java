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
import org.springframework.web.bind.annotation.*;
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
        return "pet/profileMod";
        //  return "neighbor/profileMod";
    }

    @Value("${file.upload.root-path}")
    private String rootPath;

    @PostMapping("/upload-file")

    public String uploadForm(@RequestParam("thumbnail") MultipartFile file) {
        log.info("file-name: {}", file.getOriginalFilename());
        log.info("file-size: {}KB", (double) file.getSize() / 1024);
        log.info("file-type: {}", file.getContentType());

        String filePath = FileUtil.uploadFile(file, rootPath);

        return "redirect:/upload-form";
    }

    // 펫 프로필 정보 요청
    @PostMapping("/profile")
    public String petCardMake(PetProfileRequestDTO dto, HttpSession session) {
        log.info("펫 입력 정보 : {}", dto);
//    log.info("세션 : {}", session);

        // 파일 업로드
        String savePath = null;
        MultipartFile petPhoto = dto.getPetPhoto();
        if (!petPhoto.isEmpty()) {
            savePath = FileUtil.uploadFile(petPhoto, rootPath);
        }

        boolean petSave = petService.petCardMake(dto, session, savePath);
//    log.info("펫 저장 : {}", petSave);

        // 추후 수정페이지로 보내줄거임
        return "/main/profile";
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
//    Long petNo = petService.findOne(userNo).getPetNo();
//
//        // 하나 하나 로그 찍어보기
//        log.info("mod petNo{}",petNo);
//
//
//       String hashTag = petService.getDetail((long) petNo).getHashtag();
//
//        model.addAttribute("petNo", petNo);
//        model.addAttribute("hashTag", hashTag);
//        model.addAttribute("session", session);


//        log.info("petNo : {} ", petNo);

        return "pet/profileMod";
    }

    @PostMapping("/modify") //수정 폼안에 있는 데이터를 보내주는애, 수정하기 버튼 눌렀을 때
    public String modifyData(HttpSession session, PetProfileModifyRequestDTO dto, Model model) {

        log.info("mod POST");


        // 로그인한 유저 넘버
        Long userNo = getCurrentLoginUser(session).getUserNo();
        log.info("유저 넘버 : {}", userNo);
//        currUser.getPwd();

        // 유저넘버로 찾은 펫 넘머
        Long petNo = petService.findOne(userNo).getPetNo();
        log.info("펫 넘버 : {}", petNo);

        log.info(dto.getHashtag());

//        String hashTag = petService.getDetail((long) petNo).getHashtag();
        // 세션에서 유저 정보 가져오기

        //Long userNo = currUser.getUserNo();
        // true / false 여부

        // 서비스에 dto(클라이언트에서 수정된값) + 세션에서 받아온 유저넘버 같이 넘겨주기 <=해결

        boolean flag = petService.modify(dto, petNo, rootPath);

        //어디로 이동할지 정하기
        return "redirect:/pet/modify";
    }
}

