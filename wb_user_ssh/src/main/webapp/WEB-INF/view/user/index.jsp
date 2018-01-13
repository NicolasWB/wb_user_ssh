<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/paging" prefix="qsx"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户管理系统</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript" src="plugins/chart/Chart.min.js"></script>
<script type="text/javascript" src="plugins/jquery-3.2.1.js"></script>
<script type="text/javascript" src="js/register.js"></script>

<script type="text/javascript">
	function validate() {
		var page = document.getElementsByName("page")[0].value;

		if (page > <s:property value="#request.pageBean.totalPage"/>) {
			alert("你输入的页数大于最大页数，页面将跳转到首页！");

			window.document.location.href = "userAction!paging?page=1";

			return false;
		}

		return true;
	}
</script>
</head>
<body>
	<%@ include file="header.jsp"%>
	<%@ include file="left.jsp"%>
	<div class="div3" id="div01">
		<div class="div3-1">
			<label>用户名称： <input type="text">
				<button class="button3-1">查询</button>
			</label>
			<table>
				<thead>
					<tr>
						<th width=60px>编号</th>
						<th width=170px>用户名称</th>
						<th width=250px>邮箱</th>
						<th width=50px>性别</th>
						<th>创建时间</th>
						<th>更新时间</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<%-- <c:forEach items="#request.pageBean.list" var="temp">
						<tr>
							<td>${temp.id }</td>
							<td>${temp.username }</td>
							<td>${temp.email }</td>
							<td>${temp.sex }</td>
							<td>${temp.createDate }</td>
							<td>${temp.updateDate }</td>
							<td><a href="userAction!to_edit?user.id=${temp.id }">编辑</a>
								<a href="userAction!delete?user.id=${temp.id }">删除</a></td>
						</tr>
					</c:forEach> --%>
					<s:iterator value="#request.pageBean.list" id="user">

						<tr>
							<td><s:property value="#user.id" /></td>
							<td><s:property value="#user.username" /></td>
							<td><s:property value="#user.email" /></td>
							<td><s:property value="#user.sex" /></td>
							<td><s:property value="#user.createDate" /></td>
							<td><s:property value="#user.updateDate" /></td>
							<td><a href="userAction!to_edit?user.id=${user.id }">编辑</a>
								<a href="userAction!delete?user.id=${user.id }">删除</a></td>
						</tr>

					</s:iterator>

				</tbody>
			</table>
			<br>
			<div class="div007">
          <qsx:paging pageSize="5" totalCount="${pageBean.allRows }" page="${pageBean.currentPage }" url="userAction!paging?page=${pageBean.currentPage }"/>
		</div>
		</div>
	</div>
</body>

</html>