package company.friendsdog.dogcommunity.service;

import company.friendsdog.dogcommunity.dto.page.Search;
import company.friendsdog.dogcommunity.dto.request.BoardRequestDTO;
import company.friendsdog.dogcommunity.dto.response.BoardDetailResponseDTO;
import company.friendsdog.dogcommunity.dto.response.BoardListResponseDTO;
import company.friendsdog.dogcommunity.entity.Board;
import company.friendsdog.dogcommunity.entity.User;
import company.friendsdog.dogcommunity.repository.BoardMapper;
import company.friendsdog.dogcommunity.repository.PetMapper;
import company.friendsdog.dogcommunity.util.LoginUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.stream.Collectors;

import static java.util.stream.Collectors.*;

@Service
@RequiredArgsConstructor
@Slf4j
public class BoardService {

    private final BoardMapper petBoardMapper;
    private final PetMapper petMapper;

    // 게시판 목록 중간처리
    public List<BoardListResponseDTO> petFindAll(Search page) {

        return petBoardMapper.petFindAll(page)
                .stream()
                .map(board -> new BoardListResponseDTO(board))
                .collect(toList());

    }

//     게시판 업로드 중간처리
    public boolean save(BoardRequestDTO dto, HttpSession session) {

        Board board = new Board(dto);
//        Long userNoInfo = LoginUtil.getCurrentLoginUserNo(session).getUserNo();
//        Long petNoInfo = petMapper.userFindPet(userNoInfo).getPetNo();
//        board.setPetNo(petNoInfo);
        return petBoardMapper.save(board);
    }

    // 게시판 삭제 처리
    public boolean delete(Long petNo) {
        return petBoardMapper.delete(petNo);
    }


    // 게시판 확인
    public BoardDetailResponseDTO petFindOne(Long petNo) {
        Board board = petBoardMapper.petFindOne(petNo);
        petBoardMapper.upHitsCount(petNo);
        return new BoardDetailResponseDTO(board);
    }

    // 게시판 수정
    public boolean modify(BoardRequestDTO dto) {
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
