<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>welcome</title>

<!--引入JavaScript-->
<%-- <script
	src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
 --%>

</head>
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://unpkg.com/bootstrap-table@1.13.5/dist/bootstrap-table.min.css">
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap-select.min.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap-select.min.js"></script>

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://unpkg.com/bootstrap-table@1.13.5/dist/bootstrap-table.min.js"></script>
<!-- Latest compiled and minified Locales -->
<script
	src="https://unpkg.com/bootstrap-table@1.13.5/dist/locale/bootstrap-table-zh-CN.min.js"></script>
</head>
<body>

	<h1 align="center">用户管理</h1>
	<!-- 查询 -->
	<label for="txt_departmentname">手机号</label>
	<input type="text" class="form-control" id="search-phone"
		placeholder="订单号">
	<button id="searchByPhone" type="button" class="btn">
		<span aria-hidden="true" class="icon icon-plus-sign"></span>查询
	</button>
	<br>
	<br>
	<br>
	<br>
	<!--工具-->

	<!--bootstrap-table表格-->
	<table id="data-table" data-unique-id="orderId"></table>

	<!-- 充值用的modal -->
	<div class="modal fade" id="topupModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">充值</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="txt_departmentname">手机号</label> <input type="text"
							class="form-control" id="topup-phone" placeholder="手机号">
					</div>
					<div class="form-group">
						<label for="txt_departmentname">充值金额</label> <input type="text"
							class="form-control" id="topup-amount" placeholder="充值金额">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
					</button>
					<button type="button" id="btn_topup_submit" class="btn btn-primary"
						data-dismiss="modal">
						<span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>进行充值
					</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 充值用的modal -->

	<!-- 消费用的modal -->
	<div class="modal fade" id="payModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">编辑</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="txt_departmentname">手机号</label> <input type="text"
							class="form-control" id="pay-phone" placeholder="订单号"
							disabled="disabled">
					</div>
					<div class="form-group">
						<label for="txt_departmentname">消费项目</label> <input type="text"
							class="form-control" id="pay-item" placeholder="消费项目">
					</div>
					<div class="form-group">
						<label for="txt_departmentname">消费金额</label> <input type="text"
							class="form-control" id="pay-amount" placeholder="消费金额">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
					</button>
					<button type="button" id="btn_pay_submit" class="btn btn-primary"
						data-dismiss="modal">
						<span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>确认消费
					</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 消费用的modal -->

</body>

<script type="text/javascript">

	var $table = $('#data-table');

	$(window).resize(function() {
		//防止表头与表格不对齐
		$table.bootstrapTable('resetView');
	});

	var entityId = '${entityId}';

	//根据子分类id加载所有商品然后进行操作
	function initTable(phone) {
		$table.bootstrapTable({
			url : '/backend/entityUser/getUserByPhoneAndEntityId?entityId='
					+ entityId + '&phone=' + phone,
			method : 'get', //请求方式（*）
			toolbar : '#toolbar', //工具按钮用哪个容器
			striped : true, //是否显示行间隔色
			cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
			pagination : true, //是否显示分页（*）
			//sortOrder : "asc", //排序方式
			//queryParams : oTableInit.queryParams,//传递参数（*）
			sidePagination : "client", //分页方式：client客户端分页，server服务端分页（*）
			pageNumber : 1, //初始化加载第一页，默认第一页
			pageSize : 5, //每页的记录行数（*）
			pageList : [ 10, 25, 50, 100 ], //可供选择的每页的行数（*）
			search : true, //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
			showColumns : true, //是否显示所有的列
			showRefresh : true, //是否显示刷新按钮
			minimumCountColumns : 2, //最少允许的列数
			// clickToSelect: true,                //是否启用点击选中行
			height : 500, //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
			uniqueId : "id", //每一行的唯一标识，一般为主键列
			columns : [ {
				checkbox : true
			}, {
				field : 'id',
				title : '序号',
				align : 'center'
			}, {
				field : 'phone',
				title : '手机号',
				align : 'center'
			}, {
				field : 'wechatId',
				title : '微信号',
				align : 'center'
			}, {
				field : 'balance',
				title : '余额',
				align : 'center'
			}, {
				field : 'points',
				title : '积分',
				align : 'center'
			}, {
				title : '操作',
				field : 'id',
				formatter : function(id) {
					var html = '<a href="javascript:topup(' + id + ')">充值</a>';
					html += '　<a href="javascript:pay(' + id + ')">消费</a>';
					return html;
				}
			} ]
		});
	}
	//充值
	function topup(id) {
		var row = $table.bootstrapTable('getRowByUniqueId', id);
		//$table.bootstrapTable('refresh');
		$("#topupModal").modal().on("shown.bs.modal", function() {
			$('#topup-phone').val(row.phone);
		});
	}

	/* 提交充值信息 */
	$('#btn_topup_submit').on("click", function() {
		var phone = $("#topup-phone").val();
		var amount = $("#topup-amount").val();
		$.ajax({
			url : "/backend/entityUser/topup",
			type : "post",
			data : {
				phone : phone,
				amount : amount,
				entityId : entityId,
			},
			success : function(status) {
				$table.bootstrapTable('destroy');
				initTable(orderId);
			}
		});
	});

	//充值
	function payOrder(id) {
		var row = $table.bootstrapTable('getRowByUniqueId', phone);
		//$table.bootstrapTable('refresh');
		$("#payModal").modal().on("shown.bs.modal", function() {
			$('#pay-phone').val(row.phone);
		});
	}

	//消费操作
		$('#btn_pay_submit').on("click", function() {
		var row = $table.bootstrapTable('getRowByUniqueId', id);
		var phone = row.phone;
		var amount = $("#pay-amount").val();
		var item = $("#pay-item").val();
		$.ajax({
			url : "/backend/entityUser/pay",
			type : "post",
			data : {
				phone : phone,
				amount : amount,
				item : item,
				entityId : entityId,
			},
			success : function(status) {
				$table.bootstrapTable('destroy');
				initTable(orderId);
			}
		});
	});

	$(document).ready();

	/* 查询订单号 */
	$('#searchByPhone').on("click", function() {
		var phone = $("#search-phone").val();
		$table.bootstrapTable('destroy');
		initTable(phone);
		$table.bootstrapTable('refresh');
	});
</script>
</html>
