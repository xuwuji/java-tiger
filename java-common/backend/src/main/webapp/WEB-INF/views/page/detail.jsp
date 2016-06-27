<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${news.title}</title>
        <script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
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
        </div>
        <div id="logo" style="padding-top: 40px;padding-bottom: 40px;">
            <h1>
			<a href="${pageContext.request.contextPath}">Tiger</a>
		</h1>
            <p>
                <em> Design by Xu,Wuji</em>
            </p>
        </div>
        <div id="page">
            <div id="content" style="width:100%">
                <div class="post">
                    <h2 class="title">${news.title}</h2>
                    <!--meta-->
                    <p class="meta" style="margin-top: 10px;">
                        <i class="fa fa-calendar"></i> ${news.time} &nbsp&nbsp&nbsp&nbsp<i class="fa fa-bars"></i> ${news.type} &nbsp&nbsp&nbsp&nbsp<i class="fa fa-commenting"></i> ${news.commentNum}
                        <a href="#"></a>
                    </p>
                    <!--meta-->
                    <div id="newsContent">${news.content}</div>
                </div>
            </div>
            <!-- end #content -->
            <div style="clear: both;">&nbsp;</div>
        </div>
    </body>
    <script type="text/javascript">
        $(document).ready(function() {
            $('#Cnt-Main-Article-QQ').css('width', '90%').css('margin', '0 auto');
        });

    </script>

    </html>
