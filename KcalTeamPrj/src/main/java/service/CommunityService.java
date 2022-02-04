package service;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vo.MemberVO;

@Service
public class CommunityService {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public String isLogin(MemberVO vo, HttpSession session) {
		MemberVO vo1 = sqlSessionTemplate.selectOne("member.selectMemberOne", vo);
		if((vo1 == null) || (vo1.getIsdelete().equals("Y"))) {
			return "community";
		}else {
			session.setAttribute("account", vo1);
			return "community";
		}
	}
}
