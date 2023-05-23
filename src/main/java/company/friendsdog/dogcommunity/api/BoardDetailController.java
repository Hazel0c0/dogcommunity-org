package company.friendsdog.dogcommunity.api;

import company.friendsdog.dogcommunity.dto.page.Search;
import company.friendsdog.dogcommunity.dto.response.BoardDetailResponseDTO;
import company.friendsdog.dogcommunity.service.BoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import static org.springframework.http.ResponseEntity.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/detail")
@Slf4j
public class BoardDetailController {

    private final BoardService boardService;
    // 게시판 상세 조회 요청
    @GetMapping("/{boardNo}")
    public ResponseEntity<?> findOne (@PathVariable Long boardNo) {
//        log.info("/board/detail : GET");
        log.info("boardNo - {}", boardNo);
        BoardDetailResponseDTO dto = boardService.boardFindOne(boardNo);

        log.info("dto- {}", dto);
        return ok().body(dto);
    }
}
