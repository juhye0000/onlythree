package com.onlythree.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

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

import com.onlythree.service.CookLevelService;
import com.onlythree.service.IngredientService;
import com.onlythree.service.MethodService;
import com.onlythree.service.RecipeService;
import com.onlythree.service.ScrapService;
import com.onlythree.service.ThemeService;
import com.onlythree.vo.CookLevel;
import com.onlythree.vo.Ingredient;
import com.onlythree.vo.Method;
import com.onlythree.vo.Recipe;
import com.onlythree.vo.RecipeContent;
import com.onlythree.vo.Scrap;
import com.onlythree.vo.Theme;

@Controller
public class RecipeController {

	// 0423 우리 수정
	@Autowired
	private RecipeService recipeService;
	@Autowired
	private ThemeService themeService;
	@Autowired
	private MethodService methodService;
	@Autowired
	private CookLevelService cookLevelService;
	@Autowired
	private IngredientService ingredientService;

	// 0428 주혜 추가
	@Autowired
	private ScrapService scrapService;

	@RequestMapping(value = "/getRecipeContent", method = RequestMethod.GET)
	public String RecipeDetail(Model model, @RequestParam(value = "RECIPE_ID", required = true) Integer RECIPE_ID)
			throws Exception {
		Recipe recipe = recipeService.getRecipe(RECIPE_ID);
		model.addAttribute("recipe", recipe);
		System.out.println(RECIPE_ID);
		return "recipe_view_form";
	}

