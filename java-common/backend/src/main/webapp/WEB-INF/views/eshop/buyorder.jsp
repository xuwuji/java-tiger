<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />

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
<script
	src="https://unpkg.com/bootstrap-table@1.13.5/dist/bootstrap-table.min.js"></script>
<!-- Latest compiled and minified Locales -->
<script
	src="https://unpkg.com/bootstrap-table@1.13.5/dist/locale/bootstrap-table-zh-CN.min.js"></script>
</head>
<body>
	<br>
	<br>
	<button id="initItems" type="button" class="btn btn-primary">初始化</button>
	<button id="addItem" type="button" class="btn btn-success">
		新增Item</button>
	<br>
	<br>

	<!-- 新增item的modal -->
	<div class="modal fade" id="itemModal" tabindex="-1" role="dialog"
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
						<label for="txt_departmentname">商品名称</label> <input type="text"
							class="form-control" id="item-name" placeholder="商品名称">
					</div>
					<div class="form-group">
						<label for="txt_departmentname">商品id</label> <input type="text"
							class="form-control" id="item-id" placeholder="商品id">
					</div>
					<div class="form-group">
						<label for="txt_departmentname">数量</label> <input type="text"
							class="form-control" id="item-count" placeholder="数量">
					</div>
					<div class="form-group">
						<label for="txt_departmentname">地址</label> <input type="text"
							class="form-control" id="item-address" placeholder="地址">
					</div>
					<div class="form-group">
						<label for="txt_departmentname">供货商</label> <input type="text"
							class="form-control" id="item-vandor" placeholder="供货商">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
					</button>
					<button type="button" id="btn_item_submit" class="btn btn-primary"
						data-dismiss="modal">
						<span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>新增
					</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 新增item的modal -->
</body>

<script type="text/javascript">
	$('#addItem').on("click", function() {
		$("#itemModal").modal().on("shown.bs.modal", function() {
		});
	});

	$('#initItems').on("click", function() {
		$.ajax({
			url : "/backend/admin/buyOrder/init",
			type : "get",
			data : {},
			success : function(status) {
			}
		});
	});

	/* 提交item信息 */
	$('#btn_item_submit').on("click", function() {
		var name = $("#item-name").val();
		var address = $("#item-address").val();
		var vandor = $("#item-vandor").val();
		var count = $("#item-count").val();
		var id = $("#item-id").val();
		$.ajax({
			url : "/backend/admin/buyOrder/add",
			type : "post",
			data : {
				name : name,
				address : address,
				vandor : vandor,
				count : count,
				id : id,
			},
			success : function(status) {
			}
		});

	});
</script>
</html>
