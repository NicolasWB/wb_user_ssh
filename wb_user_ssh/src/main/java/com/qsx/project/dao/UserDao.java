package com.qsx.project.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.qsx.project.common.BaseDao;
import com.qsx.project.model.UserModel;

/**
 * 操作数据库
 * 
 * @author wb
 *
 */
@Repository
public class UserDao {
	@Autowired
	private BaseDao baseDao;

	/**
	 * 查找所有用户
	 */
	@SuppressWarnings("unchecked")
	public List<UserModel> getUsers() {
		return (List<UserModel>) baseDao.getHibernateTemplate().find("from UserModel");
	}

	/**
	 * 查找单个用户
	 */
	public UserModel getUser(UserModel user) {
		return baseDao.getHibernateTemplate().get(UserModel.class, user.getId());
	}

	/**
	 * 删除用户
	 */
	public void deleteUser(UserModel user) {
		baseDao.getHibernateTemplate().delete(user);
	}

	/**
	 * 保存用户
	 */
	public void saveUser(UserModel user) {
		baseDao.getHibernateTemplate().save(user);
	}

	/**
	 * 分页查询
	 */
	public int getAllRowCount() {
		int allRows = 0;// 总的数据条数
		List<UserModel> list = (List<UserModel>) baseDao.getHibernateTemplate().find("from UserModel");
		allRows = list.size();
		return allRows;
	}

	/**
	 * 利用hibernate的分页功能实现分页显示
	 */
	@SuppressWarnings("rawtypes")
	public List<UserModel> queryByPage(final int offset, final int pageSize) {
		@SuppressWarnings("unchecked")
		List<UserModel> list = baseDao.getHibernateTemplate().execute(new HibernateCallback() {

			public Object doInHibernate(Session session) throws HibernateException {
				String hql = "from UserModel";
				Query query = session.createQuery(hql);

				query.setFirstResult(offset);
				query.setMaxResults(pageSize);

				return query.list();
			}

		});
		return list;
	}
}
