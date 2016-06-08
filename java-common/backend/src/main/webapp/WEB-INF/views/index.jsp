<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="keywords"
	content="Calendar, Date & Time Widget Widget Responsive, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design" />

<title>welcome</title>

<script
	src="${pageContext.request.contextPath}/resources/js/newsIndex/jquery-1.11.1.min.js"></script>

<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom Theme files -->
<link
	href="${pageContext.request.contextPath}/resources/css/newsIndex/style.css"
	rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<!--Calender-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/newsIndex/clndr.css"
	type="text/css" />
<script
	src="${pageContext.request.contextPath}/resources/js/newsIndex/underscore-min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/newsIndex/moment-2.2.1.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/newsIndex/clndr.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/newsIndex/site.js"></script>


<script type="application/x-javascript">
	
		
		
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 






</script>
<script>
	function startTime() {
		var today = new Date();
		var h = today.getHours();
		var m = today.getMinutes();
		var s = today.getSeconds();
		m = checkTime(m);
		s = checkTime(s);
		document.getElementById('txt').innerHTML = h + ":" + m + ":" + s;
		var t = setTimeout(startTime, 500);
	}
	function checkTime(i) {
		if (i < 10) {
			i = "0" + i
		}
		; // add zero in front of numbers < 10
		return i;
	}
</script>
</head>

<body onload="startTime()">

	<h1>CALENDAR, DATE & TIME WIDGET</h1>

	<div class="content">

		<div class="calender"></div>

		<div class="date">
			<div id="dd1" class="wrapper-dropdown-3" tabindex="1">
				<span><img
					src="${pageContext.request.contextPath}/resources/img/newsIndex/nav.png"
					alt="Navbar" /></span>
				<ul class="dropdown">
					<li><a href="#">Alarm</a></li>
					<li><a href="#">Dual Clock</a></li>
					<li><a href="#">Notes</a></li>
					<li><a href="#">Reminder</a></li>
					<li><a href="#">To-Do List</a></li>
					<li><a href="#">World Clock</a></li>
				</ul>
				<script type="text/javascript">
					function DropDown(el) {
						this.dd = el;
						this.initEvents();
					}
					DropDown.prototype = {
						initEvents : function() {
							var obj = this;
							obj.dd.on('click', function(event) {
								$(this).toggleClass('active');
								event.stopPropagation();
							});
						}
					}
					$(function() {
						var dd = new DropDown($('#dd1'));
						$(document).click(function() {
							// all dropdowns
							$('.wrapper-dropdown-3').removeClass('active');
						});
					});
				</script>
			</div>

			<div id="txt"></div>

			<div class="dmy">
				<script type="text/javascript">
					var mydate = new Date()
					var year = mydate.getYear()
					if (year < 1000)
						year += 1900
					var day = mydate.getDay()
					var month = mydate.getMonth()
					var daym = mydate.getDate()
					if (daym < 10)
						daym = "0" + daym
					var dayarray = new Array("Sunday", "Monday", "Tuesday",
							"Wednesday", "Thursday", "Friday", "Saturday")
					var montharray = new Array("January", "February", "March",
							"April", "May", "June", "July", "August",
							"September", "October", "November", "December")
					document
							.write("" + dayarray[day] + ", "
									+ montharray[month] + " " + daym + ", "
									+ year + "")
				</script>
			</div>

			<h2>REMINDERS</h2>
			<ul class="reminder">
				<li>06:00 - Wake Up</li>
				<li>09:00 - Suit Up</li>
				<li>14:00 - Lunch</li>
				<li>20:00 - Party!</li>
				<li>23:00 - Bed Time</li>
			</ul>
		</div>

	</div>

	<div class="clear"></div>

	</div>
	</div>

	<div class="footer">
		<p>
			Copyright &copy; 2015 Calendar, Date & Time Widget. All Rights
			Reserved | Design by <a href="http://w3layouts.com">W3layouts</a>
		</p>
	</div>
</body>
</html>



</body>
</html>