package company.friendsdog.dogcommunity;

import company.friendsdog.dogcommunity.entity.Pet;
import company.friendsdog.dogcommunity.repository.PetMapper;
import company.friendsdog.dogcommunity.util.LoginUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
@Controller
@RequiredArgsConstructor
public class HomeController {

  private final PetMapper petMapper;
  @GetMapping("/")
  public String home(HttpSession session) {

    return "login/login";
  }

  @GetMapping("/main")
  public String Main() {
    return "redirect:/board/main";
  }

}
