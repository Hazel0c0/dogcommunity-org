package company.friendsdog.dogcommunity.dto.request;

import lombok.*;

@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@Setter
public class MapRequestDTO {
  String addr;
  Double lng;
  Double lat;
}
