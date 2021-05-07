package com.onlythree.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.onlythree.dao.MethodDAO;
import com.onlythree.vo.Method;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class MethodServiceImpl implements MethodService {
	@Autowired
	private MethodDAO methodDAO;
	
	@Override
	public void makeMethod(Method method) throws Exception {
		Method tmethod = methodDAO.selectMethod(method.getMethod_title());
		if(tmethod!=null) {
			throw new Exception("방법명 중복");
		} else {
			methodDAO.insertMethod(method);
		}
	}

	@Override
	public void updateMethod(String method_id, String method_title) throws Exception {
		Method method = methodDAO.selectMethod(method_id);
		if(method==null) {
			throw new Exception("방법명 없음");
		} else {
			method.setMethod_title(method_title);
			methodDAO.updateMethodTitle(method);
		}
	}

	@Override
	public Method methodInfo(String method_id) throws Exception {
		return methodDAO.selectMethod(method_id);
	}

	@Override
	public List<Method> allMethodInfo() throws Exception {
		return methodDAO.selectAllMethodList();
	}

	@Override
	public void deleteMethod(String method_id) throws Exception {
		Method method = methodDAO.selectMethod(method_id);
		if(method==null) {
			throw new Exception("방법명 없음");
		} else {
			methodDAO.deleteMethod(method_id);
		}
	}
}
