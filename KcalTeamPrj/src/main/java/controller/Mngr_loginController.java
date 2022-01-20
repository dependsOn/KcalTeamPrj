import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mngr_login")
public class Mngr_loginController {
	
	@GetMapping("/mngr_login")
	public String goLogin() {
		
		return "-----";
	}
}
