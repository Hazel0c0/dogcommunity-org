package api;

import company.friendsdog.dogcommunity.dto.request.ReplyModifyRequestDTO;
import company.friendsdog.dogcommunity.dto.request.ReplyPostRequestDTO;
import company.friendsdog.dogcommunity.dto.response.ReplyListResponseDTO;
import company.friendsdog.dogcommunity.service.ReplyService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import static org.springframework.http.ResponseEntity.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/replies")
@Slf4j
// 클라이언트의 접근을 어떤 app에서만 허용할것인가
//@CrossOrigin(origins = {"http://127.0.0.1:5500"})
// 댓글 목록 조회 요청
// URL : /api/v1/replies/3/page/1
//          3번 게시물 댓글목록 1페이지 내놔
public class ReplyController {

    private final ReplyService replyService;

    @GetMapping("/{boardNo}")
    public ResponseEntity<?> list(
            @PathVariable long boardNo,
            @PathVariable long petNo
    ) {
        log.info("/api/v1/replies/{}/{} : GET!!", boardNo, petNo);

        ReplyListResponseDTO replyList = replyService.getList(boardNo, petNo);

        return ok().body(replyList);
    }

    //댓글 등록 요청
    @PostMapping
    public ResponseEntity<?> create(

            @Validated @RequestBody ReplyPostRequestDTO dto,
            BindingResult result
    ) {
        // 입력값 검증에 걸리면 4xx 상태코드 리턴
        if (result.hasErrors()) {
            return ResponseEntity
                    .badRequest()
                    .body(result.toString());
        }

        log.info("/api/v1/replies : POST! ");
        log.info("param: {} ", dto);

        // 서비스에 비즈니스 로직 처리 위임
        try {
            ReplyListResponseDTO responseDTO = replyService.register(dto);
            // 성공시 클라이언트에 응답하기
            return ResponseEntity.ok().body(responseDTO);
        } catch (Exception e) {
            // 문제발생 상황을 클라이언트에게 전달
            log.warn("500 Status code response!! caused by: {}", e.getMessage());
            return ResponseEntity
                    .internalServerError()
                    .body(e.getMessage());
        }

    }

    // 댓글 삭제 요청
    @DeleteMapping("/{replyNo}")
    public ResponseEntity<?> remove(
            @PathVariable(required = false) Long replyNo

    ) {
        if (replyNo == null) {
            return ResponseEntity
                    .badRequest()
                    .body("댓글 번호를 보내주세요!");
        }

        //페이지들어간거
        log.info("/api/v1/replies/{} DELETE!", replyNo);

        try {
            ReplyListResponseDTO responseDTO
                    = replyService.remove(replyNo);
            return ResponseEntity
                    .ok()
                    .body(responseDTO);
        } catch (Exception e) {
            return ResponseEntity
                    .internalServerError()
                    .body(e.getMessage());
        }


    }

    //댓글 수정 요청
@RequestMapping
        (method ={RequestMethod.PUT,RequestMethod.PATCH})
public ResponseEntity<?> modify(
        @Validated @RequestBody ReplyModifyRequestDTO dto
        , BindingResult result
) {

    if (result.hasErrors()) {
        return ResponseEntity
                .badRequest()
                .body(result.toString());
    }

    log.info("/api/v1/replies PUT!");
    try {
        ReplyListResponseDTO responseDTO = replyService.modify(dto);
        return ResponseEntity.ok().body(responseDTO);
    } catch (Exception e) {
        log.warn("500 status code! caused by: {}", e.getMessage());
        return ResponseEntity.internalServerError().body(e.getMessage());
    }
}
}