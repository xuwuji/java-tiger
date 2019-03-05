<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="keywords"
	content="Calendar, Date & Time Widget Widget Responsive, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design" />

<title>图片管理</title>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/newsIndex/underscore-min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/newsIndex/moment-2.2.1.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/newsIndex/clndr.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/newsIndex/site.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/newsIndex/jssor.slider.mini.js"></script>

<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/newsIndex/style.css"
	rel='stylesheet' type='text/css' />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/newsIndex/clndr.css"
	type="text/css" />
<script
	src="https://cdn.bootcss.com/jquery.form/4.2.2/jquery.form.min.js"></script>

</head>
<body>
	<form method="post" id="signupForm" enctype="multipart/form-data">
		<br> <input type="file" id="img" name="img" /><br> <img
			id="picture" style="width: 400px; height: 400px; display: none" /> <input
			type="hidden" name="headImg" id="headImg" /><br>
	</form>
</body>
<script>
	$(function() {
		var prefixUrl = "localhost:8080";

		$("#img").change(function() {
			upload(prefixUrl)
		})
	})

	function upload(prefixUrl) {
		var options = {
			type : "post",
			url : "http://localhost:8080/backend/img/uploadImg",
			dataType : "json",
			cache : false,
			success : function(data) {
				$("#picture").attr("src", "http://" + data.webUrl)
				$("#picture").show()
				$("#headImg").val(data.path)
			}
		}
		$("#signupForm").ajaxSubmit(options)
	}
</script>
</html>