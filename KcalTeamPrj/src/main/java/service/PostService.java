package service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import vo.MemberVO;
import vo.PostfileVO;
import vo.UserpostVO;

@Service
public class PostService{
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public void getPostList(Model model, MemberVO mvo){
	MemberVO vo1=sqlSessionTemplate.selectOne("member.selectMember",mvo);
	int usernum=vo1.getUnum();
	UserpostVO pvo=new UserpostVO();
	pvo.setUnum(usernum);
    List<Map<String,Object>> pvoList=sqlSessionTemplate.selectList("userpost.selectPost",pvo);    
    for(int i=0; i<pvoList.size(); i++ ) {
	   int pnum =(int) pvoList.get(i).get("pnum"); 
	   
       PostfileVO fvo=new PostfileVO();
	   fvo.setPnum(pnum);
       fvo=sqlSessionTemplate.selectOne("userpost.selectPostfileThumbnail",fvo);
      
       if(fvo != null) {
        
    	   pvoList.get(i).put("servername", fvo.getServername());
    	      pvoList.get(i).put("localname", fvo.getLocalname());
       }else {
    	   pvoList.get(i).put("servername", null);
 	      pvoList.get(i).put("localname",null);
       }  
   }
    
	model.addAttribute("userpostList",pvoList);
	}
    public int setPost(UserpostVO vo) {
    	sqlSessionTemplate.insert("userpost.insertPost",vo);
    	return vo.getPnum();
    	
    }
    
    public void postfiles(PostfileVO vo) {
    	sqlSessionTemplate.insert("userpost.insertPostfile",vo);
    }
    
    public UserpostVO userpostView(UserpostVO vo) {
    	UserpostVO uvo=new UserpostVO();
    	uvo=sqlSessionTemplate.selectOne("userpost.userpostView",vo);
    	
//    	model.addAttribute("userpostView",sqlSessionTemplate.selectOne("userpost.userpostView",vo));
    	return uvo;
    	
    	
    }
    public List<PostfileVO> userpostViewImg(PostfileVO vo) {
    
    	List<PostfileVO> lvo=sqlSessionTemplate.selectList("userpost.selectPostfileList",vo);
    	

    	return lvo;
    	
    	
    }
    public void updateViewCnt(UserpostVO vo) {
        
    	sqlSessionTemplate.update("userpost.updateViewCnt",vo);
    	
    	
    	
    }

}
