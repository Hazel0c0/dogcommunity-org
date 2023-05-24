package company.friendsdog.dogcommunity;

import company.friendsdog.dogcommunity.util.LoginUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class HomeController {
  @GetMapping("/")
  public String home(HttpSession session) {
    if (LoginUtil.isLogin(session)){
      return "main";
    }
    return "login/login";
  }

  @GetMapping("/main")
  public String Main() {
    return "main";
  }

}
