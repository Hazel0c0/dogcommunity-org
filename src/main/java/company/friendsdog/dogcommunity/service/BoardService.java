package company.friendsdog.dogcommunity.service;

import company.friendsdog.dogcommunity.dto.page.Search;
import company.friendsdog.dogcommunity.dto.request.BoardRequestDTO;
import company.friendsdog.dogcommunity.dto.response.BoardDetailResponseDTO;
import company.friendsdog.dogcommunity.dto.response.BoardListResponseDTO;
import company.friendsdog.dogcommunity.entity.Board;
import company.friendsdog.dogcommunity.entity.Pet;
import company.friendsdog.dogcommunity.repository.BoardMapper;
import company.friendsdog.dogcommunity.repository.PetMapper;
import company.friendsdog.dogcommunity.util.LoginUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;

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
    public boolean save(BoardRequestDTO dto, HttpSession session, String imgPath) {

        Board board = new Board(dto);

//        log.info(imgPath);
        board.setAttachedImg(imgPath);
        Long userNoInfo = LoginUtil.getCurrentLoginUser(session).getUserNo();
//        log.info("userNoInfo - {}",userNoInfo);


        Long petNoInfo = petMapper.userFindPet(userNoInfo).getPetNo();
//        log.info("petNoInfo - {}", petNoInfo);
        String petNameInfo = petMapper.userFindPet(userNoInfo).getPetName();
//        log.info("petNameInfo - {}", petNameInfo);
        String petPhotoInfo = petMapper.userFindPet(userNoInfo).getPetPhoto();
//        log.info("petPhotoInfo - {}", petPhotoInfo);
        board.setPetNo(petNoInfo);
        board.setPetName(petNameInfo);
        board.setPetPhoto(petPhotoInfo);

        log.info("board의 값 : - {}", board);
        return petBoardMapper.save(board);
    }

    // 게시판 삭제 처리
    public boolean delete(Long boardNo, HttpSession session) {
        Long userNoInfo = LoginUtil.getCurrentLoginUser(session).getUserNo();
        Pet pet = petMapper.userFindPet(userNoInfo);
        Long petNoInfo = pet.getPetNo();

        return petBoardMapper.delete(boardNo);
    }


    // 게시판 확인
    public BoardDetailResponseDTO petFindOne(Long boardNo) {
        Board board = petBoardMapper.petFindOne(boardNo);
        petBoardMapper.upHitsCount(boardNo);
        return new BoardDetailResponseDTO(board);
    }

    // 게시판 수정
    public boolean modify(BoardRequestDTO dto) {
//        log.info("dto : {}", dto);
        Board board = new Board(dto);
//        log.info("board : {}", board);
        return petBoardMapper.modify(board);
    }

    // 게시물 수
    public int count(Search search) {
        return petBoardMapper.count(search);
    }


    public Pet petFindInfo(HttpSession session) {
        Pet pet = new Pet();

        Long userNoInfo = LoginUtil.getCurrentLoginUser(session).getUserNo();
        log.info("userNoInfo - {}",userNoInfo);
        Long petNoInfo = petMapper.userFindPet(userNoInfo).getPetNo();
//        log.info("petNoInfo - {}", petNoInfo);
        String petNameInfo = petMapper.userFindPet(userNoInfo).getPetName();
//        log.info("petNameInfo - {}", petNameInfo);
        String petPhotoInfo = petMapper.userFindPet(userNoInfo).getPetPhoto();
//        log.info("petPhotoInfo - {}", petPhotoInfo);
        pet.setPetNo(petNoInfo);
        pet.setPetName(petNameInfo);
        pet.setPetPhoto(petPhotoInfo);
        pet.setUserNo(userNoInfo);
        return petMapper.petFindInfo(pet);
    }
}
