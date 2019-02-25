<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <html>

        <head>
            <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico" type="image/x-icon" />
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
            <meta name="keywords" content="News Home, Design By Xu,Wuji" />
            <title>Home</title>
            <script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
            <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
            <link href="${pageContext.request.contextPath}/resources/css/search/home/style.css" rel="stylesheet" type="text/css" media="all" />
            <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
            <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap-select.min.css" />
            <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/js/bootstrap-select.min.js" />
        </head>

        <body>
            <!--check if the account is log in another location-->
            <script type="text/javascript">
                var msg = "${anotherLocationLoginMsg}";
                console.log('msg:' + msg);
                if (msg === '') {

                } else {
                    alert(msg);
                }

            </script>


            <!--nav -->
            <div id="pagenav">
                <nav class="navbar navbar-inverse" style="background-color:black">
                    <img src="${pageContext.request.contextPath}/resources/img/logo.png" class="pull-left" style="width:50px;height:50px">
                    <div class="container">
                        <!-- 响应式，当在移动端，把导航栏的几个按钮合并在一个按钮中显示-->
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navi_menu">
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                        </div>

                        <div id="navi_menu">
                            <ul class="nav navbar-nav">
                                <li class="active"><a href="${pageContext.request.contextPath}">Home</a></li>
                                <li><a href="#">Blog</a></li>
                                <li class="divider"></li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
               Photo
               <b class="caret"></b>
            </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">jmeter</a></li>
                                        <li><a href="#">EJB</a></li>
                                        <li><a href="#">Jasper Report</a></li>
                                        <li class="divider"></li>
                                        <li><a href="#">分离的链接</a></li>
                                        <li class="divider"></li>
                                        <li><a href="#">另一个分离的链接</a></li>
                                    </ul>
                                </li>
                                <li><a href="#">About</a></li>
                                <li><a href="#">Links</a></li>
                                <li><a href="#">Contact</a></li>
                            </ul>
                        </div>

                        <div class="collapse navbar-collapse">
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
                        <input type="text" value="标题／关键词" onfocus="this.value ='';" onblur="if (this.value == '') {this.value = '标题／关键词';}" name="keyword" id="searchWord">
                        <input type="hidden" name="pageNum" id="search-text" size="15" />
                        <input type="hidden" name="orderBy" id="search-text" size="15" />
                        <input type="submit" value="查询" />
                        
                    </form>
                </div>
                <p>
                    <abbr class="initialism" title="搜索次数最高的内容">热门搜索</abbr>:
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
                        <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" id="typeButton">全部类别</button>
                        <ul class=" dropdown-menu" id="typeContent">
                        </ul>
                    </div>
                    <!--select news category end-->
                    <br>
                    <br>

                    <ol id="hotNews">
                    </ol>
                </div>
            </div>
            <!--hot news end here-->

            <div class="copyright">
                <p>
                    2015 &copy <cite><strong><em>Xu,Wuji</em></strong></cite> All rights reserved
                </p>
            </div>
        </body>

        <script src="${pageContext.request.contextPath}/resources/js/home/home.js"></script>

        </html>
