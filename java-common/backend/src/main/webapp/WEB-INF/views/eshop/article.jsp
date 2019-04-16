<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>文章管理</title>

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
	<h1 align="center">文章管理</h1>
	<h4 align="left">tag，图片中间都用英文符号;隔开</h4>
	<h4 align="left">公告有small，big两种style</h4>
	<h4 align="left">0公告，1种草笔记</h4>

	<!--工具-->
	<div id="toolbar" class="btn-group">
		<button id="btn-add" type="button" class="btn">
			<span aria-hidden="true" class="icon icon-plus-sign"></span>新增
		</button>
	</div>

<!-- 	<div id="toolbar" class="btn-group">
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
					<h4 class="modal-title" id="myModalLabel">新增一篇文章</h4>
				</div>
				<div class="modal-body">

					<div class="form-group">
						<label for="txt_departmentname">标题</label> <input type="text"
							name="txt_departmentname" data-bind="value:Name"
							class="form-control" id="add-title" placeholder="名称">
					</div>
				<!-- 	<div class="form-group">
						<label for="txt_departmentname">文章缩略图</label> <input type="text"
							name="txt_departmentname" data-bind="value:Name"
							class="form-control" id="add-mainImgUrl"
							placeholder="文章的封面图片url">
					</div>
					<div class="form-group">
						<label for="txt_departmentname">文章内部图片集合</label> <input
							type="text" name="txt_departmentname" data-bind="value:Name"
							class="form-control" id="add-imgs"
							placeholder="图片url,每一个之间用英文;隔开">
					</div> -->
					<div class="form-group">
						<label for="txt_departmentname">相关商品的id</label> <input type="text"
							name="txt_departmentname" data-bind="value:Name"
							class="form-control" id="add-referProductId"
							placeholder="相关商品的id,只能写一个">
					</div>
					<div class="form-group">
						<label for="txt_departmentname">文章类别</label> <input type="text"
							name="txt_departmentname" data-bind="value:Name"
							class="form-control" id="add-typeId" placeholder="0公告，1种草笔记">
					</div>
					<div class="form-group">
						<label for="txt_departmentname">公告的style</label> <input
							type="text" name="txt_departmentname" data-bind="value:Name"
							class="form-control" id="add-announceStyle"
							placeholder="文章类型是广告时才需要填，small或者big">
					</div>
					<div class="form-group">
						<label for="txt_departmentname">文章标签集合</label> <input type="text"
							name="txt_departmentname" data-bind="value:Name"
							class="form-control" id="add-tags"
							placeholder="每一个之间用英文;隔开">
					</div>
					<div class="form-group">
						<label for="txt_departmentname">文章内容</label>
						<textarea type="text" name="txt_departmentname"
							data-bind="value:Name" class="form-control" id="add-text"
							placeholder=""></textarea>

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
					<label for="txt_departmentname">文章id</label> <input type="text"
						data-bind="value:Name" class="form-control" id="edit-id"
						disabled="disabled">
				</div>
				<div class="form-group">
					<label for="txt_departmentname">标题</label> <input type="text"
						name="txt_departmentname" data-bind="value:Name"
						class="form-control" id="edit-title" placeholder="名称">
				</div>
				<!-- <div class="form-group">
					<label for="txt_departmentname">文章缩略图</label> <input type="text"
						name="txt_departmentname" data-bind="value:Name"
						class="form-control" id="edit-mainImgUrl"
						placeholder="图片url,每一个之间用英文;隔开">
				</div>
				<div class="form-group">
					<label for="txt_departmentname">文章内部图片集合</label> <input type="text"
						name="txt_departmentname" data-bind="value:Name"
						class="form-control" id="edit-imgs"
						placeholder="图片url,每一个之间用英文;隔开">
				</div> -->
				<div class="form-group">
					<label for="txt_departmentname">相关商品的id</label> <input type="text"
						name="txt_departmentname" data-bind="value:Name"
						class="form-control" id="edit-referProductId"
						placeholder="相关商品的id,只能写一个">
				</div>
				<div class="form-group">
					<label for="txt_departmentname">文章类别</label> <input type="text"
						name="txt_departmentname" data-bind="value:Name"
						class="form-control" id="edit-typeId" placeholder="0公告，1种草笔记">
				</div>
				<div class="form-group">
					<label for="txt_departmentname">公告的style</label> <input type="text"
						name="txt_departmentname" data-bind="value:Name"
						class="form-control" id="edit-announceStyle"
						placeholder="文章类型是广告时才需要填，small或者big">
				</div>
				<div class="form-group">
					<label for="txt_departmentname">文章标签集合</label> <input type="text"
						name="txt_departmentname" data-bind="value:Name"
						class="form-control" id="edit-tags" placeholder="每一个之间用英文;隔开">
				</div>
				<div class="form-group">
					<label for="txt_departmentname">文章内容</label>
					<textarea type="text" name="txt_departmentname"
						data-bind="value:Name" class="form-control" id="edit-text"
						placeholder="每一个之间用英文;隔开"></textarea>

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
		url : '/backend/article/getAll', //请求后台的URL（*）
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
			field : 'title',
			title : '名称',
			align : 'center'
		}, {
			field : 'typeId',
			title : '种类',
			align : 'center',
			formatter : function(value, row, index) {
				if (row.typeId) {
					if (row.typeId == '0') {
						return "公告";
					} else if (row.typeId == '1') {
						return "种草笔记";
					} else {
						return "错误数据";
					}
				}
			}
		}, 
		
		{
			field : 'announceStyle',
			title : '公告大小格式',
			align : 'center'
		}, {
			field : 'tags',
			title : '标签集合',
			align : 'center'
		}, {
			field : 'referProductId',
			title : '相关商品id',
			align : 'center',
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
		var title = $('#add-title').val();
		var referProductId = $('#add-referProductId').val();
		//var imgs = $('#add-imgs').val();
		//var mainImgUrl = $('#add-mainImgUrl').val();
		var typeId = $('#add-typeId').val();
		var tags = $('#add-tags').val();
		var text = $('#add-text').val();
		var announceStyle = $('#add-announceStyle').val();
		$.ajax({
			url : "/backend/article/add",
			type : "post",
			data : {
				title : title,
				referProductId : referProductId,
				//imgs : imgs,
				//mainImgUrl : mainImgUrl,
				typeId : typeId,
				tags : tags,
				text : text,
				announceStyle : announceStyle,
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
			$('#edit-id').val(row.id);
			$('#edit-title').val(row.title);
			$('#edit-referProductId').val(row.referProductId);
			//$('#edit-imgs').val(row.imgs);
			//$('#edit-mainImgUrl').val(row.mainImgUrl);
			$('#edit-typeId').val(row.typeId);
			$('#edit-tags').val(row.tags);
			$('#edit-text').val(row.text);
			$('#edit-announceStyle').val(row.announceStyle);
		});
	}

	/* 提交变更 */
	$('#btn_edit_submit').on("click", function() {
		var id = $('#edit-id').val();
		var title = $('#edit-title').val();
		var referProductId = $('#edit-referProductId').val();
		//var imgs = $('#edit-imgs').val();
		//var mainImgUrl = $('#edit-mainImgUrl').val();
		var typeId = $('#edit-typeId').val();
		var tags = $('#edit-tags').val();
		var text = $('#edit-text').val();
		var announceStyle = $('#edit-announceStyle').val();
		$.ajax({
			url : "/backend/article/update",
			type : "post",
			data : {
				id : id,
				title : title,
				referProductId : referProductId,
				//imgs : imgs,
				//mainImgUrl : mainImgUrl,
				typeId : typeId,
				tags : tags,
				text : text,
				announceStyle : announceStyle,
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
				url : "/backend/article/disable?id="+id, //url
				type : "get",
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
				url : "/backend/article/reActive?id="+id, //url
				type : "get",

				success : function(status) {
					$table.bootstrapTable('refresh');
				}
			});
		}
	}

</script>
</html>
