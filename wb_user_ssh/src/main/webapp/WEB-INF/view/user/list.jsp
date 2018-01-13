<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="css/style.css">
<div class="div3" id="div001">
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
				<c:forEach items="${list }" var="temp">
					<tr>
						<td>${temp.id }</td>
						<td>${temp.username }</td>
						<td>${temp.email }</td>
						<td>${temp.sex }</td>
						<td>${temp.createDate }</td>
						<td>${temp.updateDate }</td>
						<td><a href="userAction!to_edit?user.id=${temp.id }">编辑</a> <a
							href="userAction!delete?user.id=${temp.id }">删除</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>