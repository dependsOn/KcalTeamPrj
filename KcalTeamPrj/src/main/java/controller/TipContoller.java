package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import service.TipSerivce;
import vo.TipVO;

@Controller
@RequestMapping("/tip")
public class TipContoller {
	
	@Autowired
	private TipSerivce tipService;
	
	@GetMapping("/goTip")
	public String goTip(Model model, TipVO tvo) {
		tipService.selectTipList(model, tvo);
		
		return "tip";
	}
	
	@GetMapping("/createTip")
	public String createTip() {
		
		return "createTip";
	}
	
	@PostMapping("/fileUpload")
	public String fileUpload() {
		return "";
	}
	
	@PostMapping("/create_result")
	public String createResult(TipVO vo) {
		
		tipService.insertTip(vo);
		
		return "redirect:/tip/goTip";
	}
}
