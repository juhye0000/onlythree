package com.onlythree.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.onlythree.vo.Method;

@Mapper
@Repository("methodDAO")
public interface MethodDAO {
	public void insertMethod(Method method) throws Exception;
	public Method selectMethod(String method_id) throws Exception;
	public void updateMethodTitle(Method method) throws Exception;
	public List<Method> selectAllMethodList() throws Exception;
	public void deleteMethod(String method_id) throws Exception;
}
