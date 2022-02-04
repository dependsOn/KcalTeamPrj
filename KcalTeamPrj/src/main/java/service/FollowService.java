package service;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import vo.FollowVO;
import vo.MemberVO;


@Service
public class FollowService {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public void getFollowCnt(Model model, FollowVO fvo) {
		Map<String,Object> map= sqlSessionTemplate.selectOne("follow.countFollow",fvo);
		Object i1=map.get("followerCnt");
		Object i2=map.get("followeeCnt");
	
		model.addAttribute("followerCnt",i1);
		model.addAttribute("followeeCnt",i2);
		
		
	}
	
	public void getFollowerList(Model model, FollowVO fvo) {
		model.addAttribute("followerList",sqlSessionTemplate.selectList("follow.followerList",fvo));
	}
	public void getFolloweeList(Model model, FollowVO fvo) {
		model.addAttribute("followeeList",sqlSessionTemplate.selectList("follow.followeeList",fvo));
	}
	public void updateFollowImg(MemberVO mvo) {
		FollowVO fvo1=new FollowVO();
		FollowVO fvo2=new FollowVO();
	    fvo1.setFollower_n(mvo.getNickname());
	    fvo1.setErimg_localname(mvo.getImg_localname());
	    fvo1.setErimg_servername(mvo.getImg_servername());
	    fvo2.setFollowee_n(mvo.getNickname());
	    fvo2.setEeimg_localname(mvo.getImg_localname());
	    fvo2.setEeimg_servername(mvo.getImg_servername());
	    sqlSessionTemplate.update("follow.updateEeImg",fvo2);
	    sqlSessionTemplate.update("follow.updateErImg",fvo1);
	   
	}
	public void deleteFollow(FollowVO vo) {
		sqlSessionTemplate.delete("follow.deleteFollow",vo);
		
	}
	
	
}
