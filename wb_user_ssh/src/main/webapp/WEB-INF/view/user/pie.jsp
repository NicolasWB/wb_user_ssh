<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div>
	<canvas id="chart-pie" />
</div>
<script type="text/javascript">
	// 获取横轴数据
	var getNames = function() {
		var name = [ "男", "女" ];
		return name;
	};

	// 获取纵轴数据
	var getValues = function() {
		var value = [ 23, 12 ];
		return value;

	};

	// 获取颜色数据
	var getColors = function() {
		var value = [ '#3ec6fb', '#3ec6fb' ];
		return value;
	};

	// 饼状图参数
	var config = {
		type : 'pie',
		data : {
			datasets : [ {
				data : getValues(),
				backgroundColor : getColors(),
			} ],
			labels : getNames()
		},
		options : {
			responsive : true
		}
	};

	$(function() {
		// 生成饼状图
		var ctx = document.getElementById("chart-pie").getContext("2d");
		window.myPie = new Chart(ctx, config);
	});
</script>

