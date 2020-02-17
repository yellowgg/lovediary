<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="include/publicVariables.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>关于</title>
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
                    <div class="col-md-12" style="margin-top:1.7%;text-align:center">
                        <h1>关于</h1>
                        <p>本站于2019年3月21日计划开发</p>
                        <p>这是我们的一周年的礼物，也是送给宝贝的礼物</p>
                        <p>一年来，我们开心过，难过过，生气过，杨过。但无论发生了什么，我们都能给彼此一份真挚的感情</p>
                        <p>我希望，我们能一起走得更远，把每一个明天过好，就是我们的未来</p>
                    </div>
                    <%--页脚--%>
                    <div class="col-md-12" align="center" style="padding-top: 16.9%">
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
</script>
<script src="<%=basePath%>/js/classie.js" type="text/javascript"></script>
<script src="<%=basePath%>/js/sidebarEffects.js" type="text/javascript"></script>
<script src="<%=basePath%>/js/fontFloat.js" type="text/javascript"></script>
</body>
</html>



