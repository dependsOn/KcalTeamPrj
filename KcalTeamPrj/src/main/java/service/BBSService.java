package service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vo.BBSPagingVO;
import vo.BBSVO;

@Service
public class BBSService {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public BBSPagingVO getBBSList(String category, int unum, int pageNum) {
		BBSVO bvo = new BBSVO();
		bvo.setCategory(category);
		bvo.setUnum(unum);
		bvo.setStart((pageNum-1)*bvo.getCount());
		
		int postCnt = sqlSessionTemplate.selectOne("bbs.selectBBSCount", bvo);
		
		BBSPagingVO bpvo = new BBSPagingVO();
		bpvo.setBbsList(sqlSessionTemplate.selectList("bbs.selectBBSList", bvo));
		bpvo.setPageNum(pageNum);
		bpvo.setPostCnt(postCnt);
		bpvo.setPageCnt(postCnt/10+((postCnt%10==0)?0:1));
		bpvo.setMinBlock((((pageNum-1)/5)*5)+1);
		bpvo.setMaxBlock(((pageNum-1)/5+1)*5);
		
		return bpvo; 		
	}
	
	
}
