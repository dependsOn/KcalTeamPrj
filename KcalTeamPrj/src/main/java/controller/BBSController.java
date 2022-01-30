package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
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
}
