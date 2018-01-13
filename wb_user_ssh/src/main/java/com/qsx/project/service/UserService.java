package com.qsx.project.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qsx.project.dao.UserDao;
import com.qsx.project.model.Page;
import com.qsx.project.model.UserModel;

@Service
public class UserService {
	@Autowired
	private UserDao userDao;

	public List<UserModel> getUsers() {
		return userDao.getUsers();
	}

	public void deleteUser(UserModel User) {
		userDao.deleteUser(User);
	}

	public UserModel getUser(UserModel User) {
		return userDao.getUser(User);
	}

	public void save(UserModel User) {
		userDao.saveUser(User);
	}

	/**
	 * 分页的service层业务处理
	 */

	public Page getPage(int pageSize, int page) {
		Page pageBean = new Page();
		int allRows = userDao.getAllRowCount();
		int totalPage = pageBean.getTotalPages(pageSize, allRows);
		int currentPage = pageBean.getCurPage(page);
		int offset = pageBean.getCurrentPageOffset(pageSize, currentPage);
		List<UserModel> list = userDao.queryByPage(offset, pageSize);
		pageBean.setList(list);
		pageBean.setAllRows(allRows);
		pageBean.setCurrentPage(currentPage);
		pageBean.setTotalPage(totalPage);

		return pageBean;
	}

}
