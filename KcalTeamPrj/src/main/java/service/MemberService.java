package service;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

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

	public String checkId(MemberVO vo) {
		String check = "possible";
		int cnt = sqlSessionTemplate.selectOne("member.selectMemberCount", vo);
		
		if(cnt == 0) {
			check = "possible";
		}
		else {
			check = "impossible";
		}
		
		
		return check;
	}
	
	public String checkNickname(String nickname) {
		MemberVO vo = new MemberVO();
		vo.setNickname(nickname);
		
		String check = "possible";
		int cnt = sqlSessionTemplate.selectOne("member.selectMemberCount", vo);
		
		if(cnt == 0) {
			check = "possible";
		}
		else {
			check = "impossible";
		}
		
		return check;
	}
	
	public String checkEmail(MemberVO vo, String id) {
		String check = "possible";
		
		System.out.println(id);
		if(id == "") {
			int cnt = sqlSessionTemplate.selectOne("member.selectMemberCount", vo);
			if(cnt != 0) {
				check = "impossible";
			}else {
				check = "possible";
			}
		}else {
			MemberVO vo1 = sqlSessionTemplate.selectOne("member.selectMemberList", vo);
			if((vo1 != null) && (vo1.getId().equals(id))) {			
				check = "possible";
			}else if((vo1 != null) && (!vo1.getId().equals(id))) {
				check = "impossible";
			}else if(vo1 == null) {
				check = "possible";
			}			
		}
		
				
		return check;
	}
	
//	profile
	public void selectMember(Model model, MemberVO mvo) {
//		
		//MemberVO mvo=sqlSessionTemplate.selectOne("member.selectMember",vo);
		model.addAttribute("member",sqlSessionTemplate.selectOne("member.selectMember",mvo));
	
	}
	
	public String updateProfile(MemberVO mvo) {
		
		int i=sqlSessionTemplate.update("member.updateProfile",mvo);
		String result = "";
		
		if(i>0) {
			 result = "success";
		}
		return result;
	}
public String updateProfileImg(MemberVO mvo) {
		
		int i=sqlSessionTemplate.update("member.updateProfileImg",mvo);
		String result = "";
		
		if(i>0) {
			 result = "success";
		}
		return result;
	}

}
