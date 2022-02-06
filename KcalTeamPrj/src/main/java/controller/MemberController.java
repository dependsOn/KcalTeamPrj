package controller;

import javax.servlet.http.HttpServletRequest;
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
	
	// 로그인
	@GetMapping("/goLogin")
	public String goLogin(HttpSession session, HttpServletRequest request) {
		String uri = request.getHeader("Referer");
		if(!uri.contains("/goLogin")) {
			session.setAttribute("prevPage", request.getHeader("Referer"));
		}
		return "login";
	}
	
	@GetMapping("/createMember")
	public String creatMember() {
		
		return "signUp";
	}
	
	@PostMapping("/signUp")
	public String signUp(MemberVO vo) {
		memberService.joinMember(vo);
		return "login";
	}
	
	@PostMapping("/login")
	public String login(MemberVO vo, HttpSession session) {
		return memberService.isLogin(vo, session);
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session, HttpServletRequest request) {
		String referer = request.getHeader("Referer");
		session.invalidate();
		return "redirect:" + referer;
	}
	
	// 마이페이지
	@GetMapping("/mypage")
	public String mypage(Model model, @RequestParam(defaultValue = "memberInfo") String currTab) {
		model.addAttribute("currTab", currTab);
		return "mypage";
	}
	
	@ResponseBody 
	@PostMapping("/checkId")
	public String checkId(String id) {
		MemberVO vo = new MemberVO();
		vo.setId(id);
		
		return memberService.checkId(vo);
	}
	
	@ResponseBody 
	@PostMapping("/checkNickname")
	public String checkNickname(String nickname) {
		
		return memberService.checkNickname(nickname);
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
