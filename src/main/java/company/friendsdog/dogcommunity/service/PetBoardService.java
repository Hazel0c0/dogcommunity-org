package company.friendsdog.dogcommunity.service;

import company.friendsdog.dogcommunity.dto.page.Search;
import company.friendsdog.dogcommunity.dto.request.PetBoardRequestDTO;
import company.friendsdog.dogcommunity.dto.response.PetBoardDetailResponseDTO;
import company.friendsdog.dogcommunity.dto.response.PetBoardListResponseDTO;
import company.friendsdog.dogcommunity.entity.Board;
import company.friendsdog.dogcommunity.repository.PetBoardMapper;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Slf4j
public class PetBoardService {

    private final PetBoardMapper petBoardMapper;

    // 게시판 목록 중간처리
    public List<PetBoardListResponseDTO> petFindAll(Search page) {

        return petBoardMapper.petFindAll(page)
                .stream()
                .map(board -> new PetBoardListResponseDTO(board))
                .collect(Collectors.toList());

    }

//     게시판 업로드 중간처리
    public boolean save(PetBoardRequestDTO dto) {
      return petBoardMapper.save(new Board(dto));
    }

    // 게시판 삭제 처리
    public boolean delete(int petNo) {
        return petBoardMapper.delete(petNo);
    }


    // 게시판 확인
    public PetBoardDetailResponseDTO petFindOne(int petNo) {
        Board board = petBoardMapper.petFindOne(petNo);
        petBoardMapper.upHitsCount(petNo);
        return new PetBoardDetailResponseDTO(board);
    }

    // 게시판 수정
    public boolean modify(PetBoardRequestDTO dto) {
        log.info("dto : {}", dto);
        Board board = new Board(dto);
        log.info("board : {}", board);
        return petBoardMapper.modify(board);
    }

    // 게시물 수
    public int count(Search search) {
        return petBoardMapper.count(search);
    }
    







}
