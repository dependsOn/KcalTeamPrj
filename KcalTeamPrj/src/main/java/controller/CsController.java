package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import service.CsService;
import service.LetterService;
import vo.CsqnaPagingVO;
import vo.CsqnaVO;
import vo.LetterVO;

@Controller
@RequestMapping("/cs")
public class CsController {
	
	
	@Autowired
	CsService csService;
	
	
	@GetMapping("/goCs")
	public String goCs(Model model,CsqnaVO vo) {
		//1. �α��� �� ȸ���� �ۼ� �� �� ����
		//2. �α��� ���� ȸ���̸� ������������ �̵�
		
		//CSService���� ȣ���� selectCsqnaList �޼ҵ��� ������ ���´� CsqnaVO�� �Ǿ��־ ������ Ÿ���� �����ϰ� �����ֱ� ���� �� �տ� CsqnaVO �ۼ� 
//		CsqnaVO qnavo = csService.selectCsqnaList(vo);
//		List<CsqnaVO> volist = qnavo.getCsQnaList();
		
		//model.addAttribute("���",������);
//		model.addAttribute("list",volist);
		return "cs";
	}

	
	
	@ResponseBody
	@PostMapping("/insertCsqna")
	public void insertCsqna(CsqnaVO vo) {
		System.out.println(vo.getNickname());
		System.out.println(vo.getTitle());
		System.out.println(vo.getContents());		
		csService.insertCsqna(vo);
		
	}
	
	
	
	
	
	
	
	
	
	
	@ResponseBody
	@PostMapping("/csqnaList")
	public ResponseEntity<CsqnaPagingVO> getBBSList(@RequestParam(defaultValue = "") String nickname, 
												   @RequestParam(defaultValue = "1") int pageNum) {
		CsqnaPagingVO csqnaList = csService.getCsqnaList(nickname, pageNum);
		
		ResponseEntity<CsqnaPagingVO> entity = new ResponseEntity<CsqnaPagingVO>(csqnaList, HttpStatus.OK); 
		
		return entity;
	}
	
	
}