	// 0430 주혜 수정 //0505 재현 수정--> redirect로 바꿨습니다.
	@RequestMapping(value = "/mypagescrap", method = RequestMethod.POST)
	public String scrapRecipe(@RequestParam(value = "RECIPE_ID", required = true) Integer RECIPE_ID,
			@RequestParam(value = "SCRAP_TITLE", required = true) String SCRAP_TITLE, HttpServletRequest request)
			throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		try {
			Scrap scrap = new Scrap();
			String MEMBER_ID = (String) session.getAttribute("id");
			scrap.setRECIPE_ID(RECIPE_ID);
			scrap.setMEMBER_ID(MEMBER_ID);
			scrap.setSCRAP_TITLE(SCRAP_TITLE);
			scrapService.makeScrap(scrap); 
			//List<Scrap> scrapList = scrapService.getMyScrapInfo(MEMBER_ID); // 얘는 mypage_scraplist에 데이터 불러가는거죠??
			//modelAndView.addObject("scrapList", scrapList);
			//modelAndView.addObject("page", "mypage_scrapList");
			//modelAndView.addObject("page", "myPreferList");
		} catch (Exception e) {
			e.printStackTrace();
			modelAndView.addObject("err", "레시피 스크랩 오류");
			modelAndView.addObject("page", "err");
		}
		//modelAndView.setViewName("myPageIndex");
		//return modelAndView;
		return "redirect:/mypage_scrap_list";
	}

	@RequestMapping(value = "/insertRecipeContent", method = RequestMethod.GET)
	public String WriteRecipe(Model model) {
		try {
			List<Method> methods = methodService.allMethodInfo();
			model.addAttribute("methods", methods);
			List<Theme> themes = themeService.allThemeInfo();
			model.addAttribute("themes", themes);
			List<Ingredient> ingredients = ingredientService.allIngredientCategory();
			model.addAttribute("ingredients", ingredients);
			List<CookLevel> cookLevels = cookLevelService.allCookLevelInfo();
			model.addAttribute("cookLevels", cookLevels);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "recipe_write_form";
	}

	/*
	 * @RequestMapping(value = "/insertRecipeContent", method = RequestMethod.POST)
	 * public String WriteRecipe(@ModelAttribute Recipe recipe, RecipeContent
	 * recipeContent, ArrayList<RecipeContent> CONTENT, Method method, Model model,
	 * HttpServletRequest request, @RequestParam MultipartFile sourceFile,
	 * MultipartFile photofile, MultipartHttpServletRequest multi,
	 * HttpServletResponse response) throws Exception { String sourceFileName =
	 * sourceFile.getOriginalFilename(); String sourceFileNameExtension =
	 * FilenameUtils.getExtension(sourceFileName).toLowerCase(); File
	 * destinationFile; String destinationFileName; String path =
	 * multi.getServletContext().getRealPath("/upload/");
	 * //System.out.println(path); do { destinationFileName =
	 * RandomStringUtils.randomAlphanumeric(32) + "." + sourceFileNameExtension;
	 * destinationFile = new File(path + destinationFileName); } while
	 * (destinationFile.exists()); destinationFile.getParentFile().mkdirs();
	 * sourceFile.transferTo(destinationFile);
	 * //System.out.println(destinationFile.getPath());
	 * 
	 * //0503 우리 추가 String photofileName = photofile.getOriginalFilename(); String
	 * photofileNameExtension =
	 * FilenameUtils.getExtension(photofileName).toLowerCase(); File
	 * stepdestinationFile; String stepdestinationFileName; String path2 =
	 * multi.getServletContext().getRealPath("/upload/"); System.out.println(path2);
	 * do { stepdestinationFileName = RandomStringUtils.randomAlphanumeric(32) + "."
	 * + photofileNameExtension; stepdestinationFile = new File(path +
	 * stepdestinationFileName); } while (stepdestinationFile.exists());
	 * stepdestinationFile.getParentFile().mkdirs();
	 * photofile.transferTo(stepdestinationFile);
	 * System.out.println(stepdestinationFile.getPath());
	 * 
	 * 
	 * String[] content = request.getParameterValues("text_area");
	 * 
	 * for(int i=0; i<content.length; i++) { System.out.println("여기 어디야" +
	 * content[i]); recipeContent.setRECIPE_ID(recipe.getRECIPE_ID());
	 * recipeContent.setCONTENT_CONTENT(content[i]);
	 * recipeContent.setRECIPE_STEP(i);
	 * recipeContent.setCONTENT_IMAGE_URL("/upload/" + stepdestinationFileName);
	 * CONTENT.add(recipeContent); System.out.println(recipeContent);
	 * System.out.println(CONTENT); } recipe.setCONTENT(CONTENT);
	 * 
	 * 
	 * 
	 * 
	 * recipeContent.setRECIPE_ID(recipe.getRECIPE_ID());
	 * recipeContent.setCONTENT_CONTENT(content);
	 * recipeContent.setRECIPE_STEP(length);
	 * 
	 * 
	 * recipe.setTAG(""); recipe.setMAINPIC1_URL("/upload/" + destinationFileName);
	 * recipeContent.setCONTENT_IMAGE_URL("/upload/" + stepdestinationFileName);
	 * System.out.println(stepdestinationFileName);
	 * System.out.println(recipe.getTITLE());
	 * System.out.println(recipe.getMEMBER_ID());
	 * System.out.println(recipe.getINGREDIENT_ID());
	 * System.out.println(recipe.getMETHOD_ID());
	 * System.out.println(recipe.getTHEME_ID());
	 * System.out.println(recipe.getLEVEL_ID());
	 * System.out.println(recipe.getTAG());
	 * System.out.println(recipe.getRECIPE_HITS());
	 * System.out.println(recipe.getTIME());
	 * System.out.println(recipe.getMEALS_FOR());
	 * System.out.println(recipe.getMAINPIC1_URL());
	 * System.out.println(recipe.getINGREDIENT());
	 * System.out.println(recipe.getSOURCE());
	 * System.out.println(recipe.getCONTENT());
	 * System.out.println(recipeContent.getCONTENT_CONTENT());
	 * System.out.println(recipeContent.getRECIPE_STEP());
	 * System.out.println(recipeContent.getCONTENT_IMAGE_URL());
	 * 
	 * try { recipeService.insertRecipe(recipe); Recipe resultRecipe =
	 * recipeService.getRecipe(recipe.getRECIPE_ID()); model.addAttribute("recipe",
	 * resultRecipe); model.addAttribute("page", "recipe_view_form"); } catch
	 * (Exception e) { e.printStackTrace(); } return "recipe_view_form"; }
	 */
	// 0423 우리 수정 끝

	// 0503 재현 레시피 작성
	@RequestMapping(value = "/insertRecipeContent", method = RequestMethod.POST)
	public String WriteRecipe(@ModelAttribute Recipe recipe, RecipeContent recipeContent,
			ArrayList<RecipeContent> CONTENT, Method method, Model model, HttpServletRequest request,
			@RequestParam MultipartFile sourceFile, MultipartFile photofile, MultipartHttpServletRequest multi,
			HttpServletResponse response ) throws Exception {
		
		//MAINPIC1_URL
		String sourceFileName = sourceFile.getOriginalFilename();
		String sourceFileNameExtension = FilenameUtils.getExtension(sourceFileName).toLowerCase();
		File destinationFile;
		String destinationFileName;
//		String path = multi.getServletContext().getRealPath("/upload/");
		String path="/upload/image/";
		File dir = new File(path);
		if(dir.isDirectory()) {
			dir.mkdir();
		}

		

		do {
			destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + sourceFileNameExtension;
			destinationFile = new File(path + destinationFileName);
		} while (destinationFile.exists());
		destinationFile.getParentFile().mkdirs();
		sourceFile.transferTo(destinationFile);
		
		recipe.setTAG("");
		recipe.setMAINPIC1_URL("/upload/" + destinationFileName);
		
	
		//text_area name을 가진 파라미터 값 가져옴
		String[] content = request.getParameterValues("text_area");
				
		//사진 목록 가져롬
		List<MultipartFile> mf = multi.getFiles("photofile");

		
		try {
			//recipe테이블이 부모테이블이라 먼저 insert되어야 함
			recipeService.insertRecipe(recipe);
			
			//recipeContent를 step개수 만큼 반복 저장
			for (int i = 0; i < content.length; i++) {
				recipeContent.setRECIPE_ID(recipe.getRECIPE_ID());
				recipeContent.setRECIPE_STEP(i+1);
				recipeContent.setCONTENT_CONTENT(content[i]);
				
				
				//사진저장
				String photofileName = mf.get(i).getOriginalFilename();
				String photofileNameExtension = FilenameUtils.getExtension(photofileName).toLowerCase();
				File stepdestinationFile;
				String stepdestinationFileName;
//				String path2 = multi.getServletContext().getRealPath("/upload/");
				String path2="/upload/image/";
				File dir2 = new File(path2);
				if(dir2.isDirectory()) {
					dir2.mkdir();
				}

				do {
					stepdestinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + photofileNameExtension;
					stepdestinationFile = new File(path + stepdestinationFileName);
				} while (stepdestinationFile.exists());
				stepdestinationFile.getParentFile().mkdirs();
				mf.get(i).transferTo(stepdestinationFile);
				recipeContent.setCONTENT_IMAGE_URL("/upload/" + stepdestinationFileName);

						
				
				recipeService.insertRecipeContent(recipeContent);
			}
			
			//입력 후 recipe view 페이지 셋팅
			Recipe resultRecipe = recipeService.getRecipe(recipe.getRECIPE_ID());
			model.addAttribute("recipe", resultRecipe);
			model.addAttribute("page", "recipe_view_form");
		} catch (Exception e) {
			e.printStackTrace();
		}
		 
		return "recipe_view_form";
	}

	// 0430 우리 추가
	// 전체 레시피 조회 (회원)
	@RequestMapping(value = { "/AllRecipeList" }, method = RequestMethod.GET)
	public ModelAndView allRecipeList(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		try {
			List<Recipe> allRecipes = recipeService.allRecipeInfo();
			modelAndView.addObject("allRecipes", allRecipes);
			modelAndView.addObject("page", "recipe_list");

		} catch (Exception e) {
			e.printStackTrace();
			modelAndView.addObject("err", "레시피 조회 오류");
			modelAndView.addObject("page", "err");
		}
		modelAndView.setViewName("listIndex");
		return modelAndView;
	}

	// 0423 주혜 추가
	// 관리자 페이지 - 전체 레시피 조회
	@RequestMapping(value = "/allrecipeinfo", method = RequestMethod.GET)
	public String allRecipeInfo(Model model) {
		try {
			List<Recipe> recipes = recipeService.allRecipeInfo();
			model.addAttribute("recipes", recipes);
			model.addAttribute("page", "allrecipeinfo_form");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", "전체 회원 조회 오류");
			model.addAttribute("page", "err");
		}
		return "adminindex";
	}

	@RequestMapping(value = "/getRecipeContent", method = RequestMethod.POST)
	public String RecipeDetail2(Model model, @RequestParam(value = "RECIPE_ID", required = false) Integer RECIPE_ID)
			throws Exception {
		Recipe recipe = recipeService.getRecipe(RECIPE_ID);
		model.addAttribute("recipe", recipe);
		return "/recipe_view_form";
	}

	// 레시피 삭제
	@RequestMapping(value = "/deleterecipe", method = RequestMethod.GET)
	public String deleteRecipe(Model model) {
		try {
			List<Recipe> recipes = recipeService.allRecipeInfo();
			model.addAttribute("recipes", recipes);
			model.addAttribute("page", "deleterecipe_form");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", "전체 회원 조회 오류");
			model.addAttribute("page", "err");
		}
		return "adminindex";
	}

	@RequestMapping(value = "/deleterecipe", method = RequestMethod.POST)
	public String deleteRecipe(@RequestParam(value = "RECIPE_ID", required = true) Integer RECIPE_ID, Model model) {
		try {
			recipeService.deleteRecipe(RECIPE_ID);
			model.addAttribute("page", "deleterecipe_success");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", "레시피 삭제 오류");
			model.addAttribute("page", "err");
		}
		return "adminindex";
	}

	// 0423 주혜 추가 끝
	
	
	//0504 재현 마이페이지 내가 작성한 레시피 삭제
	@RequestMapping(value = "/deleteMyRecipe", method = RequestMethod.POST)
	public String deleteMyRecipe(@RequestParam(value = "RECIPE_ID", required = true) Integer RECIPE_ID) {
		ModelAndView modelAndView = new ModelAndView();
		try {
			recipeService.deleteRecipe(RECIPE_ID);
			System.out.println("삭제완료");
			modelAndView.addObject("page", "myRecipeList");
		} catch (Exception e) {
			e.printStackTrace();
			modelAndView.addObject("err", "레시피 삭제 오류");
			modelAndView.addObject("page", "err");
		}
		return "redirect:/myRecipeList";
	}


	
}
