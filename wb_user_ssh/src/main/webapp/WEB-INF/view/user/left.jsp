<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>左护法</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript" src="plugins/chart/Chart.min.js"></script>
<script type="text/javascript" src="plugins/jquery-3.2.1.js"></script>
<script type="text/javascript" src="js/register.js"></script>
<script type="text/javascript">
	$(function() {
		$("#btn-1")
				.on('click',function() {
							$("#div01").load('content');
							window.location.href = "${pageContext.request.contextPath}/userAction!paging"
						})
	})
</script>
</head>
<body>
	<div class="div2">
		<button class="button-1" id="btn-1">用户查询</button>
		<button class="button-1" id="btn-2">用户新增</button>
		<button class="button-1" id="btn-3">用户分析</button>
		<img src="./images/110.jpg" alt="小黄人" class="image-2">
		<p>当前登录用户</p>
	</div>
</body>
</html>