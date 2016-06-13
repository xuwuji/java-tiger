<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta name="keywords" content="register" />
        <title>register</title>
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
                                <form id="loginForm" method="POST" action="${pageContext.request.contextPath}/register/action">
                                    <div class="form-group">
                                        <label for="username" class="control-label">用户名</label>
                                        <input type="text" class="form-control" name="username" value="" required="" title="Please enter your username" placeholder="" onchange="checkName(this.value);"> <span class="help-block"></span>
                                        <label for="username" class="control-label" style="color: #FF0000" id="usernameStatus"></label>
                                    </div>
                                    <div class="form-group">
                                        <label for="password" class="control-label">密码</label>
                                        <input type="password" class="form-control" name="password" placeholder="" value="" required="" title="Please enter your password" onchange="checkPassword(this.value);" id="passwordInput"> <span class="help-block"></span>
                                        <label for="username" class="control-label" style="color: #FF0000" id="passwordStatus"></label>
                                    </div>
                                    <div class="form-group">
                                        <label for="password" class="control-label">请重新输入一次密码</label>
                                        <input type="password" class="form-control" name="password" placeholder="" value="" required="" title="Please enter your password" onchange="checkRepeat(this.value);"> <span class="help-block"></span>
                                        <label for="username" class="control-label" style="color: #FF0000" id="repeatStatus"></label>
                                    </div>
                                    <button type="submit" value="login" name="submit" class="btn btn-success btn-block" id="registerButton">注册</button>
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
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <script type="text/javascript">
            function checkName(username) {
                //1. check username format is ok
                var regex = /^[0-9A-Za-z_]{6,15}$/
                if (!regex.test(username)) {
                    $('#usernameStatus').html('用户名不符合');
                    $('#registerButton').attr("disabled", "true");
                    return;
                } else {
                    $('#usernameStatus').html('');
                    $('#registerButton').attr("disabled", false);
                }
                //2. check no duplicated username
                $
                    .ajax({
                        type: "GET",
                        url: "${pageContext.request.contextPath}/register/checkNameIsDuplicated?username=" + username,
                        contentType: " charset=utf-8",
                    }).done(function(data) {
                        if (data) {
                            $('#usernameStatus').html('已经有相同的用户名存在');
                            $('#registerButton').attr("disabled", "true");
                        } else {
                            $('#usernameStatus').html('');
                            $('#registerButton').attr("disabled", false);
                        }
                    });
            }

            function checkPassword(password) {
                var regex = /^[0-9A-Za-z_]{6,15}$/
                if (!regex.test(password)) {
                    $('#passwordStatus').html('密码不符合');
                    $("#registerButton").attr("disabled", "true");
                } else {
                    $('#passwordStatus').html('');
                    $('#registerButton').attr("disabled", false);
                }
            }

            function checkRepeat(str) {
                console.log(str);
                var password = $('#passwordInput').val();
                console.log(password);
                if (password != str) {
                    $('#repeatStatus').html('两次密码不一致');
                    $('#registerButton').attr("disabled", "true");
                } else {
                    $('#repeatStatus').html('');
                    $('#registerButton').attr("disabled", false);
                }
            }

        </script>
    </body>

    </html>
