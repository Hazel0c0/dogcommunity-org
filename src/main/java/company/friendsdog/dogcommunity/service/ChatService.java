package company.friendsdog.dogcommunity.service;

import company.friendsdog.dogcommunity.dto.request.ChatPostResponseDTO;
import company.friendsdog.dogcommunity.entity.Chat;
import company.friendsdog.dogcommunity.repository.ChatMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@Slf4j
@RequiredArgsConstructor
public class ChatService {

    ChatMapper chatMapper;

    public boolean save(ChatPostResponseDTO dto) {
        log.info("dto - {}", dto);
        Chat chat = new Chat();
        chat.setMessage(dto.getMessage());

        boolean save = chatMapper.save(chat);
        log.info("Service save - {}", save);
        return save;
    }
}
