package company.friendsdog.dogcommunity.dto;

import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

import java.time.LocalDateTime;

@Builder
@Getter @ToString
@EqualsAndHashCode
public class AutoLoginDTO {
  private String sessionId;
  private LocalDateTime cookieLimitTime;
  private String id;
}
