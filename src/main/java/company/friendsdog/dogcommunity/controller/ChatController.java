package company.friendsdog.dogcommunity.controller;

import company.friendsdog.dogcommunity.dto.page.PageMaker;
import company.friendsdog.dogcommunity.dto.page.Search;
import company.friendsdog.dogcommunity.dto.response.BoardListResponseDTO;
import company.friendsdog.dogcommunity.entity.Chat;
import company.friendsdog.dogcommunity.entity.Reply;
import company.friendsdog.dogcommunity.service.ChatService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/board")
@Slf4j
public class ChatController {

    private final ChatService chatService;

    @GetMapping("/message")
    public String chatAll(Model model) {
        log.info("/board/message : GET");
        List<Chat> chat = chatService.chatAll();;

        model.addAttribute("cList", chat);

        return "/board/message";
    }

}
