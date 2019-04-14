<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>format管理</title>

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
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://unpkg.com/bootstrap-table@1.13.5/dist/bootstrap-table.min.js"></script>
<!-- Latest compiled and minified Locales -->
<script
	src="https://unpkg.com/bootstrap-table@1.13.5/dist/locale/bootstrap-table-zh-CN.min.js"></script>
</head>

<body>
	<h1 align="center">规格管理</h1>
	<h2>商品名称：${product.name}</h2>
	<input id="productId" type="hidden" value="${product.id}">

	<!--工具-->
	<div id="toolbar" class="btn-group">
		<button id="btn-add" type="button" class="btn">
			<span aria-hidden="true" class="icon icon-plus-sign"></span>新增
		</button>
	</div>

	<div id="toolbar" class="btn-group">
		<button id="btn-batch-disable" type="button" class="btn">
			<span aria-hidden="true" class="icon icon-plus-sign"></span>批量下架
		</button>
	</div>
	<!--bootstrap-table表格-->
	<table id="data-table"></table>

	<!-- 新增的modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新增一个规格项</h4>
				</div>
				<div class="modal-body">

					<div class="form-group">
						<label for="txt_departmentname">名称</label> <input type="text"
							name="txt_departmentname" data-bind="value:Name"
							class="form-control" id="add-name" placeholder="名称">
					</div>
					<!-- 	<div class="form-group">
						<label for="txt_departmentname">图片url</label> <input type="text"
							name="txt_departmentname" data-bind="value:Name"
							class="form-control" id="add-imgUrl" placeholder="图片url">
					</div> -->
					<div class="form-group">
						<label for="txt_departmentname">价格</label> <input type="text"
							name="txt_departmentname" data-bind="value:Name"
							class="form-control" id="add-price" placeholder="价格">
					</div>
					<div class="form-group">
						<label for="txt_departmentname">闪购价格</label> <input type="text"
							name="txt_departmentname" data-bind="value:Name"
							class="form-control" id="add-flashPrice" placeholder="价格">
					</div>
					<!-- 	<div class="form-group">
						<label for="txt_departmentname">format位</label> <input type="text"
							name="txt_departmentname" data-bind="value:Name"
							class="form-control" id="add-formatId"
							placeholder="0首页轮播，1首页分类推荐">
					</div> -->
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
						</button>
						<button type="button" id="btn_submit" class="btn btn-primary"
							data-dismiss="modal">
							<span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>新增
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 编辑用的modal -->
	<div class="modal fade" id="editModal" tabindex="-1" role="dialog"
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
					<label for="txt_departmentname">规格id</label> <input type="text"
						data-bind="value:Name" class="form-control" id="edit-id"
						disabled="disabled">
				</div>
				<div class="form-group">
					<label for="txt_departmentname">名称</label> <input type="text"
						name="txt_departmentname" data-bind="value:Name"
						class="form-control" id="edit-name" placeholder="名称">
				</div>

				<!-- <div class="form-group">
					<label for="txt_departmentname">图片url</label> <input type="text"
						name="txt_departmentname" data-bind="value:Name"
						class="form-control" id="edit-imgUrl" placeholder="图片url">
				</div> -->
				<div class="form-group">
					<label for="txt_departmentname">价格</label> <input type="text"
						name="txt_departmentname" data-bind="value:Name"
						class="form-control" id="edit-price" placeholder="跳转页面">
				</div>
				<div class="form-group">
					<label for="txt_departmentname">闪购价格</label> <input type="text"
						name="txt_departmentname" data-bind="value:Name"
						class="form-control" id="edit-flashPrice" placeholder="价格">
				</div>
				<!-- <div class="form-group">
					<label for="txt_departmentname">format位</label> <input type="text"
						name="txt_departmentname" data-bind="value:Name"
						class="form-control" id="edit-formatId"
						placeholder="0首页轮播，1首页分类推荐">
				</div> -->
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
					</button>
					<button type="button" id="btn_edit_submit" class="btn btn-primary"
						data-dismiss="modal">
						<span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>提交变更
					</button>
				</div>
			</div>
		</div>
	</div>
	</div>

</body>

