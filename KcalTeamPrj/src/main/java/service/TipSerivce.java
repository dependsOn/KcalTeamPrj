package service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import vo.TipVO;

@Service
public class TipSerivce {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public void selectTipList(Model model, TipVO tvo) {
		model.addAttribute("list", sqlSessionTemplate.selectList("tip.selectTipList", tvo));
	}
	
	public void selectTip(TipVO tvo) {
		TipVO vo = sqlSessionTemplate.selectOne("tip.selectTip", tvo);
		
		tvo.setTnum(vo.getTnum());
		tvo.setCategory(vo.getCategory());
		tvo.setTitle(vo.getTitle());
		tvo.setContents(vo.getContents());
		tvo.setCreatedate(vo.getCreatedate().substring(0, 19));
		tvo.setOwnerid(vo.getOwnerid());
		tvo.setOwnername(vo.getOwnername());
	}
	
	public void insertTip(TipVO vo) {
		sqlSessionTemplate.insert("tip.insertTip", vo);
	}
	
	public void updateTip(TipVO vo) {
		sqlSessionTemplate.update("tip.updateTip", vo);
	}
	
	public void deleteTip(TipVO vo) {
		sqlSessionTemplate.delete("tip.deleteTip", vo);
	}
}
