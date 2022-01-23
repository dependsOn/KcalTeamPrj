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

	public void selectLetterList(Model model, String nickname, int rnum, int snum) {
		LetterVO rvo = new LetterVO();
		LetterVO svo = new LetterVO();
		
		rvo.setRnick(nickname);
		svo.setSnick(nickname);
		
		rvo.setRstart((rnum-1)*rvo.getCount());
		svo.setSstart((snum-1)*svo.getCount());
		
		model.addAttribute("receiveLetterList", sqlSessionTemplate.selectList("letter.selectLetterList", rvo));
		model.addAttribute("sendLetterList", sqlSessionTemplate.selectList("letter.selectLetterList", svo));
		model.addAttribute("rcount", sqlSessionTemplate.selectOne("letter.selectLetterCount", rvo));
		model.addAttribute("scount", sqlSessionTemplate.selectOne("letter.selectLetterCount", svo));
		model.addAttribute("rnum", rnum);
		model.addAttribute("snum", snum);
	}

	
}