<script>
	var $table = $('#data-table');

	$(document).ready(function() {
		var productId = $('#productId').val();
		initTable(productId);
	});

	$(window).resize(function() {
		//防止表头与表格不对齐
		$table.bootstrapTable('resetView');
	});

	function initTable(productId) {
		$table.bootstrapTable({
			url : '/backend/admin/format/getAllByProductId/' + productId, //请求后台的URL（*）
			method : 'get', //请求方式（*）
			toolbar : '#toolbar', //工具按钮用哪个容器
			striped : true, //是否显示行间隔色
			cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
			pagination : true, //是否显示分页（*）
			sortOrder : "asc", //排序方式
			//queryParams : oTableInit.queryParams,//传递参数（*）
			sidePagination : "client", //分页方式：client客户端分页，server服务端分页（*）
			pageNumber : 1, //初始化加载第一页，默认第一页
			pageSize : 10, //每页的记录行数（*）
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
						title : 'id',
						align : 'center'
					},
					{
						field : 'name',
						title : '名称',
						align : 'center'
					}, /* {
																																											field : '
																																								imgUrl',
																																												title : '图片链接',
																																												align : 'center'
																																											}, */
					{
						field : 'price',
						title : '价格',
						align : 'center'
					},
					{
						field : 'flashPrice',
						title : '闪购价格',
						align : 'center'
					},/*  {
																																																		field : 'formatId',
																																																		title : 'format位',
																																																		align : 'center',
																																																		formatter : function(value, row, index) {
																																																			if (row.formatId) {
																																																				if (row.formatId == '0') {
																																																					return "首页轮播位";
																																																				} else if (row.formatId == '1') {
																																																					return "首页推荐分类栏";
																																																				} else {
																																																					return "错误数据";
																																																				}
																																																			}
																																																		}
																																																	},  */
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
							var html = '<a href="javascript:edit(' + id
									+ ')">编辑</a>';
							html += '　<a href="javascript:disable(' + id
									+ ')">下架</a>';
							html += '　<a href="javascript:reActive(' + id
									+ ')">上架</a>';
							return html;
						}
					}

			]
		});

	};

	/* 展开modal，新增一个父分类 */
	$('#btn-add').on("click", function() {
		$table.bootstrapTable('refresh');
		$("#myModal").modal().on("shown.bs.modal", function() {

		});
	});

	/* 提交 */
	$('#btn_submit').on("click", function() {
		var name = $('#add-name').val();
		var price = $('#add-price').val();
		var flashPrice = $('#add-flashPrice').val();
		var productId = $('#productId').val();
		$.ajax({
			url : "/backend/admin/format/add",
			type : "post",
			data : {
				name : name,
				price : price,
				productId : productId,
				flashPrice : flashPrice,
			},
			success : function(status) {
				initTable(productId)
				$table.bootstrapTable('refresh');
			}
		});
	});

	//编辑操作
	function edit(id) {
		var row = $table.bootstrapTable('getRowByUniqueId', id);
		$("#editModal").modal().on("shown.bs.modal", function() {
			$('#edit-name').val(row.name);
			$('#edit-price').val(row.price);
			$('#edit-id').val(row.id);
			$('#edit-flashPrice').val(row.flashPrice);

		});
	}

	/* 提交变更 */
	$('#btn_edit_submit').on("click", function() {
		var name = $('#edit-name').val();
		var price = $('#edit-price').val();
		var id = $('#edit-id').val();
		var productId = $('#productId').val();
		var flashPrice = $('#edit-flashPrice').val();
		$.ajax({
			url : "/backend/admin/format/update",
			type : "post",
			data : {
				id : id,
				name : name,
				price : price,
				flashPrice : flashPrice,
			},
			success : function(status) {
				initTable(productId)
				$table.bootstrapTable('refresh');
			}
		});
	});

	//下架操作
	function disable(id) {
		if (confirm("确定下架此规格吗？")) {
			$.ajax({
				url : "/backend/admin/format/disable", //url
				type : "post",
				data : {
					id : id,
					type : "single"
				},
				success : function(status) {
					$table.bootstrapTable('refresh');
				}
			});
		}
	}

	//上架操作
	function reActive(id) {
		if (confirm("确定上架此规格吗？")) {
			$.ajax({
				url : "/backend/admin/format/reActive", //url
				type : "post",
				data : {
					id : id,
					type : "single"
				},
				success : function(status) {
					$table.bootstrapTable('refresh');
				}
			});
		}
	}
</script>
</html>
