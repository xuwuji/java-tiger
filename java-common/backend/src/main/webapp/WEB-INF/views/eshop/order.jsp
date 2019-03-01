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

	<h1 align="center">订单管理</h1>
	<!-- 查询 -->
	<label for="txt_departmentname">订单号</label>
	<input type="text" class="form-control" id="search-orderId"
		placeholder="备注">
	<button id="searchByOrderId" type="button" class="btn">
		<span aria-hidden="true" class="icon icon-plus-sign"></span>查询订单号
	</button>
	<br>
	<br>
	<br>
	<br>
	<div class="btn-group">
		<button id="btn-add" type="button" class="btn">
			<span aria-hidden="true" class="icon icon-plus-sign"></span>新增
		</button>
	</div>

	<div class="btn-group">
		<button id="btn-batch-delete" type="button" class="btn">
			<span aria-hidden="true" class="icon icon-plus-sign"></span>批量删除
		</button>
	</div>
	<div class="btn-group">
		<button id="btn-batch-delete" type="button" class="btn">
			<span aria-hidden="true" class="icon icon-plus-sign"></span>批量上架
		</button>
	</div>

	<!--工具-->

	<!--bootstrap-table表格-->
	<table id="data-table" data-unique-id="orderId"></table>

	<!-- 发货用的modal -->
	<div class="modal fade" id="deliverModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">发货</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="txt_departmentname">订单号</label> <input type="text"
							class="form-control" id="deliver-orderId" placeholder="订单号">
					</div>
					<div class="form-group">
						<label for="txt_departmentname">物流公司</label> <input type="text"
							class="form-control" id="deliver-logisticsName"
							placeholder="物流公司">
					</div>
					<div class="form-group">
						<label for="txt_departmentname">物流单号</label> <input type="text"
							class="form-control" id="deliver-logisticsId" placeholder="物流单号">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
					</button>
					<button type="button" id="btn_deliver_submit"
						class="btn btn-primary" data-dismiss="modal">
						<span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>更新物流信息
					</button>
				</div>
			</div>
		</div>
	</div>
	</div>

	<!-- 编辑备注用的modal -->
	<div class="modal fade" id="memoModal" tabindex="-1" role="dialog"
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
						<label for="txt_departmentname">订单号</label> <input type="text"
							class="form-control" id="edit-orderId" placeholder="订单号">
					</div>
					<div class="form-group">
						<label for="txt_departmentname">备注</label> <input type="text"
							class="form-control" id="edit-memo" placeholder="备注">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
					</button>
					<button type="button" id="btn_memo_submit" class="btn btn-primary"
						data-dismiss="modal">
						<span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>添加备注
					</button>
				</div>
			</div>
		</div>
	</div>


</body>

