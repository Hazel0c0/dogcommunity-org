package company.friendsdog.dogcommunity.service;

import company.friendsdog.dogcommunity.dto.PetProfileModifyRequestDTO;
import company.friendsdog.dogcommunity.entity.Pet;
import company.friendsdog.dogcommunity.repository.PetProfileMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class PetProfileService {
  private final PetProfileMapper petProfileMapper = null;

  // 조회
  //DTO 필요없지 않나 다 조회 하닌깐
  // 보여야 할 정 보가 있으면 DTO 만들어서 SET / GET
  public Pet getDetail(Long petNo){

    Pet pet = petProfileMapper.findOne(petNo);

    return pet;
    //조회수 상승 처리? 해야하나


  }




  //수정 요청 하면  컨트롤러가 다시 수정을 요청한다. 수정창
  public boolean modify(PetProfileModifyRequestDTO dto) {
    Pet pet = new Pet();
    pet.setPetNo((long) dto.getPetNo());
    pet.setPetPhoto(dto.getPetPhoto());
    return petProfileMapper.modify(pet);
  }



  // 검색 목록 중간 처리
//  public List<BoardListResponseDTO> findPetProfile(){
//
//  }
}
