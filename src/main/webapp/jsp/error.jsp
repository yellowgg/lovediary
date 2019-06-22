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
    <title>错误页面</title>
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
            <%@ include file="navigation.jsp" %>
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
                    <div class="col-md-12"
                         style="margin-top:1.7%;text-align:center">
                        <h1>出现错误，请返回重试！</h1>
                    </div>
                    <%--页脚--%>
                    <div class="col-md-12" align="center"
                         style="padding-top: 24.4%">
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
</script>
<script src="<%=basePath%>/js/classie.js" type="text/javascript"></script>
<script src="<%=basePath%>/js/sidebarEffects.js"
        type="text/javascript"></script>
<script src="<%=basePath%>/js/fontFloat.js" type="text/javascript"></script>
</body>
</html>


。