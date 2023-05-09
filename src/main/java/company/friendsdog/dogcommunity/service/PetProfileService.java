package company.friendsdog.dogcommunity.service;

import company.friendsdog.dogcommunity.dto.response.PetProfileCardDTO;
import company.friendsdog.dogcommunity.repository.PetProfileMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import java.util.List;

import static java.util.stream.Collectors.toList;

@Service
@RequiredArgsConstructor
public class PetProfileService {
    private final PetProfileMapper petProfileMapper;

    // 검색 목록 중간 처리
    public List<PetProfileCardDTO> findPetProfile(){
        // pet 객체 -> PetProfileCardDTO
        return petProfileMapper.findPetProfile()
                .stream()
                .map(pet -> new PetProfileCardDTO(pet))
                .collect(toList());
    }
    // 삭제 기능 처리
    public boolean deletePetProfile(int petNo) {

        boolean deletePetProfile = petProfileMapper.deletePetProfile(petNo);


        return deletePetProfile;
    }
}

