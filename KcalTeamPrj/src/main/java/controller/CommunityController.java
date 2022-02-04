package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import service.CommunityService;
import vo.MemberVO;

@Controller
@RequestMapping("/community")
public class CommunityController {
	
	@Autowired
	CommunityService communityService;
	
	@GetMapping("/main")
	public String goCommunity() {
		
		return "community";
	}
	
	@GetMapping("/bbs")
	public String headerTest() {
		
		return "community_bbs";
	}
	
	@PostMapping("/login")
	public String login(MemberVO vo, HttpSession session) {
		
		return communityService.isLogin(vo, session);
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "community";
	}
}
