<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta name="keywords" content="Calendar, Date & Time Widget Widget Responsive, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design" />

        <title>welcome</title>

        <script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>

        <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom Theme files -->
        <link href="${pageContext.request.contextPath}/resources/css/newsIndex/style.css" rel='stylesheet' type='text/css' />
        <!-- Custom Theme files -->
        <!--Calender-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/newsIndex/clndr.css" type="text/css" />
        <script src="${pageContext.request.contextPath}/resources/js/newsIndex/underscore-min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/newsIndex/moment-2.2.1.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/newsIndex/clndr.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/newsIndex/site.js"></script>


        <script type="application/x-javascript">
            addEventListener("load", function() {
                setTimeout(hideURLbar, 0);
            }, false);

            function hideURLbar() {
                window.scrollTo(0, 1);
            }

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
                }; // add zero in front of numbers < 10
                return i;
            }

        </script>
    </head>

    <body onload="startTime()">

        <h1>热点新闻</h1>

        <div class="content">

            <div class="calender"></div>

            <div class="date">
                <div id="dd1" class="wrapper-dropdown-3" tabindex="1">
                    <span><img
					src="${pageContext.request.contextPath}/resources/img/newsIndex/nav.png"
					alt="Navbar" /></span>
                    <ul class="dropdown">
                        <div id="typeContent">
                        </div>

                    </ul>
                    <script type="text/javascript">
                        function DropDown(el) {
                            this.dd = el;
                            this.initEvents();
                        }
                        DropDown.prototype = {
                            initEvents: function() {
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
                        var dayarray = new Array("星期日", "星期一", "星期二",
                            "星期三", "星期四", "星期五", "星期六")
                        var montharray = new Array("一月", "二月", "三月",
                            "四月", "五月", "六月", "七月", "八月",
                            "九月", "十月", "十一月", "十二月")
                        document
                            .write("" + dayarray[day] + ", " + montharray[month] + " " + daym + ", " + year + "")

                    </script>
                </div>
                <div id="news">
                    <ul class="reminder" id="newsContent">
                    </ul>
                </div>
            </div>

        </div>

        <div class="clear"></div>

        <div class="footer">
            <p>
                Copyright &copy; 2015 Calendar, Date & Time Widget. All Rights Reserved | Design by <a href="http://w3layouts.com">W3layouts</a>
            </p>
        </div>
    </body>

    <script type="text/javascript">
        $(document).ready(function() {
            getDailyHotNews(1, '');
            getType();
        });

        function getDailyHotNews(tag, type) {
            console.log(type);
            $.ajax({
                type: "GET",
                url: "http://localhost:8080/backend/index/hotnews?time=&type=" + type,
                contentType: " charset=utf-8",
            }).done(function(data) {
                if (tag == 1) {
                    fixNewsContent(data);
                }
            });
        }

        function fixSilder(data) {

        }

        function fixNewsContent(data) {
            var str = '';
            $.each(data, function(index, news) {
                str =  '<li> <a href=\'' + news.link + '\'>' + news.title + '</a></li>'+str;
                console.log(news.title);
            });
            $('#newsContent').html(str);
        }

        function getType() {
            var typePart = '';
            $.ajax({
                type: "GET",
                url: "http://localhost:8080/backend/index/type",
            }).done(function(data) {
                $.each(data, function(index, type) {
                    typePart = typePart + '<li onclick=getDailyHotNews(1,\'' + type + '\')> ' + type + '</li>'
                    console.log(type);
                });
                typePart = typePart + '</li>';
                $('#typeContent').html(typePart);
            });
        }

    </script>

    </html>
