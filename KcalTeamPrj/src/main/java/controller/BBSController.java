package controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import service.BBSService;
import vo.BBSPagingVO;
import vo.BBSVO;

@Controller
@RequestMapping("/bbs")
public class BBSController {

	@Autowired
	BBSService bbsService;
	
	@ResponseBody
	@PostMapping("/bbsList")
	public ResponseEntity<BBSPagingVO> getBBSList(String category, int count, 
												  @RequestParam(defaultValue = "0") int unum, 
												  @RequestParam(defaultValue = "1") int pageNum,
												  @RequestParam(defaultValue = "") String searchCategory,
												  @RequestParam(defaultValue = "") String searchText) {
		BBSPagingVO bbsList = bbsService.getBBSList(category, unum, pageNum, count, searchCategory, searchText);
		
//		System.out.println(searchCategory);
//		System.out.println(searchText);
//		System.out.println(category);
//		System.out.println(unum);
//		System.out.println(pageNum);
//		
//		for ( BBSVO vo : bbsList.getBbsList()) {
//			System.out.println(vo.getBnum());
//			System.out.println(vo.getNickname());
//			System.out.println(vo.getTitle());
//			System.out.println(vo.getContent());
//			System.out.println(vo.getCreatedate());
//		}
//		System.out.println("minBlock: "+ bbsList.getMinBlock());
//		System.out.println("maxBlock: "+bbsList.getMaxBlock());
//		System.out.println("현재페이지: "+bbsList.getPageNum());
//		System.out.println("총 페이지 수: "+bbsList.getPageCnt());
//		System.out.println("검색된 글 수: "+bbsList.getPostCnt());
		
		ResponseEntity<BBSPagingVO> entity = new ResponseEntity<BBSPagingVO>(bbsList, HttpStatus.OK); 
		
		return entity;
	}
	
	@GetMapping("/detail")
	public String bbsDetail(Model model, BBSVO vo) {
		
		bbsService.selectBBS(model, vo);
		
		return "community_bbs_detail";
	}
	
	@GetMapping("/create")
	public String getBBSCreate(BBSVO vo) {
		return "community_bbs_create";
	}
	
	@PostMapping("/create_result")
	public String setBBSCreate(BBSVO vo, Model model) {
//		System.out.println(vo.getTitle());
//		System.out.println(vo.getContent());
//		System.out.println(vo.getOwnerid());
//		System.out.println(vo.getOwnername());
//		System.out.println(vo.getFilelist());
		
//		vo.setCreatedate(new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA).format(new Date()));
		model.addAttribute("category", vo.getCategory());
		
		bbsService.insertBBS(vo);
		return "community_bbs";
	}
	
	@GetMapping("/modify")
	public String modifyBBS(@ModelAttribute BBSVO vo, Model model) {
		bbsService.selectBBS(model, vo);
		return "community_bbs_modify";
	}
	
	@PostMapping("/community_modify_result")
	public String modifyBBSResult(BBSVO vo, Model model) {
		bbsService.updateBBS(vo, model);
		return "community_bbs_detail";
	}
	
	
}
