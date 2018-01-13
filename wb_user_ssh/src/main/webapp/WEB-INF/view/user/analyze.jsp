<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div>
	<canvas id="canvas"></canvas>
</div>

<script type="text/javascript">
	// 横轴数据
	var getNames = function() {
		var createDate = $
		{
			data
		}
		;
		return createDate;
	};

	// 纵轴数据
	var getValues = function() {
		var value = $
		{
			lables
		}
		;
		return value;
	};

	// 曲线图数据
	var lineChartData = {
		labels : getNames(),
		datasets : [ {
			label : 'Dataset 1',
			backgroundColor : "rgba(220,220,220,0.5)",
			data : getValues()
		} ]

	};

	$(function() {
		// 生成曲线图
		var ctx = document.getElementById("canvas").getContext("2d");
		window.myBar = new Chart(ctx, {
			type : 'line',
			data : lineChartData,
			options : {
				responsive : true,
				legend : {
					position : 'top',
				},
				title : {
					display : true,
					text : '用户统计创建日期'
				}
			}
		});
	});
</script>