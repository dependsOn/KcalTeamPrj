package service;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vo.MemberVO;

@Service
public class MemberService {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public String isLogin(MemberVO vo, HttpSession session) {
		MemberVO vo1 = sqlSessionTemplate.selectOne("member.selectMemberOne", vo);
		if((vo1 == null) || (vo1.getIsdelete().equals("Y"))) {
			return "login";
		}else {
			session.setAttribute("account", vo1);
			return "index";
		}
	}
	
	public void joinMember(MemberVO vo) {
		sqlSessionTemplate.insert("member.insertMember", vo);
	}
	

	public MemberVO updateMember(MemberVO vo, HttpSession session) {
		sqlSessionTemplate.update("member.updateMember", vo);
		
		MemberVO vo1 = sqlSessionTemplate.selectOne("member.selectMemberList", vo);
		session.setAttribute("account", vo1);
		return vo1;
	}
	
	public void deleteMember(MemberVO vo, HttpSession session) {
		sqlSessionTemplate.update("member.updateMember", vo);
		session.invalidate();
	}

	
	public String checkEmail(MemberVO vo, String id) {
		MemberVO vo1 = sqlSessionTemplate.selectOne("member.selectMemberList", vo);
		String check = "possible";
		
		if((vo1 != null) && (vo1.getId().equals(id))) {			
			check = "possible";
		}else if((vo1 != null) && (!vo1.getId().equals(id))) {
			check = "impossible";
		}else if(vo1 == null) {
			check = "possible";
		}
		
		return check;
	}

}
