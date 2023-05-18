package company.friendsdog.dogcommunity;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class HomeController {
  @GetMapping("/")
  public String home(HttpServletRequest request) {
    if (request.getSession()!=null){
      return "main";
    }
    return "login/login";
  }

  @GetMapping("/main")
  public String Main() {
    return "main";
  }
}
