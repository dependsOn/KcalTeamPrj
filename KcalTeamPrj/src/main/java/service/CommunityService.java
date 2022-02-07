package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import vo.BBSVO;
import vo.MemberVO;

@Service
public class CommunityService {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public String isLogin(MemberVO vo, HttpSession session, HttpServletRequest request) {
		String referer = request.getHeader("Referer");
		MemberVO vo1 = sqlSessionTemplate.selectOne("member.selectMemberOne", vo);
		if((vo1 == null) || (vo1.getIsdelete().equals("Y"))) {
			return "redirect:/community/main";
		}else {
			session.setAttribute("account", vo1);
			return "redirect:" + referer;
		}
	}

	public void getRecentBBSList(Model model) {
		BBSVO vo = new BBSVO();
		vo.setCount(5);
		
		vo.setCategory("free");
		model.addAttribute("free", sqlSessionTemplate.selectList("bbs.selectBBSList", vo));
		vo.setCategory("question");
		model.addAttribute("question", sqlSessionTemplate.selectList("bbs.selectBBSList", vo));
		vo.setCategory("tip");
		model.addAttribute("tip", sqlSessionTemplate.selectList("bbs.selectBBSList", vo));
		vo.setCategory("review");
		model.addAttribute("review", sqlSessionTemplate.selectList("bbs.selectBBSList", vo));
		
	}
	
	
}
