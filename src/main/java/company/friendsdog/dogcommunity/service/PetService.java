
package company.friendsdog.dogcommunity.service;

import company.friendsdog.dogcommunity.dto.response.PetCardResponseDTO;
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

  public boolean deletePetProfile(int petNo) {
    return petMapper.deletePetProfile(petNo);
  }

}

