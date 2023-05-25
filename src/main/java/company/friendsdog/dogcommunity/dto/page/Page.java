package company.friendsdog.dogcommunity.dto.page;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@AllArgsConstructor
@ToString
public class Page {

  private int pageNo;
  private int amount;

  public Page() {
    this.pageNo = 1;
    this.amount = 4;
  }

  public void setPageNo(int pageNo) {
    if (pageNo < 1 || pageNo > Integer.MAX_VALUE) {
      this.pageNo = 1;
      return;
    }
    this.pageNo = pageNo;
  }

  public void setAmount(int amount) {
    this.amount = 4;
  }

  public int getPageStart() {

    return (pageNo - 1) * amount;
  }
}
