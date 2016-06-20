<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${news.title}</title>
        <script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
        <link href="${pageContext.request.contextPath}/resources/css/search/style.css" rel="stylesheet" />
    </head>

    <body>
        <div id="logo">
            <h1>
			<a href="${pageContext.request.contextPath}">首页</a>
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
                    <li><a href="${hotUrl}" class="first">#</a></li>
                    <c:set var="latestUrl" scope="session" value="${pageContext.request.contextPath}/search/index?keyword=${keyword}&pageNum=1&orderBy=time" />
                    <li class="current_page_item"><a href="${latestUrl}">#</a></li>
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
                <div class="post">
                    <h2 class="title">${news.title}</h2>
                    <p class="meta">${news.time}
                        <a href="#"></a>
                    </p>
                    <div class="entry">
                        ${news.content}
                    </div>
                </div>
            </div>
            <!-- end #content -->
            <div style="clear: both;">&nbsp;</div>
        </div>
    </body>

    </html>
