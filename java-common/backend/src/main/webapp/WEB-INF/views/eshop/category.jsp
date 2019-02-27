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

	<h1 align="center">分类管理</h1>
	<select class="selectpicker">
	</select>

	<button id="search" type="button" class="btn">
		<span aria-hidden="true" class="icon icon-plus-sign"></span>查询
	</button>

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
					<h4 class="modal-title" id="myModalLabel">在此大类下新增一个子类</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="txt_departmentname">子类名称</label> <input type="text"
							class="form-control" id="categoryName" placeholder="名称">
					</div>
					<div class="form-group">
						<label for="txt_departmentname">子类介绍</label> <input type="text"
							class="form-control" id="categoryDesc" placeholder="介绍">
					</div>
					<div class="form-group">
						<label for="txt_departmentname">图片Url</label> <input type="text"
							class="form-control" id="categoryImgUrl" placeholder="图片Url">
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
						<label for="txt_departmentname">子类名称</label> <input type="text"
							class="form-control" id="edit-categoryName" placeholder="名称">
					</div>
					<div class="form-group">
						<label for="txt_departmentname">子类介绍</label> <input type="text"
							class="form-control" id="edit-categoryDesc" placeholder="介绍">
					</div>
					<div class="form-group">
						<label for="txt_departmentname">图片Url</label> <input type="text"
							class="form-control" id="edit-categoryImgUrl" placeholder="图片Url">
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

	//根据大类id加载所有子类，然后对子类进行操作
	function initTable(parentCategoryId) {
		$table.bootstrapTable({
			url : '/backend/category/getCategoryByParent/' + parentCategoryId, //请求后台的URL（*）
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
						title : '类别名',
						align : 'center'
					},
					{
						field : 'desc',
						title : '介绍',
						align : 'center'
					},
					{
						field : '父类id',
						title : 'parentCategoryId',
						align : 'center'
					},
					{
						field : 'imgId',
						title : '图片的Id',
						align : 'center'
					},
					{
						field : 'imgUrl',
						title : '显示图片url',
						align : 'center'
					},
					{
						title : '操作',
						field : 'id',
						formatter : function(id) {
							var html = '<a href="javascript:editCategory(' + id
									+ ')">编辑</a>';
							html += '　<a href="javascript:deleteCategory(' + id
									+ ')">下架</a>';
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
		var parentCategoryId = $(".selectpicker").val();
		var categoryName = $('#categoryName').val();
		var categoryDesc = $('#categoryDesc').val();
		var categoryImgUrl = $('#categoryImgUrl').val();
		$.ajax({
			url : "/backend/admin/category/add",
			type : "post",
			dataType : "json",
			data : {
				name : categoryName,
				desc : categoryDesc,
				imgUrl : categoryImgUrl,
				parentCategoryId : parentCategoryId,
			},
			success : function(status) {
				//alert(status);
				$table.bootstrapTable('refresh');
			}
		});
	});

	//编辑操作
	function editCategory(id) {
		var row = $table.bootstrapTable('getRowByUniqueId', id);
		$("#editModal").modal().on("shown.bs.modal", function() {
			$('#edit-categoryName').val(row.name);
			$('#edit-categoryDesc').val(row.desc);
			$('#edit-categoryImgUrl').val(row.imgUrl);
		});
		console.log(row);
	}

	/* 提交变更 */
	$('#btn_edit_submit').on(
			"click",
			function() {
				console.log($('#editModalParentCategoryId').val());
				var editModalParentCategoryId = $('#editModalParentCategoryId')
						.val();
				var editModalParentCategoryName = $(
						'#editModalParentCategoryName').val();
				$.ajax({
					url : "/backend/admin/parentCategory/update",
					type : "post",
					dataType : "json",
					data : {
						id : editModalParentCategoryId,
						name : editModalParentCategoryName
					},
					success : function(status) {
						//alert(status);
						$table.bootstrapTable('refresh');
					}
				});
			});

	//删除操作
	function deleteCategory(id) {
		if (confirm("确定删除此分类吗？")) {
			$.ajax({
				url : "/backend/admin/parentCategory/delete", //url
				type : "post",
				dataType : "json",
				data : {
					id : id,
					type : "single"
				},
				success : function(status) {
					//alert(status);
					$table.bootstrapTable('refresh');
				}
			});
		}
	}

	/* 批量删除 */
	$('#btn-batch-delete').on("click", function() {
		var rows = $table.bootstrapTable('getSelections');
		console.log(rows);
		var ids = '';
		for (var i = 0; i < rows.length; i++) {
			//console.log(rows[i]);
			ids += rows[i].id + ',';
		}
		ids = ids.substring(0, ids.length - 1);
		$.ajax({
			url : "/backend/admin/parentCategory/delete", //url
			type : "post",
			dataType : "json",
			data : {
				id : ids,
				type : "batch"
			},
			success : function(status) {
				//alert(status);
				$table.bootstrapTable('refresh');
			}
		});
		//$table.bootstrapTable('refresh');
	});

	$(document).ready();

	/* 查询大类 */
	$('#search').on("click", function() {
		//console.log($(".selectpicker").val());
		var parentCategoryId = $(".selectpicker").val();
		$.ajax({
			url : "/backend/category/getCategoryByParent/" + parentCategoryId, //url
			type : "get",
			success : function(status) {
				$table.bootstrapTable('destroy');
				initTable(parentCategoryId);
				console.log(parentCategoryId);
				$table.bootstrapTable('refresh');
			}
		});
		//$table.bootstrapTable('refresh');
	});

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
					$('.selectpicker').append(opts);
					$('.selectpicker').selectpicker("refresh");
				}
			});
</script>
</html>
