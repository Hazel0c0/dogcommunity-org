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
  Keyword keyword;
  String url;
}


