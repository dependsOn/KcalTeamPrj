package controller;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import vo.FollowVO;
import vo.MemberVO;
import vo.PostfileVO;
import vo.UserpostVO;
import service.FollowService;
import service.MemberService;
import service.PostService;

@Controller
public class ProfileController {

	 @Autowired
	    FollowService followService;	
		@Autowired
		MemberService memberService;
		@Autowired
		PostService postService;

		@GetMapping("profile/main")
		public String test1(Model model,@RequestParam("nickname") String nickname){
		    FollowVO fvo=new FollowVO();
		    MemberVO mvo=new MemberVO();
		    mvo.setNickname(nickname);
		    fvo.setFollower_n(nickname);
		    fvo.setFollowee_n(nickname);
			followService.getFollowCnt(model,fvo);
			followService.getFollowerList(model,fvo);
			followService.getFolloweeList(model,fvo);
			memberService.selectMember(model,mvo);
			return "myProfile";
		}
		// 게시물 페이징
		@PostMapping("pofile/getuserpostList")
		@ResponseBody
		public ResponseEntity<List<Map<String, Object>>> getuserpostList(@RequestParam("nickname") String nickname,
				@RequestParam int pageNum, @RequestParam int count) {
			MemberVO mvo = new MemberVO();
			mvo.setNickname(nickname);
			List<Map<String, Object>> userpostList = postService.getPostList(mvo, pageNum, count);
//			for (int i = 0; i < userpostList.size(); i++) {
//				String ii = (String) userpostList.get(i).get("title");
//				System.out.println(ii);
//			}
			ResponseEntity<List<Map<String, Object>>> entry = new ResponseEntity<List<Map<String, Object>>>(userpostList,
					HttpStatus.OK);
			
			return entry;
		}


		@PostMapping("profile/profileUpdate")
		@ResponseBody
		public String updateMember(
				@RequestPart(value = "uploadFile",required = false) MultipartFile uploadFile,
				@RequestPart(value = "data") MemberVO vo,
				Model model) throws Exception{
			String path="/Users/hwang-yeonghyeon/git/KcalTeamPrj/KcalTeamPrj/src/main/webapp/resources/images/myprofile";
			


			MultipartFile file = uploadFile;
				if(file!=null) {
			    String name = UUID.randomUUID().toString();
			    String fileName = file.getOriginalFilename();
	             //확장자
			    String extension = fileName.substring(fileName.lastIndexOf(".")+1, fileName.length());
				file.transferTo(new File(path, name+"."+extension));
				vo.setImg_localname(file.getOriginalFilename());
				vo.setImg_servername(name+"."+extension);
				memberService.updateProfileImg(vo);
				memberService.updateProfile(vo);
			    followService.updateFollowImg(vo);
			    
					System.out.println(file.getOriginalFilename() + " 저장 완료.");
				}else {
					
					memberService.updateProfile(vo);
				}
				return "success";
			
			
		}
		
		@PostMapping("post/userpost")
		@ResponseBody
		public String userpost(@RequestPart(value = "postfiles",required = false) MultipartFile[] fileList,
				@RequestPart(value = "userpost") UserpostVO vo,
				Model model) throws Exception{
			String path="/Users/hwang-yeonghyeon/spring_eclipse/MVC-workspace/TestTeamProject/src/main/webapp/resources/images/postfile";
			int i=postService.setPost(vo);
			
			
			for(MultipartFile file : fileList) {
				if(file!=null) {
					PostfileVO pvo=new PostfileVO();
					pvo.setPnum(i);
				 String name = UUID.randomUUID().toString();
				    String fileName = file.getOriginalFilename();
				    String extension = fileName.substring(fileName.lastIndexOf(".")+1, fileName.length());
					file.transferTo(new File(path, name+"."+extension));
					pvo.setLocalname(fileName);
					pvo.setServername(name+"."+extension);
					postService.postfiles(pvo);
				
				
			}else {
				System.out.println("파일이 존재하지 않습니다.");
			}
			
			
		}
		
		
			return "success";
		
		}
		
		@PostMapping("post/userpostView")
		@ResponseBody
		public ResponseEntity<UserpostVO> userpostView(@RequestBody UserpostVO vo) {
			postService.updateViewCnt(vo);
		   vo=postService.userpostView(vo);
			ResponseEntity<UserpostVO> entry=new ResponseEntity<UserpostVO>(vo, HttpStatus.OK); 
		return entry;
		
		}
		
		@PostMapping("post/userpostViewImg")
		@ResponseBody
		public ResponseEntity <List<PostfileVO>> userpostViewImg(@RequestBody PostfileVO vo) {
			List<PostfileVO> arr=postService.userpostViewImg((PostfileVO) vo);
			ResponseEntity<List<PostfileVO>> entry = 
					new ResponseEntity<List<PostfileVO>>(arr, HttpStatus.OK);
		return entry;
		
		}
		
		@PostMapping("follow/deletefollow")
		@ResponseBody
		public void deleteFollow(@RequestBody FollowVO vo) {
			
			followService.deleteFollow(vo);
		}
}
