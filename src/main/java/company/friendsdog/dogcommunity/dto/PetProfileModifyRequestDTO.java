package company.friendsdog.dogcommunity.dto;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
// 필요한 값 dto로만들고
// 밑에 설정 네개 필수

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@Builder
@AllArgsConstructor
//받는 DTO
public class PetProfileModifyRequestDTO {
   // 종 ,나이
   private MultipartFile petPhoto;
   //multioartfile
   private String petKind;


   private String hashtag;




//   public MultipartFile getPetPhoto() {
//      return petPhoto;
//   }
//
//   public String getPetPhotoAsString() throws IOException {
//      if (petPhoto != null) {
//         return new String(petPhoto.getBytes());
//      }
//      return null;
//   }
}