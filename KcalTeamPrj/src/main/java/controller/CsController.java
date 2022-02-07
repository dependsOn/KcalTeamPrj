package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import service.CsService;
import service.LetterService;
import vo.CsqnaVO;
import vo.LetterVO;

@Controller
@RequestMapping("/cs")
public class CsController {
	
	
	@Autowired
	CsService csService;
	
	
	@GetMapping("/goCs")
	public String goCs(Model model,CsqnaVO vo) {
		//1. 로그인 한 회원만 작성 할 수 있음
		//2. 로그인 안한 회원이면 이전페이지로 이동
		
		//CSService에서 호출한 selectCsqnaList 메소드의 데이터 형태는 CsqnaVO로 되어있어서 데이터 타입을 동일하게 맞춰주기 위해 맨 앞에 CsqnaVO 작성 
		CsqnaVO qnavo = csService.selectCsqnaList(vo);
		List<CsqnaVO> volist = qnavo.getCsQnaList();
		
		//model.addAttribute("약어",데이터);
		model.addAttribute("list",volist);
		return "cs";
	}

	
	
	@ResponseBody
	@PostMapping("/insertCsqna")
	public void insertCsqna(CsqnaVO vo) {
		System.out.println(vo.getNickname());
		System.out.println(vo.getPassword());
		System.out.println(vo.getTitle());
		System.out.println(vo.getContents());		
		csService.insertCsqna(vo);
		
	}
	
	
}
