package company.friendsdog.dogcommunity.controller;

import company.friendsdog.dogcommunity.dto.page.Search;
import company.friendsdog.dogcommunity.dto.request.BoardRequestDTO;
import company.friendsdog.dogcommunity.dto.response.BoardDetailResponseDTO;
import company.friendsdog.dogcommunity.dto.response.BoardListResponseDTO;
import company.friendsdog.dogcommunity.entity.User;
import company.friendsdog.dogcommunity.repository.UserMapper;
import company.friendsdog.dogcommunity.service.BoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

import static company.friendsdog.dogcommunity.util.LoginUtil.LOGIN_KEY;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board")
@Slf4j
public class BoardController {

    private final BoardService boardService;

    // 게시판 목록 조회 요청
    @GetMapping("/list")
    public String petFindAll(Search page, Model model) {
        log.info("/board/list : GET");
        log.info("page : {}", page);
        List<BoardListResponseDTO> dto = boardService.petFindAll(page);

        model.addAttribute("bList", dto);
        model.addAttribute("p", page);

        return "board/list";
    }

    // 게시판 상세 조회 요청
    @GetMapping("/detail")
    public String petFindOne(Long petNo, Search search, Model model) {
        log.info("/board/detail : GET");
        BoardDetailResponseDTO dto = boardService.petFindOne(petNo);
        model.addAttribute("b", dto);
        model.addAttribute("p", search);

        return "board/detail";


    }

    // 게시판 글쓰기 화면 조회 요청
    @GetMapping("/write")
    public String save(HttpSession session) {
        log.info("/board/write : GET@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
        return "board/write";
    }

    // 게시판 글쓰기 요청 처리
    @PostMapping("/write")
    public String save(BoardRequestDTO dto, HttpSession session) {


        log.info("/board/write : POST@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
        boardService.save(dto,session);
        return "redirect:/board/list";
    }
    // 게시판 삭제 요청 처리
    @PostMapping("/delete")
    public String delete(Long petNo) {
        log.info("/board/delete : POST");
        boardService.delete(petNo);
        return "redirect:/board/list";
    }

    // 게시판 수정 화면 조회 요청
    @GetMapping("/upload")
    public String modify() {
        log.info("/api/v1/board/upload : GET");
        return "board/upload";
    }


    // 게시판 수정 요청 처리
    @PostMapping("/upload")
    public String modify(BoardRequestDTO dto) {
        log.info("/api/v1/board/upload : POST");
        boardService.modify(dto);
        return "redirect:/board/list";
    }
}
