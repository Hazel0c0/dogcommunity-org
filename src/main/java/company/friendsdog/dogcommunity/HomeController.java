package company.friendsdog.dogcommunity;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class HomeController {

//  @GetMapping("/")
//  public String home() {
//    return "index";
//  }

  @GetMapping("/")
  public String home(HttpServletRequest request) {
    if (request.getSession()!=null){
      return "main/main";
    }
    return "login/login";
  }
}
