package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vo.MemberVO;

@Service
public class CommunityService {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public String isLogin(MemberVO vo, HttpSession session, HttpServletRequest request) {
		String referer = request.getHeader("Referer");
		MemberVO vo1 = sqlSessionTemplate.selectOne("member.selectMemberOne", vo);
		if((vo1 == null) || (vo1.getIsdelete().equals("Y"))) {
			return "redirect:/community";
		}else {
			session.setAttribute("account", vo1);
			return "redirect:" + referer;
		}
	}
}
