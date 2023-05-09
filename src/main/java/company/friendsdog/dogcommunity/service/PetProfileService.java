package company.friendsdog.dogcommunity.service;

import company.friendsdog.dogcommunity.dto.response.PetProfileCardDTO;
import company.friendsdog.dogcommunity.repository.PetProfileMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class PetProfileService {
  private final PetProfileMapper petProfileMapper;

  // 검색 목록 중간 처리
  public List<PetProfileCardDTO> findPetProfile(){
//    petProfileMapper.findPetProfile()
    return null;
  }
}
