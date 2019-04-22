<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>促销管理</title>

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
	<h1 align="center">促销管理</h1>
	<h4 align="left">场景：brand-品牌促销，category-类别促销,shop-全场促销</h4>
	<h4 align="left">促销种类：money-满减，gift-送礼品</h4>
	<h4 align="left">促销规则：amount-满金额，total-满数量</h4>
	<!--工具-->
	<div id="toolbar" class="btn-group">
		<button id="btn-add" type="button" class="btn">
			<span aria-hidden="true" class="icon icon-plus-sign"></span>新增
		</button>
	</div>

	<!-- <div id="toolbar" class="btn-group">
		<button id="btn-batch-disable" type="button" class="btn">
			<span aria-hidden="true" class="icon icon-plus-sign"></span>批量下架
		</button>
	</div> -->
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
					<h4 class="modal-title" id="myModalLabel">新增一个促销项</h4>
				</div>
				<div class="modal-body">

					<div class="form-group">
						<label for="txt_departmentname">促销名称</label> <input type="text"
							name="txt_departmentname" data-bind="value:Name"
							class="form-control" id="add-name" placeholder="促销名称">
					</div>
					<div class="form-group">
						<label for="txt_departmentname">针对场景</label> <input type="text"
							name="txt_departmentname" data-bind="value:Name"
							class="form-control" id="add-target"
							placeholder="brand-品牌促销，category-类别促销,shop-全场促销">
					</div>
					<div class="form-group">
						<label for="txt_departmentname">促销种类</label> <input type="text"
							name="txt_departmentname" data-bind="value:Name"
							class="form-control" id="add-type"
							placeholder="money-满减，gift-送礼品">
					</div>
					<div class="form-group">
						<label for="txt_departmentname">促销规则</label> <input type="text"
							name="txt_departmentname" data-bind="value:Name"
							class="form-control" id="add-rule"
							placeholder="amount-满金额，total-满数量">
					</div>
					<div class="form-group">
						<label for="txt_departmentname">满（金额）</label> <input type="text"
							name="txt_departmentname" data-bind="value:Name"
							class="form-control" id="add-amount"
							placeholder="满减-满多少可以减；赠礼-满多少可以送">
					</div>
					<div class="form-group">
						<label for="txt_departmentname">满（数量）</label> <input type="text"
							name="txt_departmentname" data-bind="value:Name"
							class="form-control" id="add-total"
							placeholder="满减-满多少可以减；赠礼-满多少可以送">
					</div>
					<div class="form-group">
						<label for="txt_departmentname">减（金额）</label> <input type="text"
							name="txt_departmentname" data-bind="value:Name"
							class="form-control" id="add-reduction" placeholder="满减类别才需要填">
					</div>
					<div class="form-group">
						<label for="txt_departmentname">送的礼品</label> <input type="text"
							name="txt_departmentname" data-bind="value:Name"
							class="form-control" id="add-gift" placeholder="送礼品类别才需要填">
					</div>
					<div class="form-group">
						<label for="txt_departmentname">品牌id</label> <input type="text"
							name="txt_departmentname" data-bind="value:Name"
							class="form-control" id="add-brandId" placeholder="品牌id">
					</div>
					<div class="form-group">
						<label for="txt_departmentname">商品类别id</label> <input type="text"
							name="txt_departmentname" data-bind="value:Name"
							class="form-control" id="add-categoryId" placeholder="商品类别id">
					</div>
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
					<label for="txt_departmentname">促销id</label> <input type="text"
						data-bind="value:Name" class="form-control" id="edit-id"
						disabled="disabled">
				</div>
				<div class="form-group">
					<label for="txt_departmentname">促销名称</label> <input type="text"
						name="txt_departmentname" data-bind="value:Name"
						class="form-control" id="edit-name" placeholder="促销名称">
				</div>
				<div class="form-group">
					<select class="targetPicker">
						<label for="txt_departmentname">针对场景</label>
						<input type="text" name="txt_departmentname"
						data-bind="value:Name" class="form-control" id="edit-target"
						placeholder="brand-品牌促销，category-类别促销,shop-全场促销">
					</select>
				</div>
				<div class="form-group">
					<label for="txt_departmentname">促销种类</label> <input type="text"
						name="txt_departmentname" data-bind="value:Name"
						class="form-control" id="edit-type"
						placeholder="money-满减，gift-送礼品">
				</div>
				<div class="form-group">
					<label for="txt_departmentname">促销规则</label> <input type="text"
						name="txt_departmentname" data-bind="value:Name"
						class="form-control" id="edit-rule"
						placeholder="amount-满金额，total-满数量">
				</div>
				<div class="form-group">
					<label for="txt_departmentname">满（金额）</label> <input type="text"
						name="txt_departmentname" data-bind="value:Name"
						class="form-control" id="edit-amount" placeholder="满减类别才需要填">
				</div>
				<div class="form-group">
					<label for="txt_departmentname">满（数量）</label> <input type="text"
						name="txt_departmentname" data-bind="value:Name"
						class="form-control" id="edit-total" placeholder="满减类别才需要填">
				</div>
				<div class="form-group">
					<label for="txt_departmentname">减</label> <input type="text"
						name="txt_departmentname" data-bind="value:Name"
						class="form-control" id="edit-reduction" placeholder="满减类别才需要填">
				</div>
				<div class="form-group">
					<label for="txt_departmentname">送的礼品</label> <input type="text"
						name="txt_departmentname" data-bind="value:Name"
						class="form-control" id="edit-gift" placeholder="送礼品类别才需要填">
				</div>
				<div class="form-group">
					<label for="txt_departmentname">品牌id</label> <input type="text"
						name="txt_departmentname" data-bind="value:Name"
						class="form-control" id="edit-brandId" placeholder="品牌id">
				</div>
				<div class="form-group">
					<label for="txt_departmentname">商品类别id</label> <input type="text"
						name="txt_departmentname" data-bind="value:Name"
						class="form-control" id="edit-categoryId" placeholder="商品类别id">
				</div>
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

	$(window).resize(function() {
		//防止表头与表格不对齐
		$table.bootstrapTable('resetView');
	});

	$table.bootstrapTable({
		url : '/backend/admin/promotion/getAll', //请求后台的URL（*）
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
		columns : [ {
			checkbox : true
		}, {
			field : 'id',
			title : 'id',
			align : 'center'
		}, {
			field : 'name',
			title : '促销名',
			align : 'center'
		}, {
			field : 'target',
			title : '场景',
			align : 'center',
			formatter : function(value, row, index) {
				if (row.target) {
					if (row.target == 'brand') {
						return "品牌活动";
					} else if (row.target == 'category') {
						return "商品种类活动";
					} else if (row.target == 'shop') {
						return "全场活动";
					} else {
						return "错误数据";
					}
				}
			}
		}, {
			field : 'type',
			title : '促销种类',
			align : 'center',
			formatter : function(value, row, index) {
				if (row.type) {
					if (row.type == 'money') {
						return "满减";
					} else if (row.type == 'gift') {
						return "";
					} else {
						return "错误数据";
					}
				}
			}
		}, {
			field : 'rule',
			title : '促销规则',
			align : 'center',
			formatter : function(value, row, index) {
				if (row.rule) {
					if (row.rule == 'amount') {
						return "满金额";
					} else if (row.rule == 'total') {
						return "满数量";
					} else {
						return "错误数据";
					}
				}
			}
		}, {
			field : 'amount',
			title : '每满（金额）',
			align : 'center'
		}, {
			field : 'total',
			title : '每满（数量）',
			align : 'center'
		}, {
			field : 'reduction',
			title : '减',
			align : 'center',
		}, {
			field : 'gift',
			title : '礼品',
			align : 'center'
		}, {
			field : 'brandId',
			title : '品牌id',
			align : 'center'
		}, {
			field : 'categoryId',
			title : '商品种类id',
			align : 'center'
		}, {
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
		}, {
			title : '操作',
			field : 'id',
			formatter : function(id) {
				var html = '<a href="javascript:edit(' + id + ')">编辑</a>';
				html += '　<a href="javascript:disable(' + id + ')">下架</a>';
				html += '　<a href="javascript:reActive(' + id + ')">上架</a>';
				return html;
			}
		}

		]
	});

	/* 展开modal，新增一个父分类 */
	$('#btn-add').on("click", function() {
		$table.bootstrapTable('refresh');
		$("#myModal").modal().on("shown.bs.modal", function() {

		});
	});

	/* 提交 */
	$('#btn_submit').on("click", function() {
		var name = $('#add-name').val();
		var type = $('#add-type').val();
		var target = $('#add-target').val();
		var rule = $('#add-rule').val();
		var gift = $('#add-gift').val();
		var total = $('#add-total').val();
		var brandId = $('#add-brandId').val();
		var categoryId = $('#add-categoryId').val();
		console.log(categoryId);
		var amount = $('#add-amount').val();
		var reduction = $('#add-reduction').val();
		$.ajax({
			url : "/backend/admin/promotion/add",
			type : "post",
			data : {
				name : name,
				type : type,
				target : target,
				brandId : brandId,
				gift : gift,
				categoryId : categoryId,
				amount : amount,
				reduction : reduction,
				rule : rule,
				total : total,
			},
			success : function(status) {
				$table.bootstrapTable('refresh');
			}
		});
	});

	//编辑操作
	function edit(id) {
		var row = $table.bootstrapTable('getRowByUniqueId', id);
		$("#editModal").modal().on("shown.bs.modal", function() {
			$('#edit-name').val(row.name);
			$('#edit-type').val(row.type);
			$('#edit-target').val(row.target);
			$('#edit-brandId').val(row.brandId);
			//console.log(row.brandId);
			$('#edit-gift').val(row.gift);
			$('#edit-categoryId').val(row.categoryId);
			$('#edit-amount').val(row.amount);
			$('#edit-reduction').val(row.reduction);
			$('#edit-id').val(row.id);
			$('#edit-total').val(row.total);
			$('#edit-rule').val(row.rule);
		});
	}

	/* 提交变更 */
	$('#btn_edit_submit').on("click", function() {
		var name = $('#edit-name').val();
		var type = $('#edit-type').val();
		var target = $('#edit-target').val();
		var brandId = $('#edit-brandId').val();
		var gift = $('#edit-gift').val();
		var categoryId = $('#edit-categoryId').val();
		var amount = $('#edit-amount').val();
		var reduction = $('#edit-reduction').val();
		var id = $('#edit-id').val();
		var rule = $('#edit-rule').val();
		var total = $('#edit-total').val();
		$.ajax({
			url : "/backend/admin/promotion/update",
			type : "post",
			data : {
				id : id,
				name : name,
				type : type,
				target : target,
				brandId : brandId,
				gift : gift,
				categoryId : categoryId,
				amount : amount,
				reduction : reduction,
				rule : rule,
				total : total
			},
			success : function(status) {
				$table.bootstrapTable('refresh');
			}
		});
	});

	//下架操作
	function disable(id) {
		if (confirm("确定下架此分类吗？")) {
			$.ajax({
				url : "/backend/admin/promotion/disable", //url
				type : "post",
				data : {
					id : id,
				},
				success : function(status) {
					$table.bootstrapTable('refresh');
				}
			});
		}
	}

	//上架操作
	function reActive(id) {
		if (confirm("确定上架此分类吗？")) {
			$.ajax({
				url : "/backend/admin/promotion/reActive", //url
				type : "post",
				data : {
					id : id,
				},
				success : function(status) {
					$table.bootstrapTable('refresh');
				}
			});
		}
	}
</script>
</html>
