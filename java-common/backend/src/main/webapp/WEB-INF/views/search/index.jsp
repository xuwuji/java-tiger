<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <h1><a href="#">The Fences  </a></h1>
            <p><em> template design by <a href="http://www.freecsstemplates.org/">Free CSS Templates</a></em></p>
        </div>
        <hr />
        <!-- end #logo -->
        <div id="header">
            <div id="menu">
                <ul>
                    <li><a href="#" class="first">最热</a></li>
                    <li class="current_page_item"><a href="#">最新</a></li>
                    <li><a href="#">#</a></li>
                    <li><a href="#">#</a></li>
                </ul>
            </div>
            <!-- end #menu -->
            <div id="search">
                <form method="get" action="">
                    <fieldset>
                        <input type="text" name="s" id="search-text" size="15" />
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
                    <h2 class="title"><a href="#"><%=(String)list.get(i).title%></td></a></h2>
                    <p class="meta">Sunday, April 26, 2009 7:27 AM Posted by${searchResult} <a href="#">Someone</a></p>
                    <div class="entry">
                        <p>This is <strong>The Fences </strong>, a free, fully standards-compliant CSS template designed by <a href="http://www.freecsstemplates.org/">Free CSS Templates</a>, released for free under the <a href="http://creativecommons.org/licenses/by/2.5/">Creative Commons Attribution 2.5</a> license. You're free to use this template for anything as long as you link back to <a href="http://www.freecsstemplates.org/">my site</a>. Enjoy :)</p>
                        <p>Sed lacus. Donec lectus. Nullam pretium nibh ut turpis. Nam bibendum. In nulla tortor, elementum ipsum. Proin imperdiet est. Phasellus dapibus semper urna. Pellentesque ornare, orci in felis. </p>
                    </div>
                </div>




            </div>
            <!-- end #content -->
            <div id="sidebar">
                <ul>
                    <li>
                        <h2>Aliquam tempus</h2>
                        <p>Mauris vitae nisl nec metus placerat perdiet est. Phasellus dapibus semper urna. Pellentesque ornare, orci in consectetuer hendrerit, volutpat.</p>
                    </li>
                    <li>
                        <h2>Pellenteque ornare </h2>
                        <ul>
                            <li><a href="#">Nec metus sed donec</a></li>
                            <li><a href="#">Magna lacus bibendum mauris</a></li>
                            <li><a href="#">Velit semper nisi molestie</a></li>
                            <li><a href="#">Eget tempor eget nonummy</a></li>
                            <li><a href="#">Nec metus sed donec</a></li>
                            <li><a href="#">Velit semper nisi molestie</a></li>
                            <li><a href="#">Eget tempor eget nonummy</a></li>
                            <li><a href="#">Nec metus sed donec</a></li>
                        </ul>
                    </li>
                    <li>
                        <h2>Turpis nulla</h2>
                        <ul>
                            <li><a href="#">Nec metus sed donec</a></li>
                            <li><a href="#">Magna lacus bibendum mauris</a></li>
                            <li><a href="#">Velit semper nisi molestie</a></li>
                            <li><a href="#">Eget tempor eget nonummy</a></li>
                            <li><a href="#">Nec metus sed donec</a></li>
                            <li><a href="#">Nec metus sed donec</a></li>
                            <li><a href="#">Magna lacus bibendum mauris</a></li>
                            <li><a href="#">Velit semper nisi molestie</a></li>
                            <li><a href="#">Eget tempor eget nonummy</a></li>
                            <li><a href="#">Nec metus sed donec</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <!-- end #sidebar -->
            <div style="clear: both;">&nbsp;</div>
        </div>
        <!-- end #page -->
        <div id="footer">
            <p>Copyright (c) 2008 Sitename.com. All rights reserved. Design by <a href="http://www.freecsstemplates.org/">Free CSS Templates</a>.</p>
        </div>
        <!-- end #footer -->
    </body>
    <script type="text/javascript">
        $(document).ready(function() {

        });

        function getPage(pageNum, kw) {

        }

    </script>

    </html>
