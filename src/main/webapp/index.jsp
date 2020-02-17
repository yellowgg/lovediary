<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="jsp/include/publicVariables.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>大王派我来寻山</title>
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
            <nav class="st-menu st-effect-6" id="menu-6">
                <h2 class="icon icon-stack">❤️<%=res.getString("NavigationTitle")%>❤️</h2>
                <ul>
                    <li><a href="<%=basePath%>"><%=res.getString("NavigationIndexText") %>
                    </a></li>
                    <li><a href="<%=basePath%>/diary/list"><%=res.getString("NavigationDiaryText") %>
                    </a></li>
                    <li><a href="<%=basePath%>/user/setting"><%=res.getString("NavigationSetText") %>
                    </a></li>
                    <c:if test="${empty crrentUser}">
                        <li><a href="<%=basePath%>/user/loginUI"><%=res.getString("NavigationLoginText") %>
                        </a></li>
                    </c:if>
                    <c:if test="${not empty crrentUser}">
                        <li><a href="<%=basePath%>/user/logout"><%=res.getString("NavigationLogoutText") %>
                        </a></li>
                    </c:if>
                    <li><a href="<%=basePath%>/other/playtheball"><%=res.getString("NavigationPlayBallText") %>
                    </a></li>
                    <li><a href="<%=basePath%>/other/about"><%=res.getString("NavigationAboutText") %>
                    </a></li>
                </ul>
            </nav>
            <div class="st-content"
                 style="background: url('images/bg.jpg') no-repeat center 0px;background-position: center 0;background-size: cover;height:100%">
                <div class="st-content-inner">
                    <%--两个头像条--%>
                    <%@ include file="jsp/include/headPic.jsp" %>
                    <%--时间条--%>
                    <div class="timer-box">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <h2 class="timehead">
                                        <%=res.getString("WeAlreadyWtihTime") %>
                                    </h2>
                                    <div id="ctimer" style="margin-left: 36.5%">
                                        <span> <h3>${loveYear}</h3> 年 </span>
                                        <span> <h3>${loveMonth}</h3> 月 </span>
                                        <span> <h3>${loveDay}</h3> 日 </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--页脚--%>
                    <div class="col-md-12" align="center" style="padding-top: 15%">
                        <%@include file="jsp/include/footer.jsp" %>
                    </div>
                    <%--导航按钮--%>
                    <%@ include file="jsp/include/navigationButton.jsp" %>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    var t = '<%=floatContent%>'.split("");
    <%/* 然后fontFloat.js就会使用t*/%>
</script>
<script src="<%=basePath%>/js/classie.js" type="text/javascript"></script>
<script src="<%=basePath%>/js/sidebarEffects.js" type="text/javascript"></script>
<script src="<%=basePath%>/js/fontFloat.js" type="text/javascript"></script>
</body>
</html>



