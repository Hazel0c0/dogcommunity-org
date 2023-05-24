package company.friendsdog.dogcommunity.service;

import company.friendsdog.dogcommunity.dto.page.Search;
import company.friendsdog.dogcommunity.dto.request.ChatPostResponseDTO;
import company.friendsdog.dogcommunity.dto.response.BoardListResponseDTO;
import company.friendsdog.dogcommunity.entity.Chat;
import company.friendsdog.dogcommunity.entity.Reply;
import company.friendsdog.dogcommunity.repository.ChatMapper;
import company.friendsdog.dogcommunity.repository.PetMapper;
import company.friendsdog.dogcommunity.util.LoginUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;

import static java.util.stream.Collectors.toList;

@Service
@Slf4j
@RequiredArgsConstructor
public class ChatService {

    private final ChatMapper chatMapper;
    private final PetMapper petMapper;


    public List<Chat> chatAll() {

        return chatMapper.chatAll()
                .stream()
                .map(board -> new Chat())
                .collect(toList());
    }

    public boolean save(ChatPostResponseDTO dto, HttpSession session) {
        log.info("dto - {}", dto);
        Chat chat = new Chat();
        Long userNo = LoginUtil.getCurrentLoginUser(session).getUserNo();
        log.info("userNo - {}", userNo);
        Long userNoInfo = LoginUtil.getCurrentLoginUser(session).getUserNo();
        log.info("Service - userNoInfo - {}", userNoInfo);
        String petName = petMapper.userFindPet(userNoInfo).getPetName();
        chat.setPetName(petName);
        Long petNo = petMapper.userFindPet(userNoInfo).getPetNo();
        chat.setPetNo(petNo);
        String petPhoto = petMapper.userFindPet(userNoInfo).getPetPhoto();
        chat.setPetPhoto(petPhoto);
        chat.setMessage(dto.getMessage());

        boolean save = chatMapper.save(chat);
        log.info("Service save - {}", save);
        return save;
    }
}
