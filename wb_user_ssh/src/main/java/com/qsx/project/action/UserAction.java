package com.qsx.project.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.qsx.project.model.Page;
import com.qsx.project.model.UserModel;
import com.qsx.project.service.UserService;

@Component("userAction")
public class UserAction {
	@Autowired
	private UserService userServer;
	private List<UserModel> list;
	private UserModel user;

	public String findUsers() {
		list = userServer.getUsers();
		return "list";
	}

	public String delete() {
		userServer.deleteUser(user);
		list = userServer.getUsers();
		return "delete";
	}

	public String info() {
		user = userServer.getUser(user);
		return "info";
	}

	public String save() {
		userServer.save(user);
		list = userServer.getUsers();
		return "list";
	}

	public List<UserModel> getList() {
		return list;
	}

	public void setList(List<UserModel> list) {
		this.list = list;
	}

	public UserModel getUser() {
		return user;
	}

	public void setUser(UserModel user) {
		this.user = user;
	}

	/**
	 * 分页的Action
	 */
	private int page;

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String paging() {
		Page pageBean = userServer.getPage(5, page);
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("pageBean", pageBean);
		return "list";
	}
}
