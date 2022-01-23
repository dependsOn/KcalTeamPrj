package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import service.LetterService;

@Controller
@RequestMapping("/letter")
public class LetterController {

	@Autowired
	LetterService letterService;

//	@ResponseBody
	@GetMapping("/letterList")
	public String getBBSList(Model model, String nickname, @RequestParam(defaultValue = "1") int num) {
		
		letterService.selectLetterList(model, nickname, num);
		System.out.println(nickname);
		
		return "letterList";
	}
}
