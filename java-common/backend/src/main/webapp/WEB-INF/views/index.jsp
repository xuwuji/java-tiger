<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta name="keywords" content="Calendar, Date & Time Widget Widget Responsive, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design" />

        <title>welcome</title>

        <script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/newsIndex/underscore-min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/newsIndex/moment-2.2.1.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/newsIndex/clndr.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/newsIndex/site.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/newsIndex/jssor.slider.mini.js"></script>

        <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/css/newsIndex/style.css" rel='stylesheet' type='text/css' />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/newsIndex/clndr.css" type="text/css" />



    </head>

    <body onload="startTime()">
        <script type="application/x-javascript">
            addEventListener("load", function() {
                setTimeout(hideURLbar, 0);
            }, false);

            function hideURLbar() {
                window.scrollTo(0, 1);
            }

        </script>

        <script>
            function startTime() {
                var today = new Date();
                var h = today.getHours();
                var m = today.getMinutes();
                var s = today.getSeconds();
                m = checkTime(m);
                s = checkTime(s);
                document.getElementById('txt').innerHTML = h + ":" + m + ":" + s;
                var t = setTimeout(startTime, 500);
            }

            function checkTime(i) {
                if (i < 10) {
                    i = "0" + i
                }; // add zero in front of numbers < 10
                return i;
            }

        </script>

        <style>
            /* jssor slider bullet navigator skin 01 css */
            /*
        .jssorb01 div           (normal)
        .jssorb01 div:hover     (normal mouseover)
        .jssorb01 .av           (active)
        .jssorb01 .av:hover     (active mouseover)
        .jssorb01 .dn           (mousedown)
        */
            
            .jssorb01 {
                position: absolute;
            }
            
            .jssorb01 div,
            .jssorb01 div:hover,
            .jssorb01 .av {
                position: absolute;
                /* size of bullet elment */
                width: 12px;
                height: 12px;
                filter: alpha(opacity=70);
                opacity: .7;
                overflow: hidden;
                cursor: pointer;
                border: #000 1px solid;
            }
            
            .jssorb01 div {
                background-color: gray;
            }
            
            .jssorb01 div:hover,
            .jssorb01 .av:hover {
                background-color: #d3d3d3;
            }
            
            .jssorb01 .av {
                background-color: #fff;
            }
            
            .jssorb01 .dn,
            .jssorb01 .dn:hover {
                background-color: #555555;
            }
            /* jssor slider arrow navigator skin 05 css */
            /*
        .jssora05l                  (normal)
        .jssora05r                  (normal)
        .jssora05l:hover            (normal mouseover)
        .jssora05r:hover            (normal mouseover)
        .jssora05l.jssora05ldn      (mousedown)
        .jssora05r.jssora05rdn      (mousedown)
        */
            
            .jssora05l,
            .jssora05r {
                display: block;
                position: absolute;
                /* size of arrow element */
                width: 40px;
                height: 40px;
                cursor: pointer;
                background: url('${pageContext.request.contextPath}/resources/img/newsIndex/a17.png') no-repeat;
                overflow: hidden;
            }
            
            .jssora05l {
                background-position: -10px -40px;
            }
            
            .jssora05r {
                background-position: -70px -40px;
            }
            
            .jssora05l:hover {
                background-position: -130px -40px;
            }
            
            .jssora05r:hover {
                background-position: -190px -40px;
            }
            
            .jssora05l.jssora05ldn {
                background-position: -250px -40px;
            }
            
            .jssora05r.jssora05rdn {
                background-position: -310px -40px;
            }
            /* jssor slider thumbnail navigator skin 09 css */
            
            .jssort09-600-45 .p {
                position: absolute;
                top: 0;
                left: 0;
                width: 600px;
                height: 45px;
            }
            
            .jssort09-600-45 .t {
                font-family: verdana;
                font-weight: normal;
                position: absolute;
                width: 100%;
                height: 100%;
                top: 0;
                left: 0;
                color: #fff;
                line-height: 45px;
                font-size: 20px;
                padding-left: 10px;
            }

        </style>

        <h1>热点新闻</h1>

        <div class="content">

            <div class="row">
                <div class="col-xs-8 col-xs-offset-2">
                    <div class="input-group">
                        <div class="input-group-btn search-panel">


                            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                <span id="search_concept">Filter by</span> <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="#contains">Contains</a></li>
                                <li><a href="#its_equal">It's equal</a></li>
                                <li><a href="#greather_than">Greather than ></a></li>
                                <li><a href="#less_than">Less than < </a></li>
                                <li class="divider"></li>
                                <li><a href="#all">Anything</a></li>
                            </ul>
                        </div>
                        <input type="hidden" name="search_param" value="all" id="search_param">
                        <input type="text" class="form-control" name="x" placeholder="Search term...">
                        <span class="input-group-btn">
                    <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-search"></span></button>
                        </span>
                    </div>
                </div>
            </div>



            <br>
            <!--slider-->
            <div class="calender">
                <div id="jssor_1" style="position: relative; margin: 0 auto; top: 0px; left: 0px; width: 600px; height: 500px; overflow: hidden; visibility: hidden;">
                    <!-- Loading Screen -->
                    <div data-u="loading" style="position: absolute; top: 0px; left: 0px;">
                        <div style="filter: alpha(opacity=70); opacity: 0.7; position: absolute; display: block; top: 0px; left: 0px; width: 100%; height: 100%;"></div>
                        <div style="position:absolute;display:block;background:url('${pageContext.request.contextPath}/resources/img/newsIndex/loading.gif') no-repeat center center;top:0px;left:0px;width:100%;height:100%;"></div>
                    </div>
                    <div data-u="slides" style="cursor: default; position: relative; top: 0px; left: 0px; width: 600px; height: 500px; overflow: hidden;" id="sliderContent">

                    </div>
                    <!-- Thumbnail Navigator -->
                    <div data-u="thumbnavigator" class="jssort09-600-45" style="position:absolute;bottom:0px;left:0px;width:600px;height:45px;">
                        <div style="position: absolute; top: 0; left: 0; width: 100%; height:100%; background-color: #000; filter:alpha(opacity=40.0); opacity:0.4;"></div>
                        <!-- Thumbnail Item Skin Begin -->
                        <div data-u="slides" style="cursor: default;">
                            <div data-u="prototype" class="p">
                                <div data-u="thumbnailtemplate" class="t"></div>
                            </div>
                        </div>
                        <!-- Thumbnail Item Skin End -->
                    </div>
                    <!-- Bullet Navigator -->
                    <div data-u="navigator" class="jssorb01" style="bottom:16px;right:16px;">
                        <div data-u="prototype" style="width:12px;height:12px;"></div>
                    </div>
                    <!-- Arrow Navigator -->
                    <span data-u="arrowleft" class="jssora05l" style="top:0px;left:8px;width:40px;height:40px;" data-autocenter="2"></span>
                    <span data-u="arrowright" class="jssora05r" style="top:0px;right:8px;width:40px;height:40px;" data-autocenter="2"></span>
                </div>
            </div>
            <!--slider-->

            <!--news-->
            <div class="date">
                <div id="dd1" class="wrapper-dropdown-3" tabindex="1">
                    <span><img
					src="${pageContext.request.contextPath}/resources/img/newsIndex/nav.png"
					alt="Navbar" /></span>
                    <ul class="dropdown">
                        <div id="typeContent"></div>

                    </ul>
                    <script type="text/javascript">
                        function DropDown(el) {
                            this.dd = el;
                            this.initEvents();
                        }
                        DropDown.prototype = {
                            initEvents: function() {
                                var obj = this;
                                obj.dd.on('click', function(event) {
                                    $(this).toggleClass('active');
                                    event.stopPropagation();
                                });
                            }
                        }
                        $(function() {
                            var dd = new DropDown($('#dd1'));
                            $(document).click(function() {
                                // all dropdowns
                                $('.wrapper-dropdown-3').removeClass('active');
                            });
                        });

                    </script>
                </div>

                <div id="txt"></div>

                <div class="dmy">
                    <script type="text/javascript">
                        var mydate = new Date()
                        var year = mydate.getYear()
                        if (year < 1000)
                            year += 1900
                        var day = mydate.getDay()
                        var month = mydate.getMonth()
                        var daym = mydate.getDate()
                        if (daym < 10)
                            daym = "0" + daym
                        var dayarray = new Array("星期日", "星期一", "星期二", "星期三", "星期四",
                            "星期五", "星期六")
                        var montharray = new Array("一月", "二月", "三月", "四月", "五月",
                            "六月", "七月", "八月", "九月", "十月", "十一月", "十二月")
                        document
                            .write("" + dayarray[day] + ", " + montharray[month] + " " + daym + ", " + year + "")

                    </script>
                </div>
                <div id="news">
                    <ul class="reminder" id="newsContent">
                    </ul>
                </div>
            </div>
            <!--news-->

        </div>

        <div class="clear"></div>

        <div class="footer">
            <p>
                Copyright &copy; Wuji,Xu</a>
            </p>
        </div>

        <script type="text/javascript">


        </script>
    </body>

    <script type="text/javascript">
        $(document).ready(function() {
            getDailyHotNews(1, '');
            getType();
            ScaleSlider();
            getDailyHotNews(2, '');
        });




        $(document).ready(function(e) {
            $('.search-panel .dropdown-menu').find('a').click(function(e) {
                e.preventDefault();
                var param = $(this).attr("href").replace("#", "");
                var concept = $(this).text();
                $('.search-panel span#search_concept').text(concept);
                $('.input-group #search_param').val(param);
            });
        });




        jssor_slider1_starter = function(containerId) {
            var jssor_1_SlideshowTransitions = [{
                $Duration: 1200,
                x: -0.3,
                $During: {
                    $Left: [0.3, 0.7]
                },
                $Easing: {
                    $Left: $Jease$.$InCubic,
                    $Opacity: $Jease$.$Linear
                },
                $Opacity: 2
            }, {
                $Duration: 1200,
                x: 0.3,
                $SlideOut: true,
                $Easing: {
                    $Left: $Jease$.$InCubic,
                    $Opacity: $Jease$.$Linear
                },
                $Opacity: 2
            }];

            var jssor_1_options = {
                $AutoPlay: true,
                $SlideshowOptions: {
                    $Class: $JssorSlideshowRunner$,
                    $Transitions: jssor_1_SlideshowTransitions,
                    $TransitionsOrder: 1
                },
                $ArrowNavigatorOptions: {
                    $Class: $JssorArrowNavigator$
                },
                $BulletNavigatorOptions: {
                    $Class: $JssorBulletNavigator$
                },
                $ThumbnailNavigatorOptions: {
                    $Class: $JssorThumbnailNavigator$,
                    $Cols: 1,
                    $Align: 0,
                    $NoDrag: true
                }
            };

            var jssor_slider1 = new $JssorSlider$(containerId, jssor_1_options);

        };

        //responsive code begin
        //you can remove responsive code if you don't want the slider scales while window resizing
        function ScaleSlider() {
            var refSize = jssor_1_slider.$Elmt.parentNode.clientWidth;
            if (refSize) {
                refSize = Math.min(refSize, 600);
                jssor_1_slider.$ScaleWidth(refSize);
            } else {
                window.setTimeout(ScaleSlider, 30);
            }
        }


        function getDailyHotNews(tag, type) {
            console.log(type);
            $
                .ajax({
                    type: "GET",
                    url: "http://localhost:8080/backend/index/hotnews?time=&type=" + type,
                    contentType: " charset=utf-8",
                }).done(function(data) {
                    if (tag == 1) {
                        fixNewsContent(data);
                    }

                    if (tag == 2) {}
                    fixSilder(data);
                });
        }

        function fixSilder(data) {
            var str = '';
            $.each(data, function(index, news) {
                str = '<div data - p = "112.50" style = "display: none;" >' + '<a href=\'' + news.link + '\'>' + '<img data - u = "image" src =\'' + news.imgLink + '\'' + ' /></a>' + ' <div data - u = "thumb" > <a href =\'' + news.link + '\'>' + news.title + '</a></div ></div > ' + str;
            });
            $('#sliderContent').html(str);
            jssor_slider1_starter('jssor_1');

        }

        function fixNewsContent(data) {

            var str = '';
            $.each(data, function(index, news) {
                str = '<li> <a href=\'' + news.link + '\'>' + news.title + '</a></li>' + str;
                console.log(news.title);
            });
            $('#newsContent').html(str);
        }

        function getType() {
            var typePart = '';
            $.ajax({
                type: "GET",
                url: "http://localhost:8080/backend/index/type",
            }).done(
                function(data) {
                    $.each(data, function(index, type) {
                        typePart = typePart + '<li onclick=getDailyHotNews(1,\'' + type + '\')> ' + type + '</li>'
                        console.log(type);
                    });
                    typePart = typePart + '</li>';
                    $('#typeContent').html(typePart);
                    $('#searchTypeContent').html(typePart);
                });
        }


        function searchDropDown() {
            $('.search-panel .dropdown-menu').find('a').click(function(e) {
                e.preventDefault();
                var param = $(this).attr("href").replace("#", "");
                var concept = $(this).text();
                $('.search-panel span#search_concept').text(concept);
                $('.input-group #search_param').val(param);
            });
        }

    </script>

    </html>
