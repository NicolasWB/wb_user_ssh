<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="div3" id="boss">
	<form action="userAction!save" method="post" accept-charset="utf-8">
		<div class="div3-2">
			<h3>新增用户信息</h3>
			<label>用户名称： <input type="text" placeholder="请输入您的用户名！"
				class="input1" id="name" name="user.username">
			</label> <br> <label>登录密码： <input type="password"
				placeholder="请输入您的密码！" class="input1" id="password">
			</label> <br> <label>重复密码： <input type="password"
				placeholder="请输入您的确认密码！" class="input1" id="repassword">
			</label> <br> <label>电子邮箱： <input type="email"
				placeholder="请输入您的邮箱！" class="input1" id="email" name="user.email">
			</label> <br> <label>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：
				<input type="radio" name="user.sex" value="男">男 <input
				type="radio" name="user.sex" value="女">女
			</label>
		</div>
		<hr>
		<button type="submit" class="button-3" id="bo">保存</button>
		<button type="reset" class="button-3">重置</button>
		<button type="" class="button-3">返回</button>
	</form>
</div>
<script type="text/javascript" src="plugins/jquery-3.2.1.js"></script>
<script type="text/javascript" src="js/register.js"></script>
