package service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vo.CsqnaPagingVO;
import vo.CsqnaVO;


@Service
public class CsService {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	//@Autowired
	//java���� �Ǵ� class ������ ������ �����ͼ� �� �ȿ� �ִ� �޼ҵ带 ����ϰ� ������ @Autowired�� ���� �� �� �ڹ����� �Ǵ� class���ϸ� �ۼ� �� ���(����)�ۼ�
	//MemberService -> java(�Ǵ� class) ���ϸ�
	//memberService - > ���
	//MemberService memberSerivce;
	
	//Autowired ���� ���ҽ� �� �޼��忡 ������ ����� ��
	
	// 	ex) 
	// 	public void insertCsqna(CsqnaVO vo) {
	// 	SqlSessionTemplate sqlSessionTemplate;
	//	sqlSessionTemplate.insert("csqna.insertCsqna", vo);}

	
	
			//xml ������ csqna 
	public void insertCsqna(CsqnaVO vo) {
		sqlSessionTemplate.insert("csqna.insertCsqna", vo);
	}
	
	
//CsqnaVO.java�� <List>�� VO         ����ڷκ��� ���� VO
//	public CsqnaVO selectCsqnaList(CsqnaVO vo) {
		
		
		
		//���� ���ϴ� ��� qnaVO �������� �׳� ���� �׳� ���°�
//		CsqnaVO qnaVO = new CsqnaVO();
		
	//���� ���
//		qnaVO.setCsQnaList(sqlSessionTemplate.selectList("csqna.selectCsqnaList", vo));
//		
//		//��Ʋ�η� 
//		return qnaVO;
//	}

	
	
	
	
	
	
	
	
	
	

	public CsqnaPagingVO getCsqnaList(String nickname, int pageNum) {
		
		CsqnaVO cqvo = new CsqnaVO();
		cqvo.setNickname(nickname);
		cqvo.setStart((pageNum - 1) * cqvo.getCount());
		
		int postCnt = sqlSessionTemplate.selectOne("csqna.selectCsqnaCount", cqvo);
		
		CsqnaPagingVO cqpVO = new CsqnaPagingVO();
		cqpVO.setCsqnaList(sqlSessionTemplate.selectList("csqna.selectCsqnaList", cqvo));
		cqpVO.setPageNum(pageNum);
		cqpVO.setPostCnt(postCnt);
		cqpVO.setPageCnt(postCnt / 10 + ((postCnt % 10 == 0) ? 0 : 1));
		cqpVO.setMinBlock((((pageNum - 1) / 5) * 5) + 1);
		cqpVO.setMaxBlock(((pageNum - 1) / 5 + 1) * 5);
		
		return cqpVO;
	}

}


	
	