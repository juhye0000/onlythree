package com.onlythree.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.onlythree.service.IngredientService;
import com.onlythree.service.MemberService;
import com.onlythree.vo.Member;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;

	@Autowired
	private IngredientService ingredientService;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("page","loginForm");
		modelAndView.setViewName("index_Member");
		return modelAndView;
	}

	//0506 재현 redirect로 변경 + 로그인실패상황 구현
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@RequestParam(value = "id", required = true) String id,
			@RequestParam(value = "password", required = true) String password, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		try {
			boolean success = memberService.login(id, password);
			if (!success)
				throw new Exception("로그인실패");
			// 로그인 성공 -> index로 return
			request.getSession().setAttribute("id", id);
			model.addAttribute("id", id);
			return "redirect:/";
		} catch (Exception e) {
			e.printStackTrace();
			// 로그인실패 -> alert 띄우고 다시 loginform으로 return
			model.addAttribute("message", "로그인에 실패하였습니다. ID 및 비밀번호를 확인해주세요.");
			model.addAttribute("page","loginForm");
			return "index_Member";
		}
	}

	@RequestMapping(value = "/login_ingre", method = RequestMethod.GET)
	public ModelAndView login_ingre() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("page","loginForm_ingre");
		modelAndView.setViewName("index_Member");
		return modelAndView;
	}

	@RequestMapping(value = "/login_ingre", method = RequestMethod.POST)
	public ModelAndView login_ingre(@RequestParam(value = "id", required = true) String id,
			@RequestParam(value = "password", required = true) String password, HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();

		try {
			boolean success = memberService.login(id, password);
			if (!success)
				throw new Exception("로그인실패");
			request.getSession().setAttribute("id", id);
			// 로그인 성공 -> 마이페이지 선호 목록으로 이동
			/* modelAndView.addObject("page", "myPreferList"); */
			modelAndView.setViewName("redirect:/myPreferList");
		} catch (Exception e) {
			e.printStackTrace();
			// 로그인실패 -> alert 띄우고 다시 loginform으로 return
			modelAndView.addObject("message", "로그인에 실패하였습니다. ID 및 비밀번호를 확인해주세요.");
			modelAndView.addObject("page","loginForm");
			modelAndView.setViewName("index_Member");
		}
		/* modelAndView.setViewName("myPageIndex"); */
		return modelAndView;
	}
	
	//0506 재현 redirect로 변경
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, Model model) {
		request.getSession().removeAttribute("id");
		return "redirect:/";
	}

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public ModelAndView join() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("page","joinForm");
		modelAndView.setViewName("index_Member");
		return modelAndView;
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public ModelAndView joinBasic(@ModelAttribute Member member) {
		ModelAndView modelAndView = new ModelAndView();
		try {
			memberService.joinBasic(member);
			// 회원가입 성공하면 선호음식 선택할지 묻는 페이지로 이동
			//modelAndView.setViewName("choose_ingre");
			modelAndView.addObject("page","choose_ingre");			
			modelAndView.setViewName("index_Member");
		} catch (Exception e) {
			// 회원가입 실패하면 alert 메시지 띄우고 joinForm으로 다시 이동
			System.out.println(e.getMessage());
			modelAndView.addObject("message", "controller:회원가입에 실패하였습니다.");
			modelAndView.addObject("page","joinForm");
			modelAndView.setViewName("index_Member");
		}
		return modelAndView;
	} //0423 재현 수정 끝

	// 0423 주혜 관리자 페이지
	// 전체 회원 조회
	@RequestMapping(value = "/allmemberinfo", method = RequestMethod.GET)
	public String allMemberInfo(Model model) {
		try {
			List<Member> members = memberService.allMemberInfo();
			model.addAttribute("members", members);
			model.addAttribute("page", "allmemberinfo_form");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", "전체 회원 조회 오류");
			model.addAttribute("page", "err");
		}
		return "adminindex";
	}
	
	//0427 주혜 관리자 페이지
	//회원 조회
	@RequestMapping(value="/allmemberinfo", method=RequestMethod.POST)
	public String RecipeDetail(Model model,@RequestParam(value="member_id", required=true) String member_id) throws Exception {
		Member member = memberService.memberInfo(member_id);
		model.addAttribute("member", member);
		model.addAttribute("page", "memberinfo_form");
		return "adminindex";
	}

	// 회원 삭제
		@RequestMapping(value = "/deletemember", method = RequestMethod.GET)
		public String deleteMember(Model model) {
			try {
				List<Member> members = memberService.allMemberInfo();
				model.addAttribute("members", members);
				model.addAttribute("page", "deletemember_form");
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("err", "전체 회원 조회 오류");
				model.addAttribute("page", "err");
			}
			return "adminindex";
		}

		@RequestMapping(value = "/deletemember", method = RequestMethod.POST)
		public String deleteMember(@RequestParam(value = "member_id", required = true) String member_id, Model model) {
			try {
				memberService.deleteMember(member_id);
				model.addAttribute("page", "deletemember_success");
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("err", "회원 삭제 오류");
				model.addAttribute("page", "err");
			}
			return "adminindex";
		}
		// 0423 주혜 관리자 페이지 끝

	
	
	//0430 재현 마이페이지 회원정보수정 join방식으로
		@RequestMapping(value = "/myProfile_update", method = RequestMethod.POST)
		public String myProfile_update(HttpSession session, 
										@ModelAttribute Member member, 
										@RequestParam("profileImg") MultipartFile sourceFile, 
										MultipartFile photofile, 
										MultipartHttpServletRequest multi) 
												throws Exception {
			ModelAndView modelAndView = new ModelAndView();
			//mem_img_url
			String sourceFileName = sourceFile.getOriginalFilename();
			String sourceFileNameExtension = FilenameUtils.getExtension(sourceFileName).toLowerCase();
			File destinationFile;
			String destinationFileName;
			String path = multi.getServletContext().getRealPath("/upload/");
			
			//기존 저장되어있는 mem_img_url
			String id = (String) session.getAttribute("id"); 
			Member memberprofile = memberService.MyProfile(id); 
			String MEM_IMG_URL = memberprofile.getMem_img_url();

			do {
				destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + sourceFileNameExtension;
				destinationFile = new File(path + destinationFileName);
			} while (destinationFile.exists());
				
			//만약 파일 선택을 안해서 파일확장자명이 없다면 기존 mem_img_url 그대로 씀
			if (sourceFileNameExtension == "") {
				//회원 프로필 사진 
				member.setMem_img_url(MEM_IMG_URL);
			}else {
				//파일을 선택해서 파일확장자명이 있다면 새로운 mem_img_url 입력
				destinationFile.getParentFile().mkdirs();
				sourceFile.transferTo(destinationFile);
				member.setMem_img_url("/upload/" + destinationFileName);
			} 
			try {
				memberService.updateMember(member);
			} catch (Exception e) {
				e.printStackTrace();
				modelAndView.addObject("err", "회원정보 업데이트 실패");
				modelAndView.addObject("page", "err");
			}
			return "redirect:/myProfile";
		}
}
