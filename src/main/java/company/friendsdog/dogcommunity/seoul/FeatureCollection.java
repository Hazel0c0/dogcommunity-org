package company.friendsdog.dogcommunity.seoul;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@Getter @Setter @ToString @EqualsAndHashCode
public class FeatureCollection {
  private String type;
  private List<Feature> features;
}

@Getter @Setter @ToString @EqualsAndHashCode
class Feature {
  private String type;
  private Geometry geometry;
  private Properties properties;

}

@Getter @Setter @ToString @EqualsAndHashCode
class Geometry {
  private String type;
  private List<List<List<Double>>> coordinates;

}

@Getter @Setter @ToString @EqualsAndHashCode
class Properties {
  private String SIG_CD;
  private String SIG_ENG_NM;
  private String SIG_KOR_NM;
  private int orig_ogc_fid;

  // Getters and setters (or Lombok annotations) for the fields
}
