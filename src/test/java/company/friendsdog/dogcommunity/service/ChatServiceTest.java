package company.friendsdog.dogcommunity.service;

import company.friendsdog.dogcommunity.dto.request.ChatPostResponseDTO;
import company.friendsdog.dogcommunity.entity.Chat;
import company.friendsdog.dogcommunity.repository.ChatMapper;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
class ChatServiceTest {



        @Autowired
        ChatService chatService;

//        @Test
//        @DisplayName("save 테스트")
//        void save() {
//            String message = "테스트";
//                ChatPostResponseDTO chat = ChatPostResponseDTO.builder()
//                    .message(message)
//                    .build();
//            System.out.println("chat = " + chat);
//
//            chatService.save(chat);
//        }
    
}