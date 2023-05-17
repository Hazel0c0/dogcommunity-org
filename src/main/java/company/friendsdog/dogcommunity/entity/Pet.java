package company.friendsdog.dogcommunity.entity;

import lombok.*;

import java.time.LocalDateTime;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder

/*
(
    user_no INT,
    pet_no        INT AUTO_INCREMENT PRIMARY KEY, -- 반려동물 번호
    pet_name      VARCHAR(10)          NOT NULL,
    pet_age       INT,
    pet_kind      VARCHAR(20)          NOT NULL,
    pet_gender    VARCHAR(100)         NOT NULL,
    pet_photo     VARCHAR(2000) , -- 테스트용으로 NOT NULL 조건 없앰 //UNIQUE NOT NULL
    profile_date_time TIMESTAMP            NOT NULL DEFAULT CURRENT_TIMESTAMP,
    hashtag       VARCHAR(1000),
    addr VARCHAR(10),
    add_detail VARCHAR(10)
--   FOREIGN KEY (user_no)
--   REFERENCES tbl_user(user_no)
);
 */
public class Pet {
    private Long userNo;
    private Long petNo;
    private String petName;
    private long petAge;
    private String petKind;
    private Gender petGender;
    private String petPhoto;
    private LocalDateTime profileDateTime;
    private String hashtag;

    private String addr;
    private String addDetail;
}
