
package company.friendsdog.dogcommunity.service;

import company.friendsdog.dogcommunity.dto.PetProfileModifyRequestDTO;
import company.friendsdog.dogcommunity.dto.response.PetCardResponseDTO;
import company.friendsdog.dogcommunity.entity.Pet;
import company.friendsdog.dogcommunity.entity.User;
import company.friendsdog.dogcommunity.repository.PetMapper;
import company.friendsdog.dogcommunity.util.LoginUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import static java.util.stream.Collectors.toList;

@Service
@RequiredArgsConstructor
public class PetService {
  private final PetMapper petMapper;

  // 이웃 찾기
  public List<PetCardResponseDTO> findingNeighbor(
          HttpSession session) {
    // 세션(유저정보) -> 유저 addr
//    String addr = LoginUtil.getCurrentLoginUser(session).getAddr();
    String addr="강남구";
    String addrDetail="역삼동";

    // 'ㅇㅇ구' 강아지
    List<PetCardResponseDTO> addrList = petMapper.findByAddress(addr);

    return addrList;
  }
  public void bestPet(HttpSession session){
    Stream<PetCardResponseDTO> onePet = findingNeighbor(session)
        .stream().limit(1);
  }
//  public List<PetCardResponseDTO> findingNeighborDetail(){
//    // 'ㅇㅇ동' 강아지
//    List<PetCardResponseDTO> addrDetailList = addList.stream()
//        .filter(pet -> pet.getAddDetail().equals(addrDetail))
//        .collect(toList());
//
//    return addrDetailList;
//    return null;
//  }

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

