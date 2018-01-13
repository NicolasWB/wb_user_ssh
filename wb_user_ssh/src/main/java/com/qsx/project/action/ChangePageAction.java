package com.qsx.project.action;

import org.springframework.stereotype.Component;

@Component("changeAction")
public class ChangePageAction {
	UserAction userAction;

	/**
	 * 加载content页面
	 * 
	 * @return
	 */
	public String content() {
		return "list";
	}

	/**
	 * 加载success页面
	 * 
	 * @return
	 */
	public String success() {
		return "success";
	}
}
