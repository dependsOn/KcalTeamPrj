package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/community")
public class CommunityController {
	
	@GetMapping("/main")
	public String goCommunity() {
		
		return "community";
	}
	
	@GetMapping("/bbs")
	public String communityBBS(Model model, String category) {
		model.addAttribute("category", category);
		return "community_bbs";
	}
}
