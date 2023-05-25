package company.friendsdog.dogcommunity.dto.page;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class Search extends Page {

    // 검색 타입, 검색 키워드
    private String type;
    private String keyword;

    public Search() {
        this.type = "";
        this.keyword = "";
    }
}