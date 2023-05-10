package company.friendsdog.dogcommunity.service;

import company.friendsdog.dogcommunity.dto.request.PetBoardRequestDTO;
import company.friendsdog.dogcommunity.entity.Board;
import company.friendsdog.dogcommunity.repository.PetBoardMapper;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class PetBoardService {

    private final PetBoardMapper petBoardMapper;

    // 글 등록 중간처리
//    public boolean register(PetBoardRequestDTO dto) {
//      return petBoardMapper.save(new Board(dto));
//    }







}
