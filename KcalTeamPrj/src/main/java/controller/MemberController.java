package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import service.MemberService;
import vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@GetMapping("/goLogin")
	public String goLogin() {
		
		return "login";
	}
	
	@PostMapping("/login")
	public String login(MemberVO vo, HttpSession session) {
		return memberService.isLogin(vo, session);
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "index";
	}
	
	
	
	@GetMapping("/mypage")
	public String mypage(Model model, @RequestParam(defaultValue = "memberInfo") String currTab) {
		model.addAttribute("currTab", currTab);
		return "mypage";
	}
	
	
	
	
	@ResponseBody 
	@PostMapping("/checkEmail")
	public String checkEmail(String email, String id) {
		MemberVO vo = new MemberVO();
		vo.setEmail(email);
		vo.setIsdelete("N");
		
		return memberService.checkEmail(vo, id);
	}
	
	@ResponseBody
	@PostMapping("/updateMember")
	public MemberVO updateMember(@RequestBody MemberVO vo, HttpSession session) {
		return memberService.updateMember(vo, session);
	}
	
	@GetMapping("/deleteMember")
	public String deleteMember(MemberVO vo, HttpSession session) {
		MemberVO mvo = (MemberVO)session.getAttribute("account");
		vo.setUnum(mvo.getUnum());
		vo.setIsdelete("Y");
		
		memberService.deleteMember(vo, session);
		return "index";
	}
}
