<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Insert title here</title>
            <script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
            <link href="${pageContext.request.contextPath}/resources/css/search/style.css" rel="stylesheet" />
        </head>

        <body>

            <div id="logo">
                <h1>
			<a href="${pageContext.request.contextPath}/search/">Search </a>
		</h1>
                <p>
                    <em> Design by Xu,Wuji</em>
                </p>
            </div>
            <hr />
            <div id="header">
                <!-- #menu -->
                <div id="menu">
                    <ul>
                        <c:set var="hotUrl" scope="session" value="${pageContext.request.contextPath}/search/index?keyword=${keyword}&pageNum=1&orderBy=" />
                        <li><a href="${hotUrl}" class="first">最热</a></li>
                        <c:set var="latestUrl" scope="session" value="${pageContext.request.contextPath}/search/index?keyword=${keyword}&pageNum=1&orderBy=time" />
                        <li class="current_page_item"><a href="${latestUrl}">最新</a></li>
                        <li><a href="#">#</a></li>
                        <li><a href="#">#</a></li>
                    </ul>
                </div>
                <!-- end #menu -->
                <!--  #search -->
                <div id="search">
                    <form method="get" action="${pageContext.request.contextPath}/search/index">
                        <fieldset>
                            <input type="text" name="keyword" id="search-text" size="15" placeholder="标题／关键字" />
                            <input type="hidden" name="pageNum" id="search-text" size="15" />
                            <input type="hidden" name="orderBy" id="search-text" size="15" />
                            <input type="submit" id="search-submit" value="GO" />
                        </fieldset>
                    </form>
                </div>
                <!-- end #search -->
            </div>
            <!-- end #header -->
            <!-- end #header-wrapper -->



            <div id="page">
                <div id="content">
                    <c:forEach items="${searchResult }" var="item">
                        <div class="post">
                            <c:set var="pageUrl" scope="session" value="${pageContext.request.contextPath}/news/${item.id}" />
                            <h2 class="title"><a href="${pageUrl}"> ${item.title}</a></h2>
                            <p class="meta">${item.time}
                                <a href="#"></a>
                            </p>
                            <div class="entry">

                            </div>
                        </div>
                    </c:forEach>
                    <!--page pagination-->
                    <c:set var="i" value="${1}" />
                    <c:set var="total" scope="session" value="${totalNum}" />
                    <c:set var="current" scope="session" value="${pageNum}" />
                    <c:set var="previous" scope="session" value="${pageNum-i}" />
                    <c:set var="next" scope="session" value="${pageNum+i}" />
                    <c:if test="${current > i}">
                        <c:set var="url" scope="session" value="${pageContext.request.contextPath}/search/index?keyword=${keyword}&pageNum=${previous}&orderBy=${orderBy}" />
                        <c:set var="firstPageUrl" scope="session" value="${pageContext.request.contextPath}/search/index?keyword=${keyword}&pageNum=1&orderBy=${orderBy}" />
                        <span><a href="${firstPageUrl}">首页</a></span>
                        <span><a href="${url}">上一页</a></span>
                    </c:if>
                    &nbsp;&nbsp;当前第
                    <span id="currentPage">${pageNum}</span>页&nbsp;&nbsp;
                    <c:if test="${current < total}">
                        <c:set var="url" scope="session" value="${pageContext.request.contextPath}/search/index?keyword=${keyword}&pageNum=${next}&orderBy=${orderBy}" />
                        <c:set var="lastPageUrl" scope="session" value="${pageContext.request.contextPath}/search/index?keyword=${keyword}&pageNum=${totalNum}&orderBy=${orderBy}" />
                        <span><a href="${url}">下一页</a></span>
                        <span><a href="${lastPageUrl}">尾页</a></span>
                    </c:if>
                    共<span id="totalPage">${totalNum}</span>页&nbsp;&nbsp;
                    <!--end page pagination-->
                </div>
                <!-- end #content -->
                <div style="clear: both;">&nbsp;</div>
            </div>
            <!-- end #page -->
            <div id="footer">
                <p>
                    Copyright (c) Xu,Wuji
                </p>
            </div>
            <!-- end #footer -->
        </body>
        <script type="text/javascript">
            $(document).ready(function() {

                // getPage("NB");
            });

            function getPage(kw) {
                $.ajax({
                    type: "GET",
                    url: "http://localhost:8080/backend/search/pageInfo?keyword=" + kw,
                }).done(
                    function(data) {
                        $('#totalPage').html(data.lastPage);
                        console.log(data.lastPage);
                    });
            }

        </script>

        </html>
