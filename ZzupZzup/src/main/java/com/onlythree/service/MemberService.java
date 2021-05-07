package com.onlythree.service;

import java.util.List;

import com.onlythree.vo.Member;
import com.onlythree.vo.Recipe;

public interface MemberService {
	public boolean login(String id, String password) throws Exception;
	public void joinBasic(Member member) throws Exception;
	
	
	//0423 재현 mypage 선호도조사 결과 목록
	public Member MyPrefer(String id) throws Exception;
	//0423 재현 마이페이지: 내가 작성한 레시피 목록
	public List<Recipe> MyRecipe(String id) throws Exception;
	//0423 재현 마이페이지: 내 프로필
	public Member MyProfile(String id) throws Exception;
	//0423 재현 마이페이지: 선호재료 저장 
	public void savePreferIngre(String id, String preferred_ingr) throws Exception;
	//0423 재현 마이페이지: 비선호재료 저장 
	public void saveUnpreferIngre(String id, String unpreferred_ingr) throws Exception;
	//0423 재현 마이페이지: 알러지재료 저장 
	public void saveAllergyIngre(String id, String allergy_ingr) throws Exception;
	
	
	//0423 주혜 관리자 페이지
	public Member memberInfo(String id) throws Exception;
	public List<Member> allMemberInfo() throws Exception;
	public void deleteMember(String member_id) throws Exception;
	
	//0430 재현 마이페이지 회원정보 수정
	//public void updateMember(String id, Member member) throws Exception;
	public void updateMember(Member member) throws Exception;
	
	//0504 재현 마이페이지: 내가 작성한 레시피 건수
	public int NumMyRecipe(String id) throws Exception;

}



