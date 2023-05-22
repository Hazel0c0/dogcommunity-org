package company.friendsdog.dogcommunity.controller;

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

import javax.servlet.http.HttpSession;

import static org.springframework.http.ResponseEntity.ok;

@RestController
@RequiredArgsConstructor
@RequestMapping("/replies")
@Slf4j
public class ReplyController {

    private final ReplyService replyService;

    @GetMapping("/{boardNo}")
    public ResponseEntity<?> getList(
            @PathVariable long boardNo
    ) {
        log.info("/replies/{} : GET!!", boardNo);

        ReplyListResponseDTO replyList = replyService.getList(boardNo);



        return ok().body(replyList);
    }

    // 댓글 등록 요청
    @PostMapping
    public ResponseEntity<?> register(
            @Validated @RequestBody ReplyPostRequestDTO dto
            , BindingResult result
            , HttpSession session
    ) {
        if (result.hasErrors()) {
            return ResponseEntity
                    .badRequest()
                    .body(result.toString());
        }

        log.info("/replies : POST! ");
        log.info("param: {} ", dto);

        try {
            ReplyListResponseDTO responseDTO = replyService.register(dto, session);
            return ResponseEntity.ok().body(responseDTO);
        } catch (Exception e) {
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
        log.info("/replies/{} DELETE", replyNo);
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


    // 댓글 수정 요청
    @RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH})
    public ResponseEntity<?> modify(
            @Validated @RequestBody ReplyModifyRequestDTO dto
            , BindingResult result
    ) {

        if (result.hasErrors()) {
            return ResponseEntity
                    .badRequest()
                    .body(result.toString());
        }

        try {
            ReplyListResponseDTO responseDTO = replyService.modify(dto);
            return ResponseEntity.ok().body(responseDTO);
        } catch (Exception e) {
            log.warn("500 status code! caused by: {}", e.getMessage());
            return ResponseEntity.internalServerError().body(e.getMessage());
        }
    }


}