<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>${entityName}-后台管理</title>

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
	<h1 align="center">${entityName}—后台管理</h1>
	<div>
		手机号： <label> <input type="text" class="form-control"
			id="search-phone" placeholder="手机号"></label>
		<button id="searchByPhone" type="button" class="btn btn-info">
			查询</button>
	</div>
	<br>
	<br>
	<button id="getSale" type="button" class="btn btn-primary">查询优惠活动</button>
	<button id="addSale" type="button" class="btn btn-success">
		新增优惠活动</button>
	<br>
	<br>
	<!--工具-->

	<!--bootstrap-table表格-->
	<table id="data-table" data-unique-id="id"></table>

	<!--消费记录表格-->
	<table id="record-data-table" data-unique-id="id"></table>

	<!--优惠表格-->
	<table id="sale-data-table" data-unique-id="id"></table>

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

	<!-- 优惠用的modal -->
	<div class="modal fade" id="saleModal" tabindex="-1" role="dialog"
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
						<label for="txt_departmentname">名称</label> <input type="text"
							class="form-control" id="sale-name" placeholder="输入优惠活动">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
					</button>
					<button type="button" id="btn_sale_submit" class="btn btn-primary"
						data-dismiss="modal">
						<span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>确认
					</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 消费用的modal -->

	<!-- 积分用的modal -->
	<div class="modal fade" id="pointsModal" tabindex="-1" role="dialog"
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
							class="form-control" id="points-phone" placeholder="手机号">
					</div>
					<div class="form-group">
						<label for="txt_departmentname">此次消费积分</label> <input type="text"
							class="form-control" id="points-points" placeholder="积分">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
					</button>
					<button type="button" id="btn_points_submit" class="btn btn-primary"
						data-dismiss="modal">
						<span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>确认
					</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 积分用的modal -->

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
			columns : [
					{
						checkbox : true
					},
					{
						field : 'id',
						title : '序号',
						align : 'center'
					},
					{
						field : 'phone',
						title : '手机号',
						align : 'center'
					},
					{
						field : 'wechatId',
						title : '微信号',
						align : 'center'
					},
					{
						field : 'balance',
						title : '余额',
						align : 'center'
					},
					{
						field : 'points',
						title : '积分',
						align : 'center'
					},
					{
						title : '操作',
						field : 'id',
						formatter : function(id) {
							var html = '<a href="javascript:topup(' + id
									+ ')">充值</a>';
							html += '　<a href="javascript:pay(' + id
									+ ')">消费</a>';
							html += '　<a href="javascript:updatePoints(' + id
									+ ')">消费积分</a>';
							html += '　<a href="javascript:initRecordTable('
									+ phone + ')">查看记录</a>';
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
				initTable(phone);
				$record_table.bootstrapTable('destroy');
				initRecordTable(phone)
			}
		});

	});

	//消费
	function pay(id) {
		var row = $table.bootstrapTable('getRowByUniqueId', id);
		//$table.bootstrapTable('refresh');
		$("#payModal").modal().on("shown.bs.modal", function() {
			$('#pay-phone').val(row.phone);
		});
	}

	//消费操作
	$('#btn_pay_submit').on("click", function() {
		var phone = $("#pay-phone").val();
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
				initTable(phone);
				$record_table.bootstrapTable('destroy');
				initRecordTable(phone)
			}
		});
	});

	$(document).ready();

	/* 查询 */
	$('#searchByPhone').on("click", function() {
		var phone = $("#search-phone").val();
		$table.bootstrapTable('destroy');
		initTable(phone);
		$table.bootstrapTable('refresh');
	});

	var $record_table = $('#record-data-table');

	$(window).resize(function() {
		//防止表头与表格不对齐
		$record_table.bootstrapTable('resetView');
	});

	//根据子分类id加载所有商品然后进行操作
	function initRecordTable(phone) {
		$record_table.bootstrapTable('destroy');
		$record_table
				.bootstrapTable({
					url : '/backend/entityUser/getTranscationByPhoneAndEntityId?entityId='
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
					columns : [
							{
								checkbox : true
							},
							{
								field : 'id',
								title : '序号',
								align : 'center'
							},
							{
								field : 'item',
								title : '项目',
								align : 'center',
								formatter : function(value, row, index) {
									var type = row.type;
									if (type == 'topup') {
										return '充值';
									} else {
										return row.item;
									}
								}
							},
							{
								field : 'amount',
								title : '金额',
								align : 'center'
							},
							{
								field : 'occur',
								title : '时间',
								align : 'center',
								formatter : function(value, row, index) {
									var unixtimestamp = new Date((row.occur));
									var year = 1900 + unixtimestamp.getYear();
									var month = "0"
											+ (unixtimestamp.getMonth() + 1);
									var date = "0" + unixtimestamp.getDate();
									var hour = "0" + unixtimestamp.getHours();
									var minute = "0"
											+ unixtimestamp.getMinutes();
									var second = "0"
											+ unixtimestamp.getSeconds();
									return year
											+ "-"
											+ month.substring(month.length - 2,
													month.length)
											+ "-"
											+ date.substring(date.length - 2,
													date.length)
											+ " "
											+ hour.substring(hour.length - 2,
													hour.length)
											+ ":"
											+ minute.substring(
													minute.length - 2,
													minute.length)
											+ ":"
											+ second.substring(
													second.length - 2,
													second.length);
								}
							} ]
				});
	}

	var $sale_table = $('#sale-data-table');

	$(window).resize(function() {
		//防止表头与表格不对齐
		$sale_table.bootstrapTable('resetView');
	});

	/* 查询 */
	$('#getSale').on("click", function() {
		$sale_table.bootstrapTable('destroy');
		initSaleTable();
		$sale_table.bootstrapTable('refresh');
	});

	function initSaleTable() {
		$sale_table.bootstrapTable('destroy');
		$sale_table.bootstrapTable({
			url : '/backend/entity/getSaleAllByEntityId?entityId=' + entityId,
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
			columns : [
					{
						checkbox : true
					},
					{
						field : 'id',
						title : '序号',
						align : 'center'
					},
					{
						field : 'name',
						title : '名称',
						align : 'center'
					},
					{
						field : 'state',
						title : '状态',
						align : 'center',
						formatter : function(value, row, index) {
							if (row.state) {
								if (row.state == '0') {
									return "已下架";
								} else if (row.state == '1') {
									return "已上架";
								} else {
									return "错误数据";
								}
							}
						}
					},
					{
						title : '操作',
						field : 'id',
						formatter : function(id) {
							var html = '<a href="javascript:reactive(' + id
									+ ')">上架</a>';
							html += '　<a href="javascript:disable(' + id
									+ ')">下架</a>';
							return html;
						}
					} ]
		});
	}

	//下架操作
	function disable(id) {
		if (confirm("确定下架此分类吗？")) {
			$.ajax({
				url : "/backend/entity/sale/disable?id=" + id, //url
				type : "get",
				success : function(status) {
					$table.bootstrapTable('refresh');
					initSaleTable()
				}
			});
		}
	}

	//上架操作
	function reactive(id) {
		if (confirm("确定上架此分类吗？")) {
			$.ajax({
				url : "/backend/entity/sale/reActive?id=" + id, //url
				type : "get",
				success : function(status) {
					$table.bootstrapTable('refresh');
					initSaleTable()
				}
			});
		}
	}

	// 新增优惠活动
	$('#addSale').on("click", function() {
		$("#saleModal").modal().on("shown.bs.modal", function() {
		});
	});

	//消费操作
	$('#btn_sale_submit').on("click", function() {
		var name = $("#sale-name").val();
		$.ajax({
			url : "/backend/entity/addSale",
			type : "post",
			data : {
				name : name,
				entityId : entityId,
			},
			success : function(status) {
				$sale_table.bootstrapTable('destroy');
				initSaleTable()
			}
		});
	});

	//更改积分
	function updatePoints(id) {
		var row = $table.bootstrapTable('getRowByUniqueId', id);
		$("#pointsModal").modal().on("shown.bs.modal", function() {
			$('#points-phone').val(row.phone);
		});
	}

	//更改积分
	$('#btn_points_submit').on("click", function() {
		var phone = $("#points-phone").val();
		var points = $("#points-points").val();
		$.ajax({
			url : "/backend/entityUser/updatePoints",
			type : "post",
			data : {
				phone : phone,
				points : points,
				entityId : entityId,
			},
			success : function(status) {
				$table.bootstrapTable('destroy');
				initTable(phone);
				$record_table.bootstrapTable('destroy');
				initRecordTable(phone)
			}
		});
	});
</script>
</html>
