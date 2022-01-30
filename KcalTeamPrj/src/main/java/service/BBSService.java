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

	public BBSPagingVO getBBSList(String category, int unum, int pageNum, int count, 
								  String searchCategory, String searchText) {		
		BBSVO bvo = new BBSVO();
		bvo.setCategory(category);
		if(unum != 0) { bvo.setUnum(unum); } // 마이페이지 작성글
		bvo.setCount(count); // 한번에 나오는 글 수 set
		bvo.setStart((pageNum-1)*bvo.getCount());
		
		// 검색 시
		if(searchCategory.equals("all")) {
			bvo.setTitle("%"+searchText+"%");
			bvo.setContent("%"+searchText+"%");
		}else if(searchCategory.equals("title")) {
			bvo.setTitle("%"+searchText+"%");
		}else if(searchCategory.equals("content")) {
			bvo.setContent("%"+searchText+"%");
		}
		
		int postCnt = sqlSessionTemplate.selectOne("bbs.selectBBSCount", bvo);
		
		BBSPagingVO bpvo = new BBSPagingVO();
		bpvo.setBbsList(sqlSessionTemplate.selectList("bbs.selectBBSList", bvo));
		bpvo.setPageNum(pageNum);
		bpvo.setPostCnt(postCnt);
		bpvo.setPageCnt(postCnt/count+((postCnt%count==0)?0:1));
		bpvo.setMinBlock((((pageNum-1)/5)*5)+1);
		bpvo.setMaxBlock(((pageNum-1)/5+1)*5);
		
		return bpvo; 		
	}
	
	
}