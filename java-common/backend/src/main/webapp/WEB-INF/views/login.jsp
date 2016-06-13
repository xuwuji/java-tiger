<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta name="keywords" content="login page" />
        <title>login</title>
        <script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
        <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/css/newsIndex/style.css" rel='stylesheet' type='text/css' />
        <link href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" rel="stylesheet">
    </head>

    <body>
        <div id="login-overlay" class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel">
					Login to <b>YaelsEverythingStore.com</b>
				</h4> or go back to our <a href="./index.jsp">main site</a>.
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-xs-6">
                            <div class="well">
                                <form id="loginForm" method="POST" action="${pageContext.request.contextPath}/login/action">
                                    <div class="form-group">
                                        <label for="username" class="control-label" style="color:#FF0000">${ErrorMessage}</label>
                                    </div>
                                    <div class="form-group">
                                        <label for="username" class="control-label">Username</label>
                                        <input type="text" class="form-control" name="username" value="" required="" title="Please enter your username" placeholder="username"> <span class="help-block"></span>
                                    </div>
                                    <div class="form-group">
                                        <label for="password" class="control-label">Password</label>
                                        <input type="password" class="form-control" name="password" placeholder="password" value="" required="" title="Please enter your password"> <span class="help-block"></span>
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <input type='hidden' value='off' name='remember'>
                                            <input type="checkbox" name="remember" id="remember"> Remember login
                                        </label>
                                        <p class="help-block">(if this is a private computer)</p>
                                    </div>
                                    <button type="submit" value="login" name="submit" class="btn btn-success btn-block">Login</button>
                                </form>
                            </div>
                        </div>
                        <div class="col-xs-6">
                            <p class="lead">
                                Register now for <span class="text-success">FREE</span>
                            </p>
                            <ul class="list-unstyled" style="line-height: 2">
                                <li><span class="fa fa-check text-success"></span> See all your orders</li>
                                <li><span class="fa fa-check text-success"></span> Shipping is always free</li>
                                <li><span class="fa fa-check text-success"></span> Save your favorites
                                </li>
                                <li><span class="fa fa-check text-success"></span> Fast checkout
                                </li>
                                <li><span class="fa fa-check text-success"></span> Get a gift <small>(only new customers)</small></li>
                                <li><span class="fa fa-check text-success"></span>Holiday discounts up to 30% off</li>
                            </ul>
                            <p>
                                <a href="${pageContext.request.contextPath}/register/index" class="btn btn-info btn-block">Yes
								please, register now!</a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </body>

    </html>
