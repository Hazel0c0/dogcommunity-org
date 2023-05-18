
package company.friendsdog.dogcommunity.service;

import company.friendsdog.dogcommunity.dto.PetProfileModifyRequestDTO;
import company.friendsdog.dogcommunity.dto.request.PetProfileRequestDTO;
import company.friendsdog.dogcommunity.entity.Pet;
import company.friendsdog.dogcommunity.entity.User;
import company.friendsdog.dogcommunity.repository.PetMapper;
import company.friendsdog.dogcommunity.util.LoginUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

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

  // 유저 있는 동 찾기
  public List<String> findAddrDetail(HttpSession session) {
    log.info("session : {}",session);
    String addr = LoginUtil.getCurrentLoginUser(session).getAddr();
    // '구'로 '동'찾기
    List<String> dongList = petMapper.findDong(addr);

    return dongList;
  }

  // ㅇㅇ동에 있는 모든 강아지 찾기
  public List<Pet> findNeighbor(String addDetail){
    log.info("선택한 동네 : {}",addDetail);
    List<Pet> petByAddr = petMapper.findPetByAddr(addDetail);
    return petByAddr;
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
  public boolean modify(PetProfileModifyRequestDTO dto) {
    Pet pet = new Pet();
    pet.setPetNo((long) dto.getPetNo());
    pet.setPetPhoto(dto.getPetPhoto());
    return petMapper.modify(pet);
  }



}

