package com.onlythree.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.onlythree.dao.MemberDAO;
import com.onlythree.dao.RecipeDAO;
import com.onlythree.vo.Member;
import com.onlythree.vo.Recipe;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private RecipeDAO recipeDAO;
	
	//로그인
	@Override
	public boolean login(String id, String password) throws Exception {
		Member member=memberDAO.selectMember(id);
		if(member==null) throw new Exception("회원이 없습니다.");
		if(member.getPassword().equals(password)) {
			return true;
		}
		return false;
	}

	
	//회원가입
	@Override
	public void joinBasic(Member member) throws Exception {
		Member smember = memberDAO.selectMember(member.getMember_id());
		if(smember!=null) throw new Exception("기본정보 INSERT 실패");
		memberDAO.insertMemberProfile(member);
	}

	//0423 재현  선호도조사 결과 목록
	public Member MyPrefer(String id) throws Exception{
		return memberDAO.selectMember(id);
	}
	
	//0423 재현 이페이지: 내가 작성한 레시피 
	public List<Recipe> MyRecipe(String id) throws Exception{
		return recipeDAO.selectMyRecipeinfo(id);
	}

	//0423 재현 마이페이지: 본인 정보
	public Member MyProfile(String id) throws Exception{
		return memberDAO.selectMember(id);
	}
	
	//0423 재현 마이페이지: 선호재료 저장 
	@Override
	public void savePreferIngre(String id, String preferred_ingr) throws Exception{
		Member member = memberDAO.selectMember(id);
		if(member==null) {
			throw new Exception("회원없음");
		} else {
			member.setPreferred_ingr(preferred_ingr);
			memberDAO.updateMemberSurveyPrefer(member);
		}
	}
	
	
	//0423 재현 마이페이지: 비선호재료 저장
	@Override
	public void saveUnpreferIngre(String id, String unpreferred_ingr) throws Exception{
		Member member = memberDAO.selectMember(id);
		if(member==null) {
			throw new Exception("회원없음");
		} else {
			member.setUnpreferred_ingr(unpreferred_ingr); 
			memberDAO.updateMemberSurveyUnprefer(member);
		}
	}
		
	//0423 재현 마이페이지: 알러지재료 저장 
	public void saveAllergyIngre(String id, String allergy_ingr) throws Exception{
		Member member = memberDAO.selectMember(id);
		if(member==null) {
			throw new Exception("회원없음");
		} else {
			member.setAllergy_ingr(allergy_ingr);
			memberDAO.updateMemberSurveyAllergy(member);
		}
	}
	
	//0423 주혜 관리자 페이지
	@Override
	public Member memberInfo(String id) throws Exception {
		return memberDAO.selectMember(id);
	}
		
	@Override
	public List<Member> allMemberInfo() throws Exception {
		return memberDAO.selectAllMemberList();
	}

	@Override
	public void deleteMember(String member_id) throws Exception {
		Member member = memberDAO.selectMember(member_id);
		if(member==null) {
			throw new Exception("회원 정보 없음");
		}
		else {
			memberDAO.deleteMember(member_id);
		}
	}
		
	//0430 재현 마이페이지 회원정보 수정
	@Override
	public void updateMember(Member member) throws Exception{
		memberDAO.updateMemberProfile(member);
	}
	
	//0504 재현 마이페이지: 내가 작성한 레시피 건수
	public int NumMyRecipe(String id) throws Exception{
		return recipeDAO.countMyRecipe(id);
	}
	
	
}
