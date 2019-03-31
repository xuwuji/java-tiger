<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>商品管理</title>

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

	<h1 align="center">商品管理</h1>
	<!-- 大类查询 -->
	<select id="selectpicker-parent">
	</select>
	<button id="searchByParent" type="button" class="btn">
		<span aria-hidden="true" class="icon icon-plus-sign"></span>查询子分类
	</button>
	<br>
	<br>
	<!-- 子类查询 -->
	<select id="selectpicker-child">
	</select>
	<button id="searchByChild" type="button" class="btn">
		<span aria-hidden="true" class="icon icon-plus-sign"></span>查询商品
	</button>
	<br>
	<br>
	<div class="btn-group">
		<button id="btn-add" type="button" class="btn">
			<span aria-hidden="true" class="icon icon-plus-sign"></span>新增
		</button>
	</div>

	<div class="btn-group">
		<button id="btn-batch-disable" type="button" class="btn">
			<span aria-hidden="true" class="icon icon-plus-sign"></span>批量下架
		</button>
	</div>
	<div class="btn-group">
		<button id="btn-batch-reActive" type="button" class="btn">
			<span aria-hidden="true" class="icon icon-plus-sign"></span>批量上架
		</button>
	</div>
	<div class="btn-group">
		<button id="btn-batch-banner" type="button" class="btn">
			<span aria-hidden="true" class="icon icon-plus-sign"></span>批量修改banner
		</button>
	</div>
	<div class="btn-group">
		<button id="btn-batch-brand" type="button" class="btn">
			<span aria-hidden="true" class="icon icon-plus-sign"></span>批量修改品牌
		</button>
	</div>

	<!--工具-->

	<!--bootstrap-table表格-->
	<table id="data-table"></table>

	<!-- 新增用的modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">在此类下新增一个商品</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="txt_departmentname">商品名称</label> <input type="text"
							class="form-control" id="productName" placeholder="名称">
					</div>
					<div class="form-group">
						<label for="txt_departmentname">商品介绍</label> <input type="text"
							class="form-control" id="productDesc" placeholder="介绍">
					</div>
					<div class="form-group">
						<label for="txt_departmentname">商品价格</label> <input type="text"
							class="form-control" id="productPrice" placeholder="商品价格">
					</div>
					<div class="form-group">
						<label for="txt_departmentname">商品库存</label> <input type="text"
							class="form-control" id="productInventory" placeholder="库存">
					</div>
					<div class="form-group">
						<label for="txt_departmentname">商品销售量</label> <input type="text"
							class="form-control" id="productSalesCount" placeholder="销售量">
					</div>
					<!-- 	<div class="form-group">
						<label for="txt_departmentname">商品主图Url</label> <input type="text"
							class="form-control" id="productMainImgUrl" placeholder="商品主图Url">
					</div> -->
					<!-- <div class="form-group">
						<label for="txt_departmentname">品牌中文名</label> <input type="text"
							class="form-control" id="productBrandNameCN" placeholder="品牌中文名">
					</div>

					<div class="form-group">
						<label for="txt_departmentname">品牌英文名</label> <input type="text"
							class="form-control" id="productBrandNameEN" placeholder="品牌英文名">
					</div> -->
					<div class="form-group">
						<label for="txt_departmentname">大类id</label> <input type="text"
							class="form-control" id="add-parentCategoryId" placeholder="大类id"
							disabled="disabled">
					</div>
					<div class="form-group">
						<label for="txt_departmentname">子类id</label> <input type="text"
							class="form-control" id="add-categoryId" placeholder="子类id"
							disabled="disabled">
					</div>
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
					<div class="form-group">
						<label for="txt_departmentname">商品id</label> <input type="text"
							class="form-control" id="edit-productId" placeholder="商品id"
							disabled="disabled">
					</div>
					<div class="form-group">
						<label for="txt_departmentname">商品名称</label> <input type="text"
							class="form-control" id="edit-productName" placeholder="名称">
					</div>
					<div class="form-group">
						<label for="txt_departmentname">商品介绍</label> <input type="text"
							class="form-control" id="edit-productDesc" placeholder="介绍">
					</div>
					<div class="form-group">
						<label for="txt_departmentname">商品价格</label> <input type="text"
							class="form-control" id="edit-productPrice" placeholder="商品价格">
					</div>
					<div class="form-group">
						<label for="txt_departmentname">商品库存</label> <input type="text"
							class="form-control" id="edit-productInventory" placeholder="库存">
					</div>
					<div class="form-group">
						<label for="txt_departmentname">商品销售量</label> <input type="text"
							class="form-control" id="edit-productSalesCount"
							placeholder="销售量">
					</div>
					<div class="form-group">
						<label for="txt_departmentname">商品促销价</label> <input type="text"
							class="form-control" id="edit-flashPrice" placeholder="闪购时的价格">
					</div>
					<div class="form-group">
						<label for="txt_departmentname">是否闪购</label> <input type="text"
							class="form-control" id="edit-flashState" placeholder="0-不参加，1-参加">
					</div>
					<!-- 	<div class="form-group">
						<label for="txt_departmentname">商品主图Url</label> <input type="text"
							class="form-control" id="edit-productMainImgUrl"
							placeholder="商品主图Url">
					</div> -->
					<!-- <div class="form-group">
						<label for="txt_departmentname">品牌中文名</label> <input type="text"
							class="form-control" id="edit-productBrandNameCN"
							placeholder="品牌中文名">
					</div>

					<div class="form-group">
						<label for="txt_departmentname">品牌英文名</label> <input type="text"
							class="form-control" id="edit-productBrandNameEN"
							placeholder="品牌英文名">
					</div> -->
					<div class="form-group">
						<label for="txt_departmentname">大类id</label> <input type="text"
							class="form-control" id="edit-parentCategoryId"
							placeholder="大类id" disabled="disabled">
					</div>
					<div class="form-group">
						<label for="txt_departmentname">子类id</label> <input type="text"
							class="form-control" id="edit-categoryId" placeholder="子类id"
							disabled="disabled">
					</div>
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

	<!-- banner的modal -->
	<div class="modal fade" id="bannerModal" tabindex="-1" role="dialog"
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
						<label for="txt_departmentname">商品id</label> <input type="text"
							class="form-control" id="banner-id" placeholder="商品id"
							disabled="disabled">
					</div>
					<div class="form-group">
						<label for="txt_departmentname">修改类型</label> <input type="text"
							class="form-control" id="banner-type" placeholder="商品id"
							disabled="disabled">
					</div>
					<div class="form-group">
						<label for="txt_departmentname">修改类型</label> <input type="text"
							class="form-control" id="banner-type" placeholder="商品id"
							disabled="disabled">
					</div>
					<!--<div class="form-group">
						<label for="txt_departmentname">商品名称</label> <input type="text"
							class="form-control" id="banner-name" placeholder="商品名称"
							disabled="disabled">
					</div>
					<div class="form-group">
						<label for="txt_departmentname">商品bannerItem名称</label> <input
							type="text" class="form-control" id="banner-bannerItem"
							placeholder="名称">
					</div> -->
					<div class="form-group">
						<label for="txt_departmentname">banner位</label>
						<!-- 查询banner item -->
						<select id="selectpicker-banner">
						</select>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
					</button>
					<button type="button" id="btn_update_banner"
						class="btn btn-primary" data-dismiss="modal">
						<span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>修改banner
					</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 品牌的modal -->
	<div class="modal fade" id="brandModal" tabindex="-1" role="dialog"
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
						<label for="txt_departmentname">商品id</label> <input type="text"
							class="form-control" id="brand-id" placeholder="商品id"
							disabled="disabled">
					</div>
					<div class="form-group">
						<label for="txt_departmentname">修改类型</label> <input type="text"
							class="form-control" id="brand-type" placeholder="商品id"
							disabled="disabled">
					</div>
					<div class="form-group">
						<label for="txt_departmentname">品牌</label>
						<!-- 查询banner item -->
						<select id="selectpicker-brand">
						</select>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal"
						id="close_brand">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
					</button>
					<button type="button" id="btn_update_brand" class="btn btn-primary"
						data-dismiss="modal">
						<span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>修改品牌
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
	function initTable(categoryId) {
		$table
				.bootstrapTable({
					url : '/backend/admin/product/getDetailByCategory/'
							+ categoryId, //请求后台的URL（*）
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
								title : '商品名',
								align : 'center'
							},
							{
								field : 'description',
								title : '介绍',
								align : 'center'
							},
							{
								field : 'price',
								title : '价格',
								align : 'center'
							},
							{
								field : 'inventory',
								title : '库存',
								align : 'center'
							},
							{
								field : 'salesCount',
								title : '销量',
								align : 'center'
							},
							/* {
								field : 'mainImgUrl',
								title : '主图url',
								align : 'center'
							}, */
							{
								field : 'parentCategoryId',
								title : '大分类Id',
								align : 'center'
							},
							{
								field : 'categoryId',
								title : '分类Id',
								align : 'center'
							},
							{
								field : 'brandNameCN',
								title : '品牌中文名',
								align : 'center'
							},
							{
								field : 'brandNameEN',
								title : '品牌英文名',
								align : 'center'
							},
							{
								field : 'bannerItemName',
								title : 'banner位',
								align : 'center',
							},
							{
								field : 'flashPrice',
								title : '促销价格',
								align : 'center',
							},
							{
								field : 'flashState',
								title : '是否促销',
								align : 'center',
								formatter : function(value, row, index) {
									if (row.flashState) {
										if (row.flashState == '0') {
											return "否";
										} else if (row.flashState == '1') {
											return "是";
										} else {
											return "错误数据";
										}
									}
								}
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
									var html = '<a href="javascript:editProduct('
											+ id + ')">编辑</a>';
									html += '　<a href="javascript:deleteProduct('
											+ id + ')">下架</a>';
									html += '　<a href="javascript:reActiveProduct('
											+ id + ')">上架</a>';
									html += '　<a href="javascript:updateBannerItem('
											+ id + ')">修改banner位</a>';
									html += '　<a href="javascript:updateBrand('
											+ id + ')">修改品牌</a>';
									html += '　<a href="/backend/admin/format/index/'
											+ id + '">规格管理</a>';
									return html;
								}
							}

					]
				});
	}
	function updateBrand(id) {
		var row = $table.bootstrapTable('getRowByUniqueId', id);
		var id = row.id;
		var type = 'single';
		openBrandModal(id, type);
	}

	/* 批量提交brand修改*/
	$('#btn-batch-brand').on("click", function() {
		var rows = $table.bootstrapTable('getSelections');
		var ids = '';
		for (var i = 0; i < rows.length; i++) {
			ids += rows[i].id + ',';
		}
		var type = 'batch';
		openBrandModal(ids, type);
	});

	$('#close_brand').on(
			"click",
			function() {
				$('#selectpicker-brand').selectpicker('destroy').removeAttr(
						"multiple");
			});

	function openBrandModal(id, type) {
		$("#brandModal").modal().on("shown.bs.modal", function() {
			$("#brand-id").val(id);
			$("#brand-type").val(type);
		});
	}

	$
			.ajax({
				"type" : 'get',
				"url" : '/backend/admin/brand/getAll',
				"dataType" : "json",
				"success" : function(data) {
					var depart_list = data;
					console.log(data);
					var opts = "";
					for (var depart_index = 0; depart_index < depart_list.length; depart_index++) {
						var item = depart_list[depart_index];
						opts += "<option value='"+item.id+"'>" + item.brandCN
								+ "</option>";
					}
					$('#selectpicker-brand').append(opts);
					$('#selectpicker-brand').selectpicker("refresh");
				}
			});

	/* 提交brand修改*/
	$('#btn_update_brand').on("click", function(id) {
		var brandId = $('#selectpicker-brand').val();
		var categoryId = $("#selectpicker-child").val();
		var id = $("#brand-id").val();
		var type = $("#brand-type").val();
		$.ajax({
			url : "/backend/admin/product/updateBrand",
			type : "post",
			data : {
				id : id,
				brandId : brandId,
				type : type
			},
			success : function(status) {
				$table.bootstrapTable('destroy');
				initTable(categoryId);
			}
		});
	});

	function openBannerModal(id, type) {
		$("#bannerModal").modal().on("shown.bs.modal", function() {
			$("#banner-id").val(id);
			$("#banner-type").val(type);
		});
	}

	$
			.ajax({
				"type" : 'get',
				"url" : '/backend/admin/banner/getAll',
				"dataType" : "json",
				"success" : function(data) {
					var depart_list = data;
					var opts = "";
					for (var depart_index = 0; depart_index < depart_list.length; depart_index++) {
						var item = depart_list[depart_index];
						opts += "<option value='"+item.id+"'>" + item.name
								+ "</option>";
					}

					// 查询界面
					$('#selectpicker-banner').append(opts);
					$('#selectpicker-banner').selectpicker("refresh");
				}
			});

	/* 批量提交banner修改*/
	$('#btn-batch-banner').on("click", function() {
		var rows = $table.bootstrapTable('getSelections');
		var ids = '';
		for (var i = 0; i < rows.length; i++) {
			ids += rows[i].id + ',';
		}
		var type = 'batch';
		openBannerModal(ids, type);
	});

	function updateBannerItem(id) {
		var row = $table.bootstrapTable('getRowByUniqueId', id);
		var id = row.id;
		var type = 'single';
		openBannerModal(id, type);
	}

	/* 提交banner修改*/
	$('#btn_update_banner').on("click", function(id) {
		var bannerItemId = $('#selectpicker-banner').val();
		var categoryId = $("#selectpicker-child").val();
		var id = $("#banner-id").val();
		var type = $("#banner-type").val();
		$.ajax({
			url : "/backend/admin/product/updateBannerItem",
			type : "post",
			data : {
				id : id,
				bannerItemId : bannerItemId,
				type : type
			},
			success : function(status) {
				$table.bootstrapTable('destroy');
				initTable(categoryId);
			}
		});
	});

	/* 展开modal，新增一个分类 */
	$('#btn-add').on("click", function() {
		$table.bootstrapTable('refresh');
		$("#myModal").modal().on("shown.bs.modal", function() {
			var parentCategoryId = $("#selectpicker-parent").val();
			var categoryId = $("#selectpicker-child").val();
			$('#add-parentCategoryId').val(parentCategoryId);
			$('#add-categoryId').val(categoryId);
		});
	});

	/* 提交新建的 */
	$('#btn_submit').on("click", function() {
		var parentCategoryId = $("#add-parentCategoryId").val();
		var categoryId = $("#add-categoryId").val();
		var name = $('#productName').val();
		var desc = $('#productDesc').val();
		var price = $('#productPrice').val();
		var inventory = $('#productInventory').val();
		var salesCount = $('#productSalesCount').val();
		//var mainImgUrl = $('#productMainImgUrl').val();
		//var brandNameCN = $('#productBrandNameCN').val();
		//var brandNameEN = $('#productBrandNameEN').val();
		$.ajax({
			url : "/backend/admin/product/add",
			type : "post",
			data : {
				name : name,
				desc : desc,
				price : price,
				inventory : inventory,
				salesCount : salesCount,
				//mainImgUrl : mainImgUrl,
				parentCategoryId : parentCategoryId,
				categoryId : categoryId,
			//brandNameCN : brandNameCN,
			//brandNameEN : brandNameEN,
			},
			success : function(status) {
				$table.bootstrapTable('destroy');
				initTable(categoryId);
			}
		});
	});

	//编辑操作
	function editProduct(id) {
		var row = $table.bootstrapTable('getRowByUniqueId', id);
		$("#editModal").modal().on("shown.bs.modal", function() {
			var parentCategoryId = $("#selectpicker-parent").val();
			var categoryId = $("#selectpicker-child").val();
			$('#edit-parentCategoryId').val(parentCategoryId);
			$('#edit-categoryId').val(categoryId);
			$('#edit-productId').val(row.id);
			$('#edit-productName').val(row.name);
			$('#edit-productDesc').val(row.description);
			$('#edit-productPrice').val(row.price);
			$('#edit-productSalesCount').val(row.salesCount);
			$('#edit-productInventory').val(row.inventory);
			$('#edit-flashPrice').val(row.flashPrice);
			$('#edit-flashState').val(row.flashState);
			//$('#edit-productMainImgUrl').val(row.mainImgUrl);
			//$('#edit-productBrandNameCN').val(row.brandNameCN);
			//$('#edit-productBrandNameEN').val(row.brandNameEN);
		});
	}

	/* 提交变更 */
	$('#btn_edit_submit').on("click", function() {
		console.log($('#editModalParentCategoryId').val());
		var parentCategoryId = $("#edit-parentCategoryId").val();
		var categoryId = $("#edit-categoryId").val();
		var name = $('#edit-productName').val();
		var desc = $('#edit-productDesc').val();
		var price = $('#edit-productPrice').val();
		var inventory = $('#edit-productInventory').val();
		var salesCount = $('#edit-productSalesCount').val();
		var flashPrice = $('#edit-flashPrice').val();
		var flashState = $('#edit-flashState').val();
		//var mainImgUrl = $('#edit-productMainImgUrl').val();
		//var brandNameCN = $('#edit-productBrandNameCN').val();
		//var brandNameEN = $('#edit-productBrandNameEN').val();
		var id = $('#edit-productId').val();
		$.ajax({
			url : "/backend/admin/product/update",
			type : "post",
			data : {
				id : id,
				name : name,
				desc : desc,
				price : price,
				inventory : inventory,
				salesCount : salesCount,
				//mainImgUrl : mainImgUrl,
				parentCategoryId : parentCategoryId,
				categoryId : categoryId,
				flashPrice : flashPrice,
				flashState : flashState,
			//brandNameCN : brandNameCN,
			//brandNameEN : brandNameEN,
			},
			success : function(status) {
				$table.bootstrapTable('destroy');
				initTable(categoryId);
			}
		});
	});

	//删除操作
	function deleteProduct(id) {
		var categoryId = $("#selectpicker-child").val();
		if (confirm("确定删除此分类吗？")) {
			$.ajax({
				url : "/backend/admin/product/disable",
				type : "post",
				data : {
					id : id,
					type : "single"
				},
				success : function(status) {
					$table.bootstrapTable('destroy');
					initTable(categoryId);
				}
			});
		}
	}

	//上架操作
	function reActiveProduct(id) {
		var categoryId = $("#selectpicker-child").val();
		if (confirm("确定重新上架吗？")) {
			$.ajax({
				url : "/backend/admin/product/reActive", //url
				type : "post",
				data : {
					id : id,
					type : "single"
				},
				success : function(status) {
					$table.bootstrapTable('destroy');
					initTable(categoryId);
				}
			});
		}
	}

	/* 批量上架 */
	$('#btn-batch-reActive').on("click", function() {
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
				initTable(categoryId);
			}
		});
	});

	/* 批量下架 */
	$('#btn-batch-disable').on("click", function() {
		var rows = $table.bootstrapTable('getSelections');
		var categoryId = $("#selectpicker-child").val();
		var ids = '';
		for (var i = 0; i < rows.length; i++) {
			ids += rows[i].id + ',';
		}
		ids = ids.substring(0, ids.length - 1);
		$.ajax({
			url : "/backend/admin/product/disable", //url
			type : "post",
			data : {
				id : ids,
				type : "batch"
			},
			success : function(status) {
				$table.bootstrapTable('destroy');
				initTable(categoryId);
			}
		});
	});

	$(document).ready();

	/* 查询子类 */
	$('#searchByParent')
			.on(
					"click",
					function() {
						var parentCategoryId = $("#selectpicker-parent").val();
						$
								.ajax({
									url : "/backend/category/getCategoryByParent/"
											+ parentCategoryId,
									type : "get",
									success : function(data) {
										$('#selectpicker-child').find("option")
												.remove();
										var depart_list = data;
										var opts = "";
										for (var depart_index = 0; depart_index < depart_list.length; depart_index++) {
											var item = depart_list[depart_index];
											opts += "<option value='"+item.id+"'>"
													+ item.name + "</option>";
										}
										// 查询界面
										$('#selectpicker-child').append(opts);
										$('#selectpicker-child').selectpicker(
												"refresh");
									}
								});
					});

	/* 查询此分类下的商品 */
	$('#searchByChild').on("click", function() {
		var categoryId = $("#selectpicker-child").val();
		console.log(categoryId);
		$.ajax({
			url : "/backend/category/getProductsByCategory/" + categoryId, //url
			type : "get",
			success : function(status) {
				$table.bootstrapTable('destroy');
				initTable(categoryId);
			}
		});
	});

	/**大类的select picker数据加载 **/
	$
			.ajax({
				"type" : 'get',
				"url" : '/backend/admin/parentCategory/getAll',
				"dataType" : "json",
				"success" : function(data) {
					console.log(data);
					var depart_list = data;
					var opts = "";
					for (var depart_index = 0; depart_index < depart_list.length; depart_index++) {
						var item = depart_list[depart_index];
						opts += "<option value='"+item.id+"'>" + item.name
								+ "</option>";
					}
					// 查询界面
					$('#selectpicker-parent').append(opts);
					$('#selectpicker-parent').selectpicker("refresh");
				}
			});
</script>
</html>
