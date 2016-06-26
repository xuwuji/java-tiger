<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>${keyword}</title>
            <script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
             <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
            <link href="${pageContext.request.contextPath}/resources/css/search/style.css" rel="stylesheet" />
            
            <link href="${pageContext.request.contextPath}/resources/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
           

        </head>

        <body>

            <div id="menu-wrapper">
                <div id="menu">
                    <ul>
                        <li class="current_page_item"><a href="${pageContext.request.contextPath}">Homepage</a></li>
                        <li><a href="#">Blog</a></li>
                        <li><a href="#">Photos</a></li>
                        <li><a href="#">About</a></li>
                        <li><a href="#">Links</a></li>
                        <li><a href="#">Contact</a></li>
                    </ul>
                </div>
                <!-- end #menu -->
            </div>

            <div id="wrapper">
                <div id="header-wrapper">
                    <div id="header">
                        <div id="logo">
                            <h1><a href="${pageContext.request.contextPath}">Tiger</a></h1>
                            <p>design by Xu,wuji
                            </p>
                        </div>
                    </div>
                </div>
                <!-- end #header -->
                <div id="page">
                    <div id="page-bgtop">
                        <div id="page-bgbtm">
                            <div id="content">
                                <div id="menu">
                                    <ul>
                                        <c:set var="latestUrl" scope="session" value="${pageContext.request.contextPath}/search/index?keyword=${keyword}&pageNum=1&orderBy=" />
                                        <li class="current_page_item"><a href="${latestUrl}">最新</a></li>
                                        <!--  <c:set var="hotUrl" scope="session" value="${pageContext.request.contextPath}/search/index?keyword=${keyword}&pageNum=1&orderBy=commentNum" />
                                        <li><a href="${hotUrl}">最热</a></li>-->
                                    </ul>
                                </div>


                                <c:forEach items="${searchResult}" var="item">
                                    <div class="post">
                                        <div>
                                            <c:set var="pageUrl" scope="session" value="${pageContext.request.contextPath}/news/${item.id}" />
                                            <h2 class="title">
							<a href="${pageUrl}"> ${item.title}</a>
						</h2>
                                            <p class="meta">
                                                <i class="fa fa-calendar"></i> ${item.time} &nbsp&nbsp&nbsp&nbsp<i class="fa fa-bars"></i> ${item.type} &nbsp&nbsp&nbsp&nbsp<i class="fa fa-commenting"></i> ${item.commentNum}
                                                <a href="#"></a>
                                            </p>
                                            <div class="entry">
                                                <p style="height:200px"><img src="${item.imgLink}" width="186" height="186" alt="" class="alignleft border" />${item.introduce}</p>
                                                <p>

                                                </p>
                                            </div>

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
                                &nbsp;&nbsp;当前第 <span id="currentPage">${pageNum}</span>页&nbsp;&nbsp;
                                <c:if test="${current < total}">
                                    <c:set var="url" scope="session" value="${pageContext.request.contextPath}/search/index?keyword=${keyword}&pageNum=${next}&orderBy=${orderBy}" />
                                    <c:set var="lastPageUrl" scope="session" value="${pageContext.request.contextPath}/search/index?keyword=${keyword}&pageNum=${totalNum}&orderBy=${orderBy}" />
                                    <span><a href="${url}">下一页</a></span>
                                    <span><a href="${lastPageUrl}">尾页</a></span>
                                </c:if>
                                共<span id="totalPage">${totalNum}</span>页&nbsp;&nbsp;
                                <!--end page pagination-->
                                <div style="clear: both;">&nbsp;</div>
                            </div>
                            <!-- end #content -->
                            <div id="sidebar">
                                <ul>
                                    <li>
                                        <form method="get" action="${pageContext.request.contextPath}/search/index">
                                            <fieldset>
                                                <input type="text" name="keyword" id="search-text" size="15" placeholder="标题／关键字" style="width:60%;border: 6px solid #EEE7DF;" />
                                                <input type="hidden" name="pageNum" id="search-text" size="15" />
                                                <input type="hidden" name="orderBy" id="search-text" size="15" />
                                                <button type="submit" class="btn btn-info" value="GO">GO</button>
                                            </fieldset>
                                        </form>
                                    </li>
                                </ul>
                                <ul>
                                    <li>
                                        <h2>TIGER</h2>
                                        <p>本引擎通过中文分词技术，对关键词进行检索</p>
                                    </li>
                                    <li>
                                        <h2><a href="${latestUrl}">类别</a></h2>
                                        <ul>

                                            <c:forEach items="${categories}" var="category">
                                                <c:set var="categoryUrl" scope="session" value="${pageContext.request.contextPath}/search/category?keyword=${keyword}&pageNum=&orderBy=${orderBy}&category=${category}" />
                                                <li><a href="${categoryUrl}">${category}</a></li>
                                            </c:forEach>
                                        </ul>
                                    </li>

                                    <li>
                                        <h2><a href="${latestUrl}">时间</a></h2>
                                        <ul>
                                            <c:forEach items="${times}" var="t">
                                                <c:set var="timeUrl" scope="session" value="${pageContext.request.contextPath}/search/time?keyword=${keyword}&pageNum=&orderBy=${orderBy}&time=${t}" />
                                                <li><a href="${timeUrl}">${t}</a></li>
                                            </c:forEach>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                            <!-- end #sidebar -->
                            <div style="clear: both;">&nbsp;</div>
                        </div>
                    </div>
                </div>
                <!-- end #page -->
            </div>


            <div id="footer">
                <p>Copyright (c) Xu,Wuji</p>
            </div>
            <!-- end #footer -->
        </body>
        <script type="text/javascript">
            $(document).ready(function () {

                // getPage("NB");
            });

            function getPage(kw) {
                $
                    .ajax({
                        type: "GET",
                        url: "http://localhost:8080/backend/search/pageInfo?keyword=" + kw,
                    }).done(function (data) {
                        $('#totalPage').html(data.lastPage);
                        console.log(data.lastPage);
                    });
            }
        </script>

        </html>