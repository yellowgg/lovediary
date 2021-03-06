<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="include/publicVariables.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>日记列表</title>
    <link rel="shortcut icon" type="image/x-icon" href="<%=basePath%>/images/favicon.ico"/>
    <link rel="stylesheet" href="<%=basePath%>/css/bootstrap.min.css" type="text/css"/>
    <link rel="stylesheet" href="<%=basePath%>/css/base.css" type="text/css"/>
    <link rel="stylesheet" href="<%=basePath%>/css/diary.css" type="text/css"/>
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
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
                    <a name="top"></a>
                    <%--两个头像条--%>
                    <%@ include file="include/headPic.jsp" %>
                    <%--时间条,使用静态包含--%>
                    <%@ include file="include/weAlreadyWithTime.jsp" %>
                    <%--中间三部分--%>
                    <div class="col-md-12">
                        <%--日志的搜索框和分类栏,已抽取，静态包含--%>
                        <%@ include file="include/diaryLeft.jsp" %>
                        <%--日记搜索列表--%>
                        <div id="diaryMiddleSearchList" class="col-md-6" style="height: 100%">
                            <%--日记不为空就显示列表跟分页，否则就提示为空--%>
                            <c:if test="${not empty diariesOfTopCate.data}">
                                <c:forEach items="${diariesOfTopCate.data}" var="d">
                                    <div class="day">
                                        <div class="dayTime">${d.daytime}</div>
                                        <div class="diaryTitle">
                                            <a class="postTitle2"
                                               href="<%=basePath%>/diary/info/${d.diaryid}">${d.diarytitle} </a>
                                        </div>
                                        <div class="diarySubtitle">
                                            <div class="c_b_p_desc">${d.diarysubtitle} </div>
                                        </div>
                                        <div class="postDesc">posted @
                                            <fmt:formatDate value="${d.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                            <a href="<%=basePath%>/diary/modifyUI/${d.diaryid}" rel="nofollow">编辑 </a>
                                        </div>
                                    </div>
                                </c:forEach>
                                <!--分页 -->
                                <div style="width:200px;margin:0 auto;margin-top:130px;">
                                    <ul class="pagination" style="text-align:center; margin-top:10px;">
                                        <!-- 判断是否是第一页,是的话就把前一页箭头禁用 -->
                                        <c:if test="${diariesOfTopCate.pageNumber == 1 }">
                                            <li class="disabled">
                                                <a href="javascript:void(0)" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </li>
                                        </c:if>
                                        <!-- 不是第一页，就启用向前翻页 -->
                                        <c:if test="${diariesOfTopCate.pageNumber != 1 }">
                                            <li>
                                                <a href="<%=basePath%>/diary/findKeyPage/${diariesOfTopCate.pageNumber-1}&${searchKey}"
                                                   aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </li>
                                        </c:if>
                                        <!-- 展示所有页码 -->
                                        <c:forEach begin="1" end="${diariesOfTopCate.totalPage }" var="n">
                                            <!-- 判断是否是当前页，是的话就激活 -->
                                            <c:if test="${diariesOfTopCate.pageNumber == n }">
                                                <li class="active">
                                                    <a href="javascript:void(0)">${n }</a>
                                                </li>
                                            </c:if>
                                            <%--不是的话就只显示数字并且能跳转--%>
                                            <c:if test="${diariesOfTopCate.pageNumber != n }">
                                                <li>
                                                    <a href="<%=basePath%>/diary/findKeyPage/${n}&${searchKey}">${n }</a>
                                                </li>
                                            </c:if>
                                        </c:forEach>
                                        <!-- 判断是否是最后一页,是的话就把后一页箭头禁用 -->
                                        <c:if test="${diariesOfTopCate.pageNumber == diariesOfTopCate.totalPage }">
                                            <li class="disabled">
                                                <a href="javascript:void(0)" aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </c:if>
                                        <!-- 不是最后一页页，就启用向后翻页 -->
                                        <c:if test="${diariesOfTopCate.pageNumber != diariesOfTopCate.totalPage }">
                                            <li>
                                                <a href="<%=basePath%>/diary/findKeyPage/${diariesOfTopCate.pageNumber+1}&${searchKey}"
                                                   aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </c:if>
                                    </ul>
                                </div>
                                <!-- 分页结束 -->
                            </c:if>
                            <c:if test="${empty diariesOfTopCate.data}">
                                <h1>空空如也</h1>
                            </c:if>
                        </div>
                        <%--右边空白,已抽取，静态包含--%>
                        <%@include file="include/diaryRight.jsp" %>
                    </div>
                    <%--页脚--%>
                    <div class="col-md-12" align="center" style="border-top:#d9edf7 solid 1px;padding-top: 5%">
                        <%@include file="include/footer.jsp" %>
                    </div>
                    <%--返回顶部,抽取静态包含--%>
                    <%@include file="include/goTop.jsp" %>
                    <%--导航按钮--%>
                    <%@ include file="include/navigationButton.jsp" %>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<script type="text/javascript">
    var t = '<%=floatContent%>'.split("");
    <%/* 然后fontFloat.js就会使用t*/%>

    function toAddDiary() {
        window.location.href = '<%=basePath%>/diary/addUI';
    }
</script>
<script src="<%=basePath%>/js/classie.js" type="text/javascript"></script>
<script src="<%=basePath%>/js/sidebarEffects.js" type="text/javascript"></script>
<script src="<%=basePath%>/js/fontFloat.js" type="text/javascript"></script>
<script src="https://eqcn.ajz.miesnfu.com/wp-content/plugins/wp-3d-pony/live2dw/lib/L2Dwidget.min.js"></script>
<script src="<%=basePath%>/js/kanbanniang.js" type="text/javascript"></script>
</body>
</html>



