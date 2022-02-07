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
	//java파일 또는 class 파일을 통으로 가져와서 그 안에 있는 메소드를 사용하고 싶을때 @Autowired를 선언 한 뒤 자바파일 또는 class파일명 작성 후 약어(별명)작성
	//MemberService -> java(또는 class) 파일명
	//memberService - > 약어
	//MemberService memberSerivce;
	
	//Autowired 선언 안할시 각 메서드에 선언을 해줘야 함
	
	// 	ex) 
	// 	public void insertCsqna(CsqnaVO vo) {
	// 	SqlSessionTemplate sqlSessionTemplate;
	//	sqlSessionTemplate.insert("csqna.insertCsqna", vo);}

	
	
			//xml 선언한 csqna 
	public void insertCsqna(CsqnaVO vo) {
		sqlSessionTemplate.insert("csqna.insertCsqna", vo);
	}
	
	
//CsqnaVO.java의 <List>의 VO         사용자로부터 받은 VO
	public CsqnaVO selectCsqnaList(CsqnaVO vo) {
		
		
		
		//내가 정하는 약어 qnaVO 나머지는 그냥 공식 그냥 쓰는것
		CsqnaVO qnaVO = new CsqnaVO();
		
	//위에 약어
		qnaVO.setCsQnaList(sqlSessionTemplate.selectList("csqna.selectCsqnaList", vo));
		
		//컨틀로러 
		return qnaVO;
	}

}


	
	