<script>
	var $table = $('#data-table');

	$(window).resize(function() {
		//防止表头与表格不对齐
		$table.bootstrapTable('resetView');
	});

	//根据子分类id加载所有商品然后进行操作
	function initTable(orderId) {
		$table.bootstrapTable({
			url : '/backend/order/getOrderInfoById/' + orderId,
			method : 'get', //请求方式（*）
			toolbar : '#toolbar', //工具按钮用哪个容器
			striped : true, //是否显示行间隔色
			cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
			pagination : true, //是否显示分页（*）
			sortOrder : "asc", //排序方式
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
			uniqueId : "orderId", //每一行的唯一标识，一般为主键列
			columns : [
					{
						checkbox : true
					},
					{
						field : 'orderId',
						title : '订单号',
						align : 'center'
					},
					{
						field : 'wechatId',
						title : '微信号',
						align : 'center'
					},
					{
						field : 'time',
						title : '下单时间',
						align : 'center'
					},
					{
						field : 'status',
						title : '状态',
						align : 'center'
					},
					{
						field : 'phoneNum',
						title : '收件人手机号',
						align : 'center'
					},
					{
						field : 'amount',
						title : '订单总额',
						align : 'center'
					},
					{
						field : 'totalCount',
						title : '订单商品总件数',
						align : 'center'
					},
					{
						field : 'recieverName',
						title : '收货人姓名',
						align : 'center'
					},
					{
						field : 'address',
						title : '收货地址',
						align : 'center'
					},
					{
						field : 'openId',
						title : '下单人openid',
						align : 'center'
					},
					{
						field : 'logisticsName',
						title : '物流公司',
						align : 'center'
					},
					{
						field : 'logisticsId',
						title : '物流单号',
						align : 'center'
					},
					{
						field : 'memo',
						title : '备注',
						align : 'center'
					},
					{
						title : '操作',
						field : 'orderId',
						formatter : function(orderId) {
							var html = '<a href="javascript:editMemo('
									+ orderId + ')">编辑备注</a>';
							html += '　<a href="javascript:deliverOrder('
									+ orderId + ')">发货</a>';
							html += '　<a href="javascript:finishOrder('
									+ orderId + ')">已完成</a>';
							return html;
						}
					}

			]
		});
	}

	/* 展开modal，新增一个分类 */
	$('#btn-add').on("click", function() {
		$table.bootstrapTable('refresh');
		$("#myModal").modal().on("shown.bs.modal", function() {

		});
	});

	/* 提交新建的 */
	$('#btn_submit').on("click", function() {
		var parentCategoryId = $("#selectpicker-parent").val();
		var categoryId = $("#selectpicker-child").val();
		var name = $('#productName').val();
		var desc = $('#productDesc').val();
		var price = $('#productPrice').val();
		var inventory = $('#productInventory').val();
		var salesCount = $('#productSalesCount').val();
		var mainImgUrl = $('#productMainImgUrl').val();
		var parentCategoryId = $('#productParentCategoryId').val();
		var categoryId = $('#productCategoryId').val();
		var brandNameCN = $('#productBrandNameCN').val();
		var brandNamEN = $('#productBrandNamEN').val();
		$.ajax({
			url : "/backend/admin/product/add",
			type : "post",
			data : {
				name : name,
				desc : desc,
				price : price,
				inventory : inventory,
				salesCount : salesCount,
				mainImgUrl : mainImgUrl,
				parentCategoryId : parentCategoryId,
				categoryId : categoryId,
				brandNameCN : brandNameCN,
				brandNamEN : brandNamEN,
			},
			success : function(status) {
				$table.bootstrapTable('destroy');
				initTable(categoryId);
			}
		});
	});

	//编辑备注
	function editMemo(orderId) {
		var row = $table.bootstrapTable('getRowByUniqueId', orderId);
		$("#memoModal").modal().on("shown.bs.modal", function() {
			$('#edit-memo').val(row.memo);
			$('#edit-orderId').val(row.orderId);
		});
	}

	/* 提交memo变更 */
	$('#btn_memo_submit').on("click", function() {
		var orderId = $('#edit-orderId').val();
		var memo = $('#edit-memo').val();
		$.ajax({
			url : "/backend/admin/order/deliver",
			type : "post",
			data : {
				orderId : orderId,
				memo : memo
			},
			success : function(status) {
				$table.bootstrapTable('destroy');
				initTable(parentCategoryId);
			}
		});
	});

	//发货操作
	function deliverOrder(orderId) {
		var row = $table.bootstrapTable('getRowByUniqueId', orderId);
		//$table.bootstrapTable('refresh');
		$("#deliverModal").modal().on("shown.bs.modal", function() {
			$('#deliver-orderId').val(row.orderId);
		});
	}

	/* 提交发货信息 */
	$('#btn_deliver_submit').on("click", function() {
		var orderId = $("#deliver-orderId").val();
		var logisticsName = $("#deliver-logisticsName").val();
		var logisticsId = $("#deliver-logisticsId").val();
		$.ajax({
			url : "/backend/admin/order/deliver",
			type : "post",
			data : {
				orderId : orderId,
				logisticsName : logisticsName,
				logisticsId : logisticsId,
			},
			success : function(status) {
				$table.bootstrapTable('destroy');
				initTable(parentCategoryId);
			}
		});
	});

	//完成操作
	function finishOrder(orderId) {
		if (confirm("确定此订单已完成了吗？")) {
			$.ajax({
				url : "/backend/admin/order/finish",
				type : "post",
				data : {
					orderId : orderId,
					type : "single"
				},
				success : function(status) {
					alert(status);
					$table.bootstrapTable('destroy');
					initTable(orderId);
				}
			});
		}
	}

	/* 批量上架 */
	$('#btn-batch-reactive').on("click", function() {
		var rows = $table.bootstrapTable('getSelections');
		var categoryId = $("#selectpicker-child").val();
		var ids = '';
		for (var i = 0; i < rows.length; i++) {
			ids += rows[i].id + ',';
		}
		ids = ids.substring(0, ids.length - 1);
		$.ajax({
			url : "/backend/admin/product/reActive", //url
			type : "post",
			data : {
				id : ids,
				type : "batch"
			},
			success : function(status) {
				$table.bootstrapTable('destroy');
				initTable(parentCategoryId);
				console.log(parentCategoryId);
			}
		});
	});

	/* 批量删除 */
	$('#btn-batch-delete').on("click", function() {
		var rows = $table.bootstrapTable('getSelections');
		var categoryId = $("#selectpicker-child").val();
		var ids = '';
		for (var i = 0; i < rows.length; i++) {
			ids += rows[i].id + ',';
		}
		ids = ids.substring(0, ids.length - 1);
		$.ajax({
			url : "/backend/admin/product/delete", //url
			type : "post",
			data : {
				id : ids,
				type : "batch"
			},
			success : function(status) {
				alert("ds");
				$table.bootstrapTable('destroy');
				initTable(parentCategoryId);
				console.log(parentCategoryId);
			}
		});
	});

	$(document).ready();

	/* 查询订单号 */
	$('#searchByOrderId').on("click", function() {
		var orderId = $("#search-orderId").val();
		console.log(orderId);
		//$table.bootstrapTable('destroy');
		initTable(orderId);
	});
</script>
</html>
