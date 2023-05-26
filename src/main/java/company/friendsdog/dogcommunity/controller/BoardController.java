package company.friendsdog.dogcommunity.controller;

import company.friendsdog.dogcommunity.dto.page.PageMaker;
import company.friendsdog.dogcommunity.dto.page.Search;
import company.friendsdog.dogcommunity.dto.request.BoardRequestDTO;
import company.friendsdog.dogcommunity.dto.response.BoardDetailResponseDTO;
import company.friendsdog.dogcommunity.dto.response.BoardListResponseDTO;
import company.friendsdog.dogcommunity.entity.Pet;
import company.friendsdog.dogcommunity.entity.User;
import company.friendsdog.dogcommunity.repository.PetMapper;
import company.friendsdog.dogcommunity.repository.UserMapper;
import company.friendsdog.dogcommunity.service.BoardService;
import company.friendsdog.dogcommunity.util.LoginUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

import static company.friendsdog.dogcommunity.util.LoginUtil.LOGIN_KEY;
import static company.friendsdog.dogcommunity.util.upload.FileUtil.uploadFile;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board")
@Slf4j
public class BoardController {

    @Value("${file.upload.root-path}")
    private String rootPath;

    private final BoardService boardService;
    private final PetMapper petMapper;

    // 게시판 목록 조회 요청
    @GetMapping("/main")
    public String petFindAll(Search page, Model model) {
        log.info("/board/list : GET");
        log.info("page : {}", page);
        List<BoardListResponseDTO> dto = boardService.boardFindAll(page);
//        log.info("listdto[0] : {}", dto.get(0));
        PageMaker maker = new PageMaker(page, boardService.count(page));

        model.addAttribute("bList", dto);
        model.addAttribute("p", page);
        model.addAttribute("maker", maker);


        return "/board/list2";
    }

//    // 게시판 상세 조회 요청
//    @GetMapping("/detail")
//    public String boardFindOne(Long boardNo, Search search, Model model) {
////        log.info("/board/detail : GET");
//        log.info("boardNo - {}", boardNo);
//        BoardDetailResponseDTO dto = boardService.boardFindOne(boardNo);
//        model.addAttribute("b", dto);
//        model.addAttribute("p", search);
//        log.info("dto- {}", dto);
//        return "board/detail";
//    }

    // 게시판 글쓰기 화면 조회 요청
    @GetMapping("/write")
    public String save(HttpSession session, Model model) {
        Long userNoInfo = LoginUtil.getCurrentLoginUser(session).getUserNo();
        Pet p = petMapper.userFindPet(userNoInfo);
        if(p == null)
        {
            return "redirect:/pet/profile";
        }
        Pet pet = boardService.userFindPet(session);
        model.addAttribute("p", pet);

        return "board/write";
    }

    // 게시판 글쓰기 요청 처리
    @PostMapping("/write")
    public String save(BoardRequestDTO dto, HttpSession session) {
        log.info("/board/write : POST@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ - {}", dto);
//        log.info("첨부파일 사진 이름: {}", dto.getAttachedImg().getOriginalFilename());
//        log.info("경로 - {}",rootPath);

        String imgPath = uploadFile(dto.getAttachedImg(), rootPath);
        boardService.save(dto, session, imgPath);
        log.info("dto @@@@@@@@@@@@@@ - {}", dto);
        return "redirect:/board/main";
    }

    // 게시판 삭제 요청 처리
    @PostMapping("/delete")
    public String delete(Long boardNo, HttpSession session) {
        log.info("/board/delete : POST");
        log.info("boardNo - {}", boardNo);
        boardService.delete(boardNo, session);
        return "redirect:/board/main";
    }

    // 게시판 수정 화면 조회 요청
    @GetMapping("/upload")
    public String modify() {
        log.info("/api/v1/board/upload : GET");
        return "board/upload";
    }


    // 게시판 수정 요청 처리
    @PostMapping("/upload")
    public String modify(BoardRequestDTO dto,  HttpSession session) {
        log.info("/api/v1/board/upload : POST");
        log.info("content -  {}", dto.getContent());
        log.info("attachedImg - {}", dto.getAttachedImg());
        log.info("petPhoto - {}", dto.getPetPhoto());
        log.info("petName - {}", dto.getPetName());
        boardService.modify(dto);
        return "redirect:/board/main";
    }

//    // 게시판 수정 화면 조회 요청 : 빛나 message.jsp 테스트 용
//    @GetMapping("/message")
//    public String save() {
//        log.info("/api/v1/board/message : GET");
//        return "board/message";
//    }
}
