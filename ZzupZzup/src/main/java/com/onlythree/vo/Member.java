package com.onlythree.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component("member")
public class Member {

	String member_id;
	String name;
	String password;
	String nickname;
	String mem_img_url;
	String email;
	String phone;
	int birthyear;
	String gender;
	String preferred_ingr;
	String unpreferred_ingr;
	String allergy_ingr;
	Date join_date;
	Date change_date;
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getMem_img_url() {
		return mem_img_url;
	}
	public void setMem_img_url(String mem_img_url) {
		this.mem_img_url = mem_img_url;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getBirthyear() {
		return birthyear;
	}
	public void setBirthyear(int birthyear) {
		this.birthyear = birthyear;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPreferred_ingr() {
		return preferred_ingr;
	}
	public void setPreferred_ingr(String preferred_ingr) {
		this.preferred_ingr = preferred_ingr;
	}
	public String getUnpreferred_ingr() {
		return unpreferred_ingr;
	}
	public void setUnpreferred_ingr(String unpreferred_ingr) {
		this.unpreferred_ingr = unpreferred_ingr;
	}
	public String getAllergy_ingr() {
		return allergy_ingr;
	}
	public void setAllergy_ingr(String allergy_ingr) {
		this.allergy_ingr = allergy_ingr;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	public Date getChange_date() {
		return change_date;
	}
	public void setChange_date(Date change_date) {
		this.change_date = change_date;
	}

	

}
