package com.onlythree.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.onlythree.service.IngredientService;
import com.onlythree.service.MemberService;
import com.onlythree.service.RecipeService;
import com.onlythree.service.ScrapService;
import com.onlythree.vo.Ingredient;
import com.onlythree.vo.Member;
import com.onlythree.vo.Recipe;
import com.onlythree.vo.Scrap;

@Controller
public class MyPageController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private IngredientService ingredientService;

	@Autowired
	private ScrapService scrapService;

	// 0423 재현 수정 //0505 재현 회원프로필 사진, 레시피 개수 추가
	@RequestMapping(value = { "/mypage", "/myRecipeList" }, method = RequestMethod.GET)
	public ModelAndView mypage(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		try {
			String id = (String) session.getAttribute("id");
			// 회원 프로필 사진
			Member memberprofile = memberService.MyProfile(id);
			String MEM_IMG_URL = memberprofile.getMem_img_url();
			modelAndView.addObject("MEM_IMG_URL", MEM_IMG_URL);
			// 회원 작성 레시피 개수
			int searchCount = memberService.NumMyRecipe(id);
			modelAndView.addObject("searchCount", searchCount);
			// 회원 작성 레시피 내용
			List<Recipe> recipeList = memberService.MyRecipe(id);
			modelAndView.addObject("recipeList", recipeList);
			modelAndView.addObject("page", "myRecipeList");
		} catch (Exception e) {
			e.printStackTrace();
			modelAndView.addObject("err", "레시피 조회 오류");
			modelAndView.addObject("page", "err");
		}
		modelAndView.setViewName("myPageIndex");
		return modelAndView;
	}

	@RequestMapping(value = "/myProfile", method = RequestMethod.GET)
	public ModelAndView myProfile(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		try {
			Member memberprofile = memberService.MyProfile((String) session.getAttribute("id"));
			String memberID = memberprofile.getMember_id();
			String memberName = memberprofile.getName();
			String memberNickname = memberprofile.getNickname();
			String memberEmail = memberprofile.getEmail();
			String memberPhone = memberprofile.getPhone();
			int memberBirthyear = memberprofile.getBirthyear();
			String MEM_IMG_URL = memberprofile.getMem_img_url();
			modelAndView.addObject("MEM_IMG_URL", MEM_IMG_URL);
			modelAndView.addObject("memberID", memberID);
			modelAndView.addObject("memberName", memberName);
			modelAndView.addObject("memberNickname", memberNickname);
			modelAndView.addObject("memberEmail", memberEmail);
			modelAndView.addObject("memberPhone", memberPhone);
			modelAndView.addObject("memberAge", memberBirthyear);

			modelAndView.addObject("page", "myPage_profile");
		} catch (Exception e) {
			e.printStackTrace();
			modelAndView.addObject("err", "레시피 조회 오류");
			modelAndView.addObject("page", "err");
		}
		modelAndView.setViewName("myPageIndex");
		return modelAndView;
	}

	@RequestMapping(value = "/myPreferList", method = RequestMethod.GET)
	public ModelAndView myPreferList(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		try {
			String id = (String) session.getAttribute("id");
			// 회원 프로필 사진
			Member memberprofile = memberService.MyProfile(id);
			String MEM_IMG_URL = memberprofile.getMem_img_url();
			modelAndView.addObject("MEM_IMG_URL", MEM_IMG_URL);
			// 회원 선호음식 리스트
			String memberPreferIngre = memberprofile.getPreferred_ingr();
			String memberUnpreferIngre = memberprofile.getUnpreferred_ingr();
			String memberAllergyIngre = memberprofile.getAllergy_ingr();
			modelAndView.addObject("memberPreferIngre", memberPreferIngre);
			modelAndView.addObject("memberUnpreferIngre", memberUnpreferIngre);
			modelAndView.addObject("memberAllergyIngre", memberAllergyIngre);

			modelAndView.addObject("page", "myPreferList");

		} catch (Exception e) {
			e.printStackTrace();
		}

		modelAndView.setViewName("myPageIndex");
		return modelAndView;
	}

	// 선호재료조사
	@RequestMapping(value = "/survey_prefer", method = RequestMethod.GET)
	public String survey_prefer(Model model) {
		try {
			List<Ingredient> ingredients = ingredientService.allIngredientCategory();
			System.out.println("대분류 호출 성공: " + ingredients);
			model.addAttribute("ingredients", ingredients);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("message", "controller:회원조회에 실패하였습니다.");
		}
		return "surveyPrefer";
	}

	// 선호재료저장
	@RequestMapping(value = "/myPreferSave", method = RequestMethod.POST)
	public String myPreferSave(HttpSession session, @ModelAttribute Member member, HttpServletRequest request) {
		String[] items = request.getParameterValues("surveySmall_sub");
		StringBuffer prefersubIngre = new StringBuffer();
		for (String ingre : items) {
			prefersubIngre.append(ingre);
			prefersubIngre.append(",");
			System.out.println("prefersubIngre: " + prefersubIngre);
		}
		ModelAndView modelAndView = new ModelAndView();
		try {
			Member member1 = memberService.MyProfile((String) session.getAttribute("id"));
			String id = member1.getMember_id();
			memberService.savePreferIngre(id, prefersubIngre.toString());
			modelAndView.addObject("page", "myPreferList");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("저장실패");
		}
		modelAndView.setViewName("myPageIndex");
		return "redirect:/myPreferList";
	}

	// 재료 서브 목록 불러오기
	@ResponseBody
	@RequestMapping(value = "/joinForm_ingre_sub", method = RequestMethod.GET)
	public List<String> ingreCategorySub(
			@RequestParam(value = "ingredient_category", required = true) String ingredient_category) {
		List<String> subIngredients = null;
		try {
			subIngredients = ingredientService.allIngredientByCategory(ingredient_category);
			System.out.println("소분류 호출 성공: " + subIngredients);
		} catch (Exception e) {
			e.printStackTrace();
		}
		for (String str : subIngredients) {
			System.out.println(str);
		}
		return subIngredients;

	}

	// 비선호재료조사
	@RequestMapping(value = "/survey_unprefer", method = RequestMethod.GET)
	public String survey_unprefer(Model model) {
		try {
			List<Ingredient> ingredients = ingredientService.allIngredientCategory();
			model.addAttribute("ingredients", ingredients);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("message", "controller:회원조회에 실패하였습니다.");
		}
		return "surveyUnprefer";
	}

	// 비선호재료저장
	@RequestMapping(value = "/myUnpreferSave", method = RequestMethod.POST)
	public String myUnpreferSave(HttpSession session, @ModelAttribute Member member, HttpServletRequest request) {
		String[] items = request.getParameterValues("surveySmall_sub");
		StringBuffer unprefersubIngre = new StringBuffer();
		for (String ingre : items) {
			unprefersubIngre.append(ingre);
			unprefersubIngre.append(",");
		}
		ModelAndView modelAndView = new ModelAndView();
		try {
			Member member1 = memberService.MyProfile((String) session.getAttribute("id"));
			String id = member1.getMember_id();
			memberService.saveUnpreferIngre(id, unprefersubIngre.toString());
			modelAndView.addObject("page", "myPreferList");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("저장실패");
		}
		modelAndView.setViewName("myPageIndex");
		return "redirect:/myPreferList";
	}

	// 알러지재료조사
	@RequestMapping(value = "/survey_allergy", method = RequestMethod.GET)
	public String survey_allergy(Model model) {
		try {
			List<Ingredient> ingredients = ingredientService.allIngredientCategory();
			model.addAttribute("ingredients", ingredients);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("message", "controller:회원조회에 실패하였습니다.");
		}
		return "surveyAllergy";
	}

	// 알러지재료저장
	@RequestMapping(value = "/myAllergySave", method = RequestMethod.POST)
	public String myAllergySave(HttpSession session, @ModelAttribute Member member, HttpServletRequest request) {

		String[] items = request.getParameterValues("surveySmall_sub");
		System.out.println("getParameter: " + items);

		StringBuffer allergysubIngre = new StringBuffer();
		for (String ingre : items) {
			allergysubIngre.append(ingre);
			allergysubIngre.append(",");
		}
		ModelAndView modelAndView = new ModelAndView();
		try {
			Member member1 = memberService.MyProfile((String) session.getAttribute("id"));
			String id = member1.getMember_id();
			memberService.saveAllergyIngre(id, allergysubIngre.toString());
			modelAndView.addObject("page", "myPreferList");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("저장실패");
		}
		modelAndView.setViewName("myPageIndex");
		return "redirect:/myPreferList";
	} // 0423 재현 수정 끝

	// 0428 재현 마이페이지
	@RequestMapping(value = "/mypage_scrap_list", method = RequestMethod.GET)
	public ModelAndView myScrapList2(HttpServletRequest request) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		try {
			String id = (String) session.getAttribute("id");
			// 회원 프로필 사진
			Member memberprofile = memberService.MyProfile(id);
			String MEM_IMG_URL = memberprofile.getMem_img_url();
			modelAndView.addObject("MEM_IMG_URL", MEM_IMG_URL);
			// 스크랩 레시피 개수
			int searchCount = scrapService.NumMyScrapRecipe(id);
			modelAndView.addObject("searchCount", searchCount);
			// 스크랩 목록
			List<Scrap> scraplist = scrapService.getMyScrapInfo(id);
			modelAndView.addObject("scrapList", scraplist);
			modelAndView.addObject("page", "mypage_scrapList");
		} catch (Exception e) {
			e.printStackTrace();
			modelAndView.addObject("err", "레시피 조회 오류");
			modelAndView.addObject("page", "err");
		}
		modelAndView.setViewName("myPageIndex");
		return modelAndView;
	}

	// 0430 재현 마이페이지 회원정보수정

	@RequestMapping(value = "/myProfile_update", method = RequestMethod.GET)
	  public String myProfile_list(HttpSession session, Model model) { 
		try { 
			String id = (String) session.getAttribute("id"); 
			//회원 프로필 사진 
			Member memberprofile = memberService.MyProfile(id); 
			String MEM_IMG_URL = memberprofile.getMem_img_url(); 
			model.addAttribute("MEM_IMG_URL", MEM_IMG_URL); 
			//회원 정보 리스트 
			String memberID = memberprofile.getMember_id();
			String memberName = memberprofile.getName(); 
			String memberNickname = memberprofile.getNickname(); 
			String memberEmail = memberprofile.getEmail();
			String memberPhone = memberprofile.getPhone(); 
			int memberBirthyear = memberprofile.getBirthyear(); 
			model.addAttribute("memberID", memberID);
			model.addAttribute("memberName", memberName);
			model.addAttribute("memberNickname", memberNickname);
			model.addAttribute("memberEmail", memberEmail);
			model.addAttribute("memberPhone", memberPhone);
			model.addAttribute("memberBirthyear", memberBirthyear); 
		} catch (Exception e) { 
			e.printStackTrace(); 
			//model.addAttribute("err", "레시피 조회 오류");
		}
		//model.addAttribute("page", "err"); }
		//modelAndView.setViewName("/myPage_profile_update"); 
		return "myPage_profile_update"; 
	}

	/*
	 * @RequestMapping(value = "/myProfile_update", method = RequestMethod.GET)
	 * public ModelAndView myProfile_list(HttpSession session) { ModelAndView
	 * modelAndView = new ModelAndView(); try { String id = (String)
	 * session.getAttribute("id"); //회원 프로필 사진 Member memberprofile =
	 * memberService.MyProfile(id); String MEM_IMG_URL =
	 * memberprofile.getMem_img_url(); modelAndView.addObject("MEM_IMG_URL",
	 * MEM_IMG_URL); //회원 정보 리스트 String memberID = memberprofile.getMember_id();
	 * String memberName = memberprofile.getName(); String memberNickname =
	 * memberprofile.getNickname(); String memberEmail = memberprofile.getEmail();
	 * String memberPhone = memberprofile.getPhone(); int memberBirthyear =
	 * memberprofile.getBirthyear(); modelAndView.addObject("memberID", memberID);
	 * modelAndView.addObject("memberName", memberName);
	 * modelAndView.addObject("memberNickname", memberNickname);
	 * modelAndView.addObject("memberEmail", memberEmail);
	 * modelAndView.addObject("memberPhone", memberPhone);
	 * modelAndView.addObject("memberBirthyear", memberBirthyear);
	 * modelAndView.addObject("page", "myPage_profile_update"); } catch(Exception e)
	 * { e.printStackTrace(); modelAndView.addObject("err","레시피 조회 오류");
	 * modelAndView.addObject("page", "err"); }
	 * modelAndView.setViewName("myPageIndex"); return modelAndView; }
	 */

	// 0504 마이페이지 스크랩 레시피 삭제
	@RequestMapping(value = "/deleteScrapRecipe", method = RequestMethod.POST)
	public String deleteScrapRecipe(@RequestParam(value = "SCRAP_ID", required = true) Integer SCRAP_ID) {
		ModelAndView modelAndView = new ModelAndView();
		try {
			scrapService.deleteScrap(SCRAP_ID);
			modelAndView.addObject("page", "myPreferList");
		} catch (Exception e) {
			e.printStackTrace();
			modelAndView.addObject("err", "스크랩 삭제 오류");
			modelAndView.addObject("page", "err");
		}
		return "redirect:/mypage_scrap_list";
	}
	
	//0507 재현 마이페이지 최근에 본 레시피
	
	// 0428 재현 마이페이지
	@RequestMapping(value = "/mypage_recent_list", method = RequestMethod.GET)
	public ModelAndView myrecentlist(HttpServletRequest request) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		try {
			String id = (String) session.getAttribute("id");
			// 회원 프로필 사진
			Member memberprofile = memberService.MyProfile(id);
			String MEM_IMG_URL = memberprofile.getMem_img_url();
			modelAndView.addObject("MEM_IMG_URL", MEM_IMG_URL);

			modelAndView.addObject("page", "mypage_recentList");
		} catch (Exception e) {
			e.printStackTrace();
			modelAndView.addObject("err", "레시피 조회 오류");
			modelAndView.addObject("page", "err");
		}
		modelAndView.setViewName("myPageIndex");
		return modelAndView;
	}
	
}
