package com.onlythree.dao;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.onlythree.vo.Member;

@Mapper
@Repository("memberDAO")
public interface MemberDAO {
	public Member selectMember(String id) throws Exception;
	public void insertMemberProfile(Member mem) throws Exception;	
	
	//0423 재현 마이페이지
	//마이페이지: 선호도조사결과 저장
	public void updateMemberSurveyPrefer(Member member) throws Exception;	
	//마이페이지: 선호도조사결과 저장
	public void updateMemberSurveyUnprefer(Member member) throws Exception;	
	//마이페이지: 선호도조사결과 저장
	public void updateMemberSurveyAllergy(Member member) throws Exception;	

	
	//0423 주혜 관리자 페이지
	public List<Member> selectAllMemberList() throws Exception;
	public void deleteMember(String member_id) throws Exception;
	
	//0430 재현 마이페이지 
	public void updateMemberProfile(Member member) throws Exception;
}
