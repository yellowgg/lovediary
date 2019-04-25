<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登录</title>
    <link rel="shortcut icon" type="image/x-icon"
          href="<%=basePath%>/images/favicon.ico"/>
    <link rel="stylesheet" href="<%=basePath%>/css/bootstrap.min.css"
          type="text/css"/>
    <link rel="stylesheet" href="<%=basePath%>/css/base.css" type="text/css"/>
    <link rel="stylesheet" type="text/css"
          href="<%=basePath%>/css/normalize.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/demo.css"/>
    <link rel="stylesheet" type="text/css"
          href="<%=basePath%>/css/component.css"/>
    <!--引入bootstrap中js文件，注意必须先引入jquery.min.js 后引入js-->
    <script src="<%=basePath%>/js/jquery.min.js"
            type="text/javascript"></script>
    <script src="<%=basePath%>/js/bootstrap.min.js"
            type="text/javascript"></script>
    <script src="<%=basePath%>/js/modernizr.custom.js"
            type="text/javascript"></script>
</head>
<body>
<div style="width: 100%;height: 100%;position:fixed">
    <div id="st-container" class="st-container">
        <div class="st-pusher">
            <nav class="st-menu st-effect-6" id="menu-6">
                <h2 class="icon icon-stack">❤️关于我爱你❤️</h2>
                <ul>
                    <li><a href="<%=basePath%>">首页</a></li>
                    <li><a href="<%=basePath%>/diary/list">日记</a></li>
                    <li><a href="<%=basePath%>/user/setting">设置</a></li>
                    <c:if test="${empty crrentUser}">
                        <li><a href="<%=basePath%>/user/loginUI">登录</a></li>
                    </c:if>
                    <c:if test="${not empty crrentUser}">
                        <li><a href="<%=basePath%>/user/logout">注销</a></li>
                    </c:if>
                    <li><a href="<%=basePath%>/other/playtheball">玩个球</a></li>
                    <li><a href="<%=basePath%>/other/about">关于</a></li>
                </ul>
            </nav>
            <div class="st-content"
                 style="background-image: url('<%=basePath%>/images/bg.jpg');height:100%">
                <div class="st-content-inner">
                    <%--两个头像条--%>
                    <div class="col-md-2"></div>
                    <div class="col-md-4">
                        <div class="bridecol">
                            <div class="bridepic">
                                <a href="http://yellowgg.cn:8080/HT/">
                                    <img src="<%=basePath%>/images/girl.jpg"
                                         alt="bride"
                                         width="160"
                                         height="160">
                                </a>
                            </div>
                            <div class="brideinfo">
                                <h3>${girlname}</h3>
                            </div>
                            <div class="cplus glyphicon glyphicon-heart"></div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="groomcol">
                            <div class="groompic">
                                <a href="http://yellowgg.cn:8080/HG/">
                                    <img src="<%=basePath%>/images/boy.jpg"
                                         alt="groom"
                                         width="160"
                                         height="160">
                                </a>
                            </div>
                            <div class="groominfo">
                                <h3>${boyname}</h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2"></div>
                    <%--登录表单--%>
                    <div class="col-md-5"></div>
                    <div class="col-md-2" style="margin-top:1.7%;text-align:
                    center">
                        <div class="mycenter">
                            <form id="from" method="post"
                                  action="<%=basePath%>/user/login">
                                <div class="col-md-12">
                                    <h2 style="color: #1380ab">Σ(っ°Д °;)っ</h2>
                                    <input type="text" class="form-control"
                                           name="username"
                                           placeholder="请输入用户名"
                                           required
                                           autofocus/>
                                </div>
                                <div class="col-md-12">
                                    <input type="password"
                                           class="form-control"
                                           placeholder="请输入密码"
                                           id="password"
                                           required
                                           autofocus/>
                                </div>
                                <div class="col-md-12">
                                    <button type="submit" id="btn"
                                            class="btn btn-success"
                                            onclick="subMit()">
                                        登录
                                    </button>
                                </div>
                                <input type="hidden" id="md5pwd"
                                       name="password"/>
                            </form>
                        </div>
                    </div>
                    <div class="col-md-5"></div>
                    <%--警告框--%>
                    <c:if test="${not empty errorMsg}">
                        <div class="col-md-12">
                            <div class="col-md-5"></div>
                            <div class="col-md-2">
                                <div class="alert alert-warning alert-dismissible"
                                     role="alert">
                                    <button type="button" class="close"
                                            data-dismiss="alert"
                                            aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                        ${errorMsg}
                                </div>
                            </div>
                            <div class="col-md-5"></div>
                        </div>
                    </c:if>
                    <%--页脚--%>
                    <div class="col-md-12" align="center"
                         style="padding-top: 18.2%">
                        <p>Copyright@2019 大王派我来寻山 桂ICP备18009250号-1</p>
                        <p>技术支持：yellowgg
                            <a href="https://github.com/yellowgg"
                               target="_blank">https://github.com/yellowgg</a>
                        </p>
                    </div>
                    <%--导航按钮--%>
                    <div class="main clearfix">
                        <div id="st-trigger-effects" class="column">
                            <button data-effect="st-effect-6"
                                    style="top:3px;left:3px;position:fixed">
                                点我
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    <%
        // 先获取内容
        String floatContent = (String) application.getAttribute("floatcontent");
    %>
    var t = '<%=floatContent%>';
    t = t.split("");
    <%/* 然后fontFloat.js就会使用t*/%>

    function subMit() {
        var password = $("input[id='password']").val();
        //加密成md5
        var pwd = $.md5(password);
        $("#md5pwd").val(pwd);
    }

</script>
<script src="<%=basePath%>/js/classie.js" type="text/javascript"></script>
<script src="<%=basePath%>/js/sidebarEffects.js"
        type="text/javascript"></script>
<script src="<%=basePath%>/js/fontFloat.js" type="text/javascript"></script>
<script src="<%=basePath%>/js/md5.js" type="text/javascript"></script>
</body>
</html>



