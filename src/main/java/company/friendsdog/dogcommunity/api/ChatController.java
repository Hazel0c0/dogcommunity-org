package company.friendsdog.dogcommunity.api;

import company.friendsdog.dogcommunity.dto.request.ChatPostResponseDTO;
import company.friendsdog.dogcommunity.entity.Chat;
import company.friendsdog.dogcommunity.repository.ChatMapper;
import company.friendsdog.dogcommunity.service.ChatService;
import company.friendsdog.dogcommunity.service.ReplyService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequiredArgsConstructor
@RequestMapping("/chat")
@Slf4j
public class ChatController {
    private final ChatService chatService;

    // 메시지 등록
    @PostMapping
    public ResponseEntity<?> save(
            @Validated @RequestBody ChatPostResponseDTO dto
            , BindingResult result
            ) {
        if (result.hasErrors()) {
            return ResponseEntity.badRequest().body(result.toString());
        }

        log.info("/chat: POST!!!!!");
        log.info("dto - {}", dto);

        try {
            boolean save = chatService.save(dto);
            return ResponseEntity.ok().body(save);
        } catch (Exception e) {
            log.warn("500 Status code response!! caused by: {}", e.getMessage());
            return ResponseEntity.internalServerError().body(e.getMessage());
        }

    }


}
