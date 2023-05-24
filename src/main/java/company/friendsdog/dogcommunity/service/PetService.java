
package company.friendsdog.dogcommunity.service;

import company.friendsdog.dogcommunity.dto.PetProfileModifyRequestDTO;
import company.friendsdog.dogcommunity.dto.request.PetProfileRequestDTO;
import company.friendsdog.dogcommunity.dto.response.PetCardResponseDTO;
import company.friendsdog.dogcommunity.entity.Pet;
import company.friendsdog.dogcommunity.entity.User;
import company.friendsdog.dogcommunity.repository.PetMapper;
import company.friendsdog.dogcommunity.util.LoginUtil;
import company.friendsdog.dogcommunity.util.upload.FileUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class PetService {
  private final PetMapper petMapper;


  // 펫 카드 저장하기
  public boolean petCardMake(final PetProfileRequestDTO dto
      , final HttpSession session, final String savePath) {
    User sUser = LoginUtil.getCurrentLoginUser(session);
    Pet newPet=Pet.builder()
        .userNo(sUser.getUserNo())
        .petName(dto.getPetName())
        .petAge(dto.getPetAge())
        .petKind(dto.getPetKind())
        .petGender(dto.getPetGender())
        .petPhoto(savePath)
        .hashtag(dto.getHashtag())
        .addr(sUser.getAddr())
        .addDetail(sUser.getAddDetail())
        .build();

    return petMapper.save(newPet);

  }

  // ㅇㅇ동에 있는 모든 강아지 찾기
  public List<Pet> findNeighbor(String addr){
    log.info("선택한 동네 : {}",addr);
    List<Pet> petByAddr = petMapper.findPetByAddr(addr);
    return petByAddr;
  }
  // ㅇㅇ동 강아지 수
  public int petCount(String addr){
    return petMapper.petCount(addr);
  }






  public boolean delete(Long petNo) {
    return petMapper.delete(petNo);
  }

  // 조회
  //DTO 필요없지 않나 다 조회 하닌깐
  // 보여야 할 정 보가 있으면 DTO 만들어서 SET / GET
  public Pet getDetail(Long petNo) {

    Pet pet = petMapper.findOne(petNo);

    return pet;
    //조회수 상승 처리? 해야하나


  }


  //수정 요청 하면  컨트롤러가 다시 수정을 요청한다. 수정창
  //업로드 받은 파일 DB 에 담을 수 없다...
  public boolean modify(PetProfileModifyRequestDTO dto, Long petNo, String rootPath) {
    log.info("선택한 동네 : {}",dto);
    log.info("선택한 동네 : {}",petNo);
    // 유저 넘버로 펫 찾기
  // 하나 하나 로그 찍어보기
    Pet pet = new Pet();


    // 파일 저장 하고 그 경로를 리턴
    String imgPath = FileUtil.uploadFile(dto.getPetPhoto(),rootPath);
    log.info("선택한 동네 : {}",dto);
    String local = "/local";
    log.info("선택한 동네 : {}",dto);
    String fullLocal = local + imgPath;
    log.info("선택한 동네 : {}",dto);

    pet.setPetNo(petNo);
    pet.setHashtag(dto.getHashtag());
    pet.setPetPhoto(fullLocal);
//    pet.setPetPhoto(dto.getPetPhoto());
    pet.setPetKind(dto.getPetKind());
//    pet.setPetPhoto(String.valueOf(dto.getPetPhoto()));
    return petMapper.modify(pet);
  }


  public Pet findOne(Long  petNo) {
//    log.info("userNo : {}", userNo);
    Pet foundPet = petMapper.findOne(petNo);
    log.info(" petNo {}", petNo);
    return foundPet;
  }
}

