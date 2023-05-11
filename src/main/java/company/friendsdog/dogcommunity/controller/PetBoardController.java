package company.friendsdog.dogcommunity.controller;

import company.friendsdog.dogcommunity.dto.page.Search;
import company.friendsdog.dogcommunity.dto.request.PetBoardRequestDTO;
import company.friendsdog.dogcommunity.dto.response.PetBoardDetailResponseDTO;
import company.friendsdog.dogcommunity.dto.response.PetBoardListResponseDTO;
import company.friendsdog.dogcommunity.service.PetBoardService;
import lombok.Getter;
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
@RequestMapping("/api/v1/board")
@Slf4j
public class PetBoardController {

    private final PetBoardService boardService;

    // 게시판 목록 조회 요청
    @GetMapping("list")
    public String petFindAll(Search page, Model model) {
        log.info("/api/v1/board/list : GET");
        log.info("page : {}", page);
        List<PetBoardListResponseDTO> dto = boardService.petFindAll(page);

        model.addAttribute("bList", dto);
        model.addAttribute("p", page);

        return "redirect:/api/v1/board/list";
    }

    // 게시판 상세 조회 요청
    @GetMapping("/detail")
    public String petFindOne(int boardNo, Search search, Model model) {
        log.info("/api/v1/board/detail : GET");
        PetBoardDetailResponseDTO dto = boardService.petFindOne(boardNo);
        model.addAttribute("b", dto);
        model.addAttribute("s", search);

        return "redirect:/api/v1/board/detail";


    }

    // 게시판 글쓰기 화면 조회 요청
    @GetMapping("/write")
    public String save() {
        log.info("/api/v1/board/write : GET");
        return "redirect:/api/v1/board/write";
    }

    // 게시판 글쓰기 요청 처리
    @PostMapping("/write")
    public String save(PetBoardRequestDTO dto) {

        log.info("/api/v1/board/write : POST");
        boardService.save(dto);
        return "redirect:/api/v1/board/list";
    }
    // 게시판 삭제 요청 처리
    @PostMapping("/delete")
    public String delete(int boardNo) {
        log.info("/api/v1/board/delete : POST");
        boardService.delete(boardNo);
        return "redirect:/api/v1/board/list";
    }

    // 게시판 수정 화면 조회 요청
    @GetMapping("/upload")
    public String modify() {
        log.info("/api/v1/board/upload : GET");
        return "redirect:/api/v1/board/upload";
    }


    // 게시판 수정 요청 처리
    @PostMapping("/upload")
    public String modify(PetBoardRequestDTO dto) {
        log.info("/api/v1/board/upload : POST");
        boardService.modify(dto);
        return "redirect:/api/v1/board/list";
    }
}
