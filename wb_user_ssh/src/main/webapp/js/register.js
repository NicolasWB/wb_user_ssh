$(function() {

	var $div3 = $('#boss');

	$div3.find('#bo').on(
			'click',
			function() {
				var username = $div3.find('#name').val();
				var password = $div3.find('#password').val();
				var rePassword = $div3.find('#repassword').val();
				var email = $div3.find('#email').val();
				if (username == "") {
					alert("用户不允许为空！");
					return false;
				} else if (password == "") {
					alert("密码不允许为空！");
					return false;
				} else if (rePassword == "") {
					alert("重复密码不允许为空！");
					return false;
				} else if (email == "") {
					alert("电子邮件不允许为空！");
					return false;
				} else if (username.length < 6 || username.length > 20) {
					alert("用户名长度应在6到20个字符之间！");
					return false;
				} else if (username == password || username == rePassword) {
					alert("密码或重复密码不能和用户名相同！");
					return false;
				} else if (password.length < 6 || password.length > 20
						|| rePassword.length < 6 || rePassword.length > 20) {
					alert("密码或重复密码长度应在6到20个字符之间！");
					return false;
				} else if (password != rePassword) {
					alert("密码和重复密码不同，请重新输入！");
					return false;
				} else {
					alert("注册成功！");
					return true;
				}

			})
})

$(function() {
	$("#btn-2").on('click', function() {
		$("#div01").load('success');
	})
})

$(function() {
	$("#btn-3").on('click', function() {
		$("#div01").load('pie');
	})

})

function loadAnalyzePage(url) {
	right.load(url, '', function() {
		loadChart();
	});
}
function loadChart() {
	loadPieChart('UserAction!pieChart');
	/* loadBarChart('UserAction!barChart'); */
}
function loadPieChart(url) {
	var jsonData = {
		type : "post",
		url : url,
		data : '',
		dataType : "json",
		success : function(pieCharData) {
			setPieChart(pieCharData.data, pieCharData.labels);
		},
		error : function() {
			showFail('加载 用户性别分布统计 扇形图 失败！');
			// setPieChart([10,55,],["男","女"]);
		}
	};
	$.ajax(jsonData);
}

function setPieChart(data, labels) {
	var config = {
		type : 'pie',
		data : {
			datasets : [ {
				data : data,
				backgroundColor : [ '#3ec6fb', '#b73382a8', ],
				label : '用户'
			} ],
			labels : labels
		},
		options : {
			responsive : true,
			title : {
				display : true,
				text : "用户性别分布统计"
			}
		}
	};
	var ctx = document.getElementById("pieChart").getContext("2d");
	window.myPie = new Chart(ctx, config);
}
