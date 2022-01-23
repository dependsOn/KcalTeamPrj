package service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import vo.LetterVO;

@Service
public class LetterService {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public void selectLetterList(Model model, String nickname, int num) {
		LetterVO rvo = new LetterVO();
		LetterVO svo = new LetterVO();
		
		rvo.setRnick(nickname);
		svo.setSnick(nickname);
		
		rvo.setStart((num-1)*rvo.getCount());
		
		List<LetterVO> letterList = sqlSessionTemplate.selectList("letter.selectLetterList", rvo);
		
		for(LetterVO item : letterList) {
			System.out.println(item.getTitle());
			System.out.println(item.getSnick());
			System.out.println(item.getDate());
		}
		
		
		model.addAttribute("receiveLetterList", sqlSessionTemplate.selectList("letter.selectLetterList", rvo));
		model.addAttribute("sendLetterList", sqlSessionTemplate.selectList("letter.selectLetterList", svo));
		model.addAttribute("count", sqlSessionTemplate.selectOne("letter.selectLetterCount", rvo));
		model.addAttribute("num", num);
	}

	
}
