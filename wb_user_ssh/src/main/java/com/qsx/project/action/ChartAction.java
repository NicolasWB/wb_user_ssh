package com.qsx.project.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;

import com.qsx.project.model.UserModel;
import com.qsx.project.service.ChartService;
import com.qsx.project.service.UserService;

@Component("chartAction")
public class ChartAction {
	@Autowired
	private ChartService chartService;
	@Autowired
	private UserService userService;
	private Map<String, Object> result = new HashMap<String, Object>();

	public Map<String, Object> getResult() {
		return result;
	}

	public void setResult(Map<String, Object> result) {
		this.result = result;
	}

	public String chartPie() {
		List<UserModel> list = chartService.queryUserList();
		int nums = list.size();// 男生人数
		List<UserModel> list1 = userService.getUsers();
		int nums1 = list1.size() - nums;// 女生人数
		String mess = "我们之间";
		String[] sex = { "男", "女" };
		List labels = new ArrayList();
		labels.add("男");
		labels.add("女");
		List data = new ArrayList();
//		data.add(nums);
		data.add(0, nums);
		data.add(1, nums1);
//		data.add(nums1);

		result.put("labels", labels);
		result.put("data", data);
		return "pie";
	}
}
