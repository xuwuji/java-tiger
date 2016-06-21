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

            <title>个人主页</title>
            <script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
            <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
            <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
            <link href="${pageContext.request.contextPath}/resources/css/user/dashboard.css" rel="stylesheet" type="text/css" media="all" />
            <!-- DataTables CSS -->
            <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/datatable/css/jquery.dataTables.css">
            <!-- DataTables -->
            <script type="text/javascript" charset="utf8" src="${pageContext.request.contextPath}/resources/datatable/js/jquery.dataTables.js"></script>

            <!-- Custom Theme files -->

        </head>

        <body>
            <nav class="navbar navbar-inverse navbar-fixed-top">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#">个人中心</a>
                        <a class="navbar-brand" href="${pageContext.request.contextPath}">首页</a>
                    </div>
                    <div id="navbar" class="navbar-collapse collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="${pageContext.request.contextPath}/login/logout">退出</a></li>
                        </ul>
                        <form class="navbar-form navbar-right">
                            <input type="text" class="form-control" placeholder="Search...">
                        </form>
                    </div>
                </div>
            </nav>

            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-3 col-md-2 sidebar">
                        <ul class="nav nav-sidebar">
                            <li class="active"><a href="#">Overview <span class="sr-only">(current)</span></a></li>
                            <li><a href="#">Reports</a></li>
                            <li><a href="#">Analytics</a></li>
                            <li><a href="#">Export</a></li>
                        </ul>
                        <ul class="nav nav-sidebar">
                            <li><a href="">Nav item</a></li>
                            <li><a href="">Nav item again</a></li>
                            <li><a href="">One more nav</a></li>
                            <li><a href="">Another nav item</a></li>
                            <li><a href="">More navigation</a></li>
                        </ul>
                    </div>
                    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                        <h1>欢迎回来</h1>
                        <h5 class="page-header">您上一次登录时间为：${lastLoginTime} </h5>

                        <div class="row placeholders">
                            <div class="col-xs-6 col-sm-3 placeholder">
                                <form id="update_img_form" action="${pageContext.request.contextPath}/user/profile/img/update" method="post" enctype="multipart/form-data">
                                    <img src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" width="200" height="200" class="img-responsive" alt="Generic placeholder thumbnail" id="profileImg">
                                    <br>
                                    <input type="file" id="product_image_url" name="img" />
                                    <br>
                                    <h4><button  type="submit"  onclick="updateProfileImg">更换头像</button></h4>
                                </form>
                                <span class="text-muted">大小不要超过50k</span>
                            </div>

                        </div>

                        <h2 class="sub-header">浏览历史</h2>
                        <div class="table-responsive">
                            <table id="table_id" class="display">
                                <thead>
                                    <tr>
                                        <th>标题</th>
                                        <th>类别</th>
                                        <th>浏览时间</th>
                                    </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </body>
        <script type="text/javascript">
            $(document).ready(function() {
                getHistory();
                displayProfileImg();
            });


            function getHistory() {
                $.ajax({
                        type: "GET",
                        url: "${pageContext.request.contextPath}/history",
                    })
                    .done(function(data) {
                        console.log(data);
                        $('#table_id').DataTable({
                            data: data,
                            columns: [{
                                data: '0'
                            }, {
                                data: '1'
                            }, {
                                data: '2'
                            }],
                            order: [
                                [2, "desc"]
                            ]
                        })
                    });
            }

            function displayProfileImg() {
                $.ajax({
                        type: "GET",
                        url: "${pageContext.request.contextPath}/user/profile/img",
                    })
                    .done(function(data) {
                        console.log(data);
                        $('#profileImg').attr("src", data);
                    });
            }


            function updateProfileImg() {
                var $form = $('#update_img_form');
                $form.submit();
            }

        </script>

        </html>
