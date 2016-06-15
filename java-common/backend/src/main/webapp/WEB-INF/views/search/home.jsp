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
            <meta name="keywords" content="Flat Search Box Responsive, Login form web template, Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />

            <title>Insert title here</title>
            <!-- Custom Theme files -->
            <script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
            <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

            <link href="${pageContext.request.contextPath}/resources/css/search/home/style.css" rel="stylesheet" type="text/css" media="all" />
            <!-- Custom Theme files -->
            <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
        </head>

        <body>
            <!--search start here-->
            <div class="search">
                <i> </i>
                <div class="s-bar">
                    <form action="${pageContext.request.contextPath}/search/index" method="get">
                        <input type="text" value="标题／关键词" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search Template';}" name="keyword">
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
            <br>
            <br>
            <!--hot news start here-->
            <div>
                <div class="s-bar" style="border: 1px #000000 solid; text-align: center; border-radius: 20px;">
                    <div id="navi">
                        <h1 style="color: #fff; text-align: center">热门新闻</h1>
                    </div>

                    <div class="dropdown btn-group">
                        <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">全部
                            <span class="caret"></span></button>
                        <ul class="dropdown-menu" id="typeContent">
                        </ul>
                    </div>
                    <br>
                    <br>
                    <ul id="hotNews">
                    </ul>
                </div>
            </div>

            <!--hot news end here-->
            <div class="copyright ">
                <p>2015 &copy Xu,Wuji All rights reserved</p>
            </div>
        </body>
        <script type="text/javascript">
            $(document).ready(function() {
                getDailyHotNews(1, '');
                getType();
            });

            function getDailyHotNews(tag, type) {
                console.log("aaa");
                $
                    .ajax({
                        type: "GET",
                        url: "${pageContext.request.contextPath}/index/hotnews?time=&type=" + type,
                        contentType: "charset=utf-8",
                    }).done(function(data) {
                        console.log(data);
                        if (tag == 1) {
                            fixNewsContent(data);
                        }
                    });
            }

            function fixNewsContent(data) {
                var str = '';
                $.each(data, function(index, news) {
                    str = '<p> <a href=\'${pageContext.request.contextPath}/page/' + news.id + '\'>' + news.title + '</a></p>' + str;
                    console.log(news.title);
                });
                $('#hotNews').html(str);
            }

            function getType() {
                var typePart = '<li onclick=getDailyHotNews(1,\'' + '\')><a>全部类别</a></li>';
                $.ajax({
                    type: "GET",
                    url: "http://localhost:8080/backend/index/type",
                }).done(
                    function(data) {
                        $.each(data, function(index, type) {
                            typePart = typePart + '<li onclick=getDailyHotNews(1,\'' + type + '\')><a> ' + type + '</a></li>'
                            console.log(type);
                        });
                        typePart = typePart + '</li>';
                        $('#typeContent').html(typePart);
                        console.log(typePart);
                    });
            }

        </script>

        </html>
