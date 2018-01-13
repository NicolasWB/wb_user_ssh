package com.qsx.project.dao;

import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.qsx.project.common.BaseDao;
import com.qsx.project.model.UserModel;

@Repository
public class ChartDao {
	@Autowired
	private BaseDao baseDao;

	@SuppressWarnings("unchecked")
	@Test
	public List<UserModel> queryUserList() {
		String hql = "from UserModel u where u.sex = '男' ";
		return (List<UserModel>)baseDao.getHibernateTemplate().find(hql);
	}
}
