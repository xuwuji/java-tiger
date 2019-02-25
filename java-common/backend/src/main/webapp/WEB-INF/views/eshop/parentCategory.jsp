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

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/buttons/1.5.4/css/buttons.dataTables.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/select/1.2.7/css/select.dataTables.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/editor/editor.dataTables.css">


<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/buttons/1.5.4/js/dataTables.buttons.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/select/1.2.7/js/dataTables.select.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/editor/dataTables.editor.min.js"></script>
</head>

<body>

	<div class="container">
		<h1>父分类管理</h1>
		<table id="example" class="display" style="width: 100%">
			<thead>
				<tr>
					<th>id</th>
					<th>name</th>

				</tr>
			</thead>
			<tfoot>
				<tr>
					<th>id</th>
					<th>name</th>

				</tr>
			</tfoot>
		</table>
	</div>
</body>

<script>
	var editor; // use a global for the submit and return data rendering in the examples

	$(document).ready(function() {
		editor = new $.fn.dataTable.Editor({
			ajax : {
				create : {
					type : 'POST',
					url : '../php/rest/create.php'
				},
				edit : {
					type : 'PUT',
					url : '../php/rest/edit.php?id=_id_'
				},
				remove : {
					type : 'GET',
					url : 'delete?id=_id_&name=_name_',
			
				}
			},
			table : "#example",
			idSrc : 'id',
			fields : [ {
				label : "id",
				name : "id"
			}, {
				label : "name:",
				name : "name"
			} ]
		});

		var obj = [ {
			id : 1,
			name : 'e2',
		} ];

		$.ajax({
			type : "GET",
			url : " getAll",
			dataType : "json",
			success : function(data) {
				console.log(data);
				$('#example').DataTable({
					dom : "Bfrtip",
					/* ajax : "/backend/admin/parentCategory/getAll", */
					columns : [ {
						data : "id"
					}, {
						data : "name"
					} ],
					data : data,

					select : true,
					buttons : [ {
						extend : "create",
						editor : editor
					}, {
						extend : "edit",
						editor : editor
					}, {
						extend : "remove",
						editor : editor
					} ]
				});
			},

		});

	});
</script>
</html>
