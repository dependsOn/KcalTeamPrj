package service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

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
	
	public void insertTip(TipVO vo) {
		vo.setCreatedate(new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA).format(new Date()));
		sqlSessionTemplate.insert("tip.insertTip", vo);
	}
}
