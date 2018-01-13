package com.qsx.project.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qsx.project.dao.ChartDao;
import com.qsx.project.model.UserModel;

@Service
public class ChartService {
	@Autowired
	private ChartDao chartDao;

	/**
	 * 图标信息service
	 */
	public List<UserModel> queryUserList() {
		return chartDao.queryUserList();
	}
}
