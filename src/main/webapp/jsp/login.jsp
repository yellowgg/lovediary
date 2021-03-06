<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="include/publicVariables.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登录</title>
    <link rel="shortcut icon" type="image/x-icon" href="<%=basePath%>/images/favicon.ico"/>
    <link rel="stylesheet" href="<%=basePath%>/css/bootstrap.min.css" type="text/css"/>
    <link rel="stylesheet" href="<%=basePath%>/css/base.css" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/normalize.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/demo.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/component.css"/>
    <!--引入bootstrap中js文件，注意必须先引入jquery.min.js 后引入js-->
    <script src="<%=basePath%>/js/jquery.min.js" type="text/javascript"></script>
    <script src="<%=basePath%>/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="<%=basePath%>/js/modernizr.custom.js" type="text/javascript"></script>
</head>
<body>
<div style="width: 100%;height: 100%;position:fixed">
    <div id="st-container" class="st-container">
        <div class="st-pusher">
            <%@ include file="include/navigation.jsp" %>
            <div class="st-content"
                 style="background: url('<%=basePath%>/images/bg.jpg') no-repeat center 0px;background-position: center 0;background-size: cover;height:100%">
                <div class="st-content-inner">
                    <%--两个头像条--%>
                    <%@ include file="include/headPic.jsp" %>
                    <%--登录表单--%>
                    <div class="col-md-5"></div>
                    <div class="col-md-2" style="margin-top:1.7%;text-align:center">
                        <div class="mycenter">
                            <form id="from" method="post" action="<%=basePath%>/user/login">
                                <div class="col-md-12">
                                    <h2 style="color: #1380ab">Σ(っ°Д °;)っ</h2>
                                    <input type="text" class="form-control" name="username" required
                                           placeholder="请输入用户名" autofocus/>
                                </div>
                                <div class="col-md-12">
                                    <input type="password" class="form-control" id="password" autofocus
                                           required placeholder="请输入密码"/>
                                </div>
                                <div class="col-md-12">
                                    <button type="submit" id="btn" class="btn btn-success" onclick="subMit()"> 登录
                                    </button>
                                </div>
                                <input type="hidden" id="md5pwd" name="password"/>
                            </form>
                        </div>
                    </div>
                    <div class="col-md-5"></div>
                    <%--警告框--%>
                    <c:if test="${not empty errorMsg}">
                        <div class="col-md-12">
                            <div class="col-md-5"></div>
                            <div class="col-md-2">
                                <div class="alert alert-warning alert-dismissible" role="alert">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                        ${errorMsg}
                                </div>
                            </div>
                            <div class="col-md-5"></div>
                        </div>
                    </c:if>
                    <%--页脚--%>
                    <div class="col-md-12" align="center" style="padding-top: 18.2%">
                        <%@include file="include/footer.jsp" %>
                    </div>
                    <%--导航按钮--%>
                    <%@ include file="include/navigationButton.jsp" %>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    var t = '<%=floatContent%>'.split("");
    <%/* 然后fontFloat.js就会使用t*/%>

    function subMit() {
        var password = $("input[id='password']").val();
        //加密成md5
        var pwd = $.md5(password);
        $("#md5pwd").val(pwd);
    }
</script>
<script src="<%=basePath%>/js/classie.js" type="text/javascript"></script>
<script src="<%=basePath%>/js/sidebarEffects.js" type="text/javascript"></script>
<script src="<%=basePath%>/js/fontFloat.js" type="text/javascript"></script>
<script src="<%=basePath%>/js/md5.js" type="text/javascript"></script>
</body>
</html>



