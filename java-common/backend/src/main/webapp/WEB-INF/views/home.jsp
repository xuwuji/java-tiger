<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
            <meta name="keywords" content="News Home, Design By Xu,Wuji" />

            <title>Home</title>
            <!-- Custom Theme files -->
            <script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
            <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

            <link href="${pageContext.request.contextPath}/resources/css/search/home/style.css" rel="stylesheet" type="text/css" media="all" />
            <!-- Custom Theme files -->
            <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
        </head>

        <body>
            <script type="text/javascript">
                var msg = "${anotherLocationLoginMsg}";
                console.log('msg:' + msg);
                if (msg === '') {

                } else {
                    alert(msg);
                }

            </script>


            <!--nav -->
            <div>
                <nav class="navbar navbar-inverse">
                    <div class="container-fluid">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" href="#">#</a>
                        </div>

                        <!-- Collect the nav links, forms, and other content for toggling -->
                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                            <ul class="nav navbar-nav">
                                <li class="active"><a href="#"># <span class="sr-only">(current)</span></a></li>
                                <li><a href="#">#</a></li>

                            </ul>

                            <ul class="nav navbar-nav navbar-right">
                                <li id="loginUsername"><a href="${pageContext.request.contextPath}/login/index" id="loginUsername">登录</a></li>
                                <li id="registerButton"><a href="${pageContext.request.contextPath}/register/index" id="loginUsername">注册</a></li>
                                <li id="commandButton" style="display:none">
                                    <ul class="nav navbar-nav">
                                        <li class="dropdown">
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">操作 <span class="caret"></span></a>
                                            <ul class="dropdown-menu" id="commands">
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <!-- /.navbar-collapse -->
                    </div>
                    <!-- /.container-fluid -->
                </nav>
            </div>
            <!--nav ends here-->

            <!--search start here-->
            <div class="search">
                <i> </i>
                <div class="s-bar">
                    <form action="${pageContext.request.contextPath}/search/index" method="get">
                        <input type="text" value="标题／关键词" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '标题／关键词';}" name="keyword">
                        <input type="hidden" name="pageNum" id="search-text" size="15" />
                        <input type="hidden" name="orderBy" id="search-text" size="15" />
                        <input type="submit" value="查询" />
                    </form>
                </div>
                <p>
                    热门搜索:
                    <c:forEach items="${hotKW}" var="kw">
                        <c:set var="kwUrl" scope="session" value="${pageContext.request.contextPath}/search/index?keyword=${kw}&pageNum=1&orderBy=" />
                        <a href="${kwUrl}">${kw}</a>
                    </c:forEach>
            </div>
            <!--search ends here-->
            <br>
            <br>
            <!--hot news start here-->
            <div>
                <div class="s-bar" style="border: 1px #000000 solid; text-align: center; border-radius: 20px;">
                    <div id="navi">
                        <h1 style="color: #fff; text-align: center">二十四小时热门新闻</h1>
                    </div>
                    <!--select news category-->
                    <div class="dropdown btn-group">
                        <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" id="typeButton">全部类别
                        </button>
                        <ul class=" dropdown-menu" id="typeContent">
                        </ul>
                    </div>
                    <!--select news category end-->
                    <br>
                    <br>
                    <ul id="hotNews">
                    </ul>
                </div>
            </div>
            <!--hot news end here-->

            <div class="copyright">
                <p>2015 &copy Xu,Wuji All rights reserved</p>
            </div>
        </body>

        <script type="text/javascript">
            $(document).ready(function() {
                getDailyHotNews('');
                getType();
                login();
            });

            function getDailyHotNews(type) {
                $
                    .ajax({
                        type: "GET",
                        url: "${pageContext.request.contextPath}/news/dailyHotnews?time=&type=" + type,
                        contentType: " charset=utf-8 ",
                    }).done(function(data) {
                        fixNewsContent(data);
                        if (type === '') {
                            fixButton("全部类别");
                        } else {
                            fixButton(type);
                        }

                    });
            }

            function fixNewsContent(data) {
                var str = '';
                $.each(data, function(index, news) {
                    str = '<p> <a href=\'${pageContext.request.contextPath}/news/' + news.id + '\'>' + news.title + '</a></p>' + str;
                    console.log(news.title);
                });
                $('#hotNews').html(str);
            }

            function getType() {
                var typePart = '<li onclick=getDailyHotNews(\'' + '\')><a>全部类别</a></li>';
                $.ajax({
                    type: "GET",
                    url: "${pageContext.request.contextPath}/news/type",
                }).done(
                    function(data) {
                        $.each(data, function(index, type) {
                            typePart = typePart + '<li onclick=getDailyHotNews(\'' + type + '\')><a> ' + type + '</a></li>'
                            console.log(type);
                        });
                        typePart = typePart + '</li>';
                        $('#typeContent').html(typePart);
                        console.log(typePart);
                    });
            }


            function fixButton(type) {
                $('#typeButton').html(type);
            }

            function login() {
                $.ajax({
                    type: "GET",
                    url: "${pageContext.request.contextPath}/login/checkStatus",
                }).done(
                    function(data) {
                        console.log(data);
                        if (data === '') {
                            console.log("not login");
                        } else {
                            var str = "<a href=\"${pageContext.request.contextPath}/user/profile\">" + data + " </a>"
                            console.log(data + " login");
                            $('#loginUsername').html(str);
                            $('#registerButton').attr("style", "display:none");
                            $('#commandButton').attr("style", "");
                            var commands = "<li><a href=\"${pageContext.request.contextPath}/user/profile\">个人信息</a></li><li role = \"separator\" class = \"divider\"> </li> <li> <a href = \"${pageContext.request.contextPath}/login/logout\"> 退出 </a></li>";
                            $('#commands').html(commands);

                        }
                    });
            }

        </script>

        </html>
