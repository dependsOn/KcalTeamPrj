package service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


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
	public CsqnaVO selectCsqnaList(CsqnaVO vo) {
		
		
		
		//���� ���ϴ� ��� qnaVO �������� �׳� ���� �׳� ���°�
		CsqnaVO qnaVO = new CsqnaVO();
		
	//���� ���
		qnaVO.setCsQnaList(sqlSessionTemplate.selectList("csqna.selectCsqnaList", vo));
		
		//��Ʋ�η� 
		return qnaVO;
	}

}


	
	