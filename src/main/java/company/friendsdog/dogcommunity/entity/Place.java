package company.friendsdog.dogcommunity.entity;

import lombok.*;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Place {
  String place;
  String addr;
  Double lng;
  Double lat;
  String img;
  String keyword;
  String url;
}


