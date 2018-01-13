var right = $('#right');
var alertDiv = $("#alertDiv") ;
var alertText = $("#alertText") ;

var globeFinalPageNo = 1 ;
var globeFinalPageSize = 5 ;

function afterLoadLeft(){
	loadListPage(globeFinalPageNo,globeFinalPageSize,'UserAction!list');
	$('#userList').on('click',function(){
		loadListPage(globeFinalPageNo,globeFinalPageSize,'UserAction!list');
	});
		
	$('#userAdd').on('click',function(){
		loadAddPage('UserAction!showAddUserPage');
	});
		
	$('#userAnalyze').on('click',function(){
		loadAnalyzePage('UserAction!showAnalyzeUserPage');		
	});
}




function loadAnalyzePage(url){
	right.load(
		    url,
		    '',
		    function(){
		    	loadChart();
		    }
	);
}

function loadChart(){
	loadPieChart('UserAction!pieChart');
	loadBarChart('UserAction!barChart');
}

function loadBarChart(url){
	var jsonData = {
			type:"post",
			url:url,
			data:'',
			dataType : "json",
			success:function(barCharData){
				setBarChart(barCharData.data,barCharData.labels);
			},
			error:function(){
				showFail('加载 用户创建日期统计 条形图 失败！');
				//setPieChart([10,55,],["男","女"]);
			}
	};
	$.ajax(jsonData);
}


function loadPieChart(url){
	var jsonData = {
			type:"post",
			url:url,
			data:'',
			dataType : "json",
			success:function(pieCharData){
				setPieChart(pieCharData.data,pieCharData.labels);
			},
			error:function(){
				showFail('加载 用户性别分布统计 扇形图 失败！');
				//setPieChart([10,55,],["男","女"]);
			}
	};
	$.ajax(jsonData);
}


function setPieChart(data,labels){
	var config={
			type: 'pie',
	        data: {
	            datasets: [{
	                data:data,
	                backgroundColor: [
	                	'#3ec6fb',
	                	'#b73382a8',
	                ],
	                label: '用户'
	            }],
	            labels:labels
	        },
	        options: {
	            responsive: true,
	            title:{
	                display:true,
	                text:"用户性别分布统计"
	            }
	        }
	};
	var ctx = document.getElementById("pieChart").getContext("2d");
    window.myPie = new Chart(ctx, config);
}
function setBarChart(data,labels){
	   var config = {
         type: 'line',
         data: {
             labels: labels,
             datasets: [{
                 label: "用户",
                 backgroundColor: '#3ec6fb',
                 borderColor: '#3ec6fb',
                 data: data,
                 fill: false,
             }]
         },
         options: {
             responsive: true,
             title:{
                 display:true,
                 text:'用户创建日期统计'
             },
             tooltips: {
                 mode: 'index',
                 intersect: false,
             },
             hover: {
                 mode: 'nearest',
                 intersect: true
             },
             scales: {
                 xAxes: [{
                     display: true,
                     scaleLabel: {
                         display: true,
                         labelString: '日期'
                     }
                 }],
                 yAxes: [{
                     display: true,
                     scaleLabel: {
                         display: true,
                         labelString: '数量'
                     }
                 }]
             }
         }
     };
     var ctx = document.getElementById("barChart").getContext("2d");
     window.myLine = new Chart(ctx, config);	
}



function showFail(info){
	alertDiv.attr("class","alert alert-danger");
	alertText.text(info);
	alertDiv.fadeIn(1000,function(){
		$(this).fadeOut(6000);
	});
}
function showSuccess(info){
	alertDiv.attr("class","alert alert-success");
	alertText.text(info);
	alertDiv.fadeIn(1000,function(){
		$(this).fadeOut(6000);
	});
}

function addUserByAjax(name,email,sex,url){
	var jsonData = {
			type:"post",
			url:url,
			data:{
				"name":name,
				"email":email,
				"sex":sex
			},
			dataType : "json",
			success:function(data){
				if(data.isSuccess){
					showSuccess('添加成功！');
				}else{
					showFail('添加失败！');
				}
			},
			error:function(){
				showFail('添加失败！');
			}
	};
	$.ajax(jsonData);
}

function loadAddPage(url){
	right.load(
		    url,
		    '',
		    function(){
		    	$('#addUserBtn').on('click',function(){
		    		var name = 	document.addUserForm.formName.value;
		    		var email = document.addUserForm.formEmail.value;
		    		var sex  = 	document.addUserForm.formSex.value;
		    		name = $.trim(name);
		    		email = $.trim(email);
		    		
		    		var emaiReg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/; 
		    		
		    		if(name&&emaiReg.test(email)&&sex){
		    			addUserByAjax(name,email,sex,'UserAction!addUser');
		    		}else{
		    			showFail('您的填写的内容有误');
		    		}
		    	});
		    }
	);
}

function loadListPage(pageNo,pageSize,url){
	
	
		if(url=='UserAction!list'){
			right.load(
					url,
					{
						pageNo:pageNo,
						pageSize:pageSize
					},
					function(){
						$('#findBtn').on('click',function(){
							var findText = $('#findText').val();
							findText=$.trim(findText);
							if(findText){
								loadListPageByLikeName(globeFinalPageNo,globeFinalPageSize,'UserAction!findByLikeName',findText);
							}		
						});
					
						$('#findResetBtn').on('click',function(){
							loadListPage(globeFinalPageNo,globeFinalPageSize,'UserAction!list');
						});
					}
			);
		}
		if(url=='UserAction!findByLikeName'){
			var likeUserName = document.pagingForm.likeUserName.value;
			loadListPageByLikeName(pageNo,pageSize,url,likeUserName);
		}


}

function loadListPageByLikeName(pageNo,pageSize,url,likeUserName){
	
	right.load(
	    url,
		{
	    	likeUserName:likeUserName,
			pageNo:pageNo,
			pageSize:pageSize
		},
		function(){
			$('#findText').val(likeUserName);
			$('#findBtn').on('click',function(){
				var findText = $('#findText').val();
				findText=$.trim(findText);
				//var pageSize = document.pagingForm.pageSize.value;
				//var pageNo = document.pagingForm.pageNo.value;
				if(findText){
					loadListPageByLikeName(globeFinalPageNo,globeFinalPageSize,'UserAction!findByLikeName',findText);
				}		
			});
		
			$('#resetBtn').on('click',function(){
				loadListPage(globeFinalPageNo,globeFinalPageSize,'UserAction!list');
			});
		}
	);


}




