
package company.friendsdog.dogcommunity.service;

import company.friendsdog.dogcommunity.dto.PetProfileModifyRequestDTO;
import company.friendsdog.dogcommunity.dto.response.PetCardResponseDTO;
import company.friendsdog.dogcommunity.entity.Pet;
import company.friendsdog.dogcommunity.repository.PetMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

import static java.util.stream.Collectors.toList;

@Service
@RequiredArgsConstructor
public class PetService {
  private final PetMapper petMapper;

  // 검색 목록 중간 처리
  public List<PetCardResponseDTO> findAll(){
    // pet 객체 -> PetProfileCardDTO
    return petMapper.findAll()
    .stream()
    .map(pet -> new PetCardResponseDTO(pet))
    .collect(toList());
  }

  public boolean delete(Long petNo) {
    return petMapper.delete(petNo);
  }

  // 조회
  //DTO 필요없지 않나 다 조회 하닌깐
  // 보여야 할 정 보가 있으면 DTO 만들어서 SET / GET
  public Pet getDetail(Long petNo){

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

