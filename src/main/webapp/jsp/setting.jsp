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
    <title>设置</title>
    <link rel="shortcut icon" type="image/x-icon"
          href="<%=basePath%>/images/favicon.ico"/>
    <link rel="stylesheet" href="<%=basePath%>/css/bootstrap.min.css"
          type="text/css"/>
    <link rel="stylesheet"
          href="<%=basePath%>/css/bootstrap-datetimepicker.min.css"
          type="text/css"/>
    <link rel="stylesheet" href="<%=basePath%>/css/base.css" type="text/css"/>
    <link rel="stylesheet" href="<%=basePath%>/css/diary.css" type="text/css"/>
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
          rel="stylesheet">
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
    <script src="<%=basePath%>/js/bootstrap-datetimepicker.min.js"
            type="text/javascript"></script>
    <script src="<%=basePath%>/js/bootstrap-datetimepicker.zh-CN.js"></script>
</head>
<body>
<div style="width: 100%;height: 100%;position:fixed">
    <div id="st-container" class="st-container">
        <div class="st-pusher">
            <%@ include file="navigation.jsp" %>
            <div class="st-content"
                 style="background: url('<%=basePath%>/images/bg.jpg') no-repeat center 0px;background-position: center 0;background-size: cover;height:100%">
                <div class="st-content-inner">
                    <%--两个头像条--%>
                    <a name="top"></a>
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
                    <%--时间条,使用静态包含--%>
                    <%@ include file="weAlreadyWithTime.jsp" %>
                    <%--中间三部分--%>
                    <div class="col-md-12">
                        <%--日志的搜索框和分类栏,已抽取，静态包含--%>
                        <%@ include file="diaryLeft.jsp" %>
                        <%--中间设置的部分--%>
                        <div id="diaryMiddleSetting" class="col-md-6"
                             style="height: 100%">
                            <%--设置的表单--%>
                            <form class="form-horizontal" method="post"
                                  style="width: 100%;margin: 30px 1px 1px;"
                                  action="${pageContext.request.contextPath}/user/updateSetting">
                                <div class="form-group">
                                    <label for="floatcontent" style="font-size:
                                     20px"
                                           class="col-sm-2 control-label">漂浮
                                    </label>
                                    <div class="col-sm-10">
                                        <input type="text"
                                               class="form-control input-lg"
                                               id="floatcontent" required
                                               name="floatcontent"
                                               placeholder="输入漂浮的文字内容">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="boyname" style="font-size:
                                     20px"
                                           class="col-sm-2 control-label">男生名
                                    </label>
                                    <div class="col-sm-10">
                                        <input type="text"
                                               class="form-control input-lg"
                                               id="boyname" required
                                               name="boyname"
                                               placeholder="输入男方名字">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="girlname" style="font-size:
                                     20px"
                                           class="col-sm-2 control-label">女生名
                                    </label>
                                    <div class="col-sm-10">
                                        <input type="text"
                                               class="form-control input-lg"
                                               id="girlname" required
                                               name="girlname"
                                               placeholder="输入女方名字">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="lovedate" style="font-size:
                                     20px"
                                           class="col-sm-2 control-label">恋爱日期
                                    </label>
                                    <div class="input-group date form_date
                                            col-sm-10" style="padding-left:2%;
                                             padding-right:2%"
                                         data-date-format="yyyy MM dd"
                                         data-link-format="yyyy-mm-dd"
                                         data-link-field="lovedate">
                                        <input class="form-control input-lg"
                                               size="16"
                                               name="lovedate"
                                               id="lovedate"
                                               type="text" value="2018-04-16"
                                               readonly>
                                        <span class="input-group-addon"><span
                                                class="glyphicon glyphicon-calendar"></span></span>
                                    </div>
                                </div>
                                <button type="submit"
                                        class="btn btn-primary btn-lg"
                                        style="background-color: #1380ab;margin: 10px 45%">
                                    保存
                                </button>
                            </form>
                        </div>
                        <%--右边空白,已抽取，静态包含--%>
                        <%@include file="diaryRight.jsp" %>
                    </div>
                    <%--页脚--%>
                    <div class="col-md-12" align="center" style="border-top:
                    #d9edf7 solid 1px;padding-top: 5%">
                        <p>Copyright@2019 大王派我来寻山 桂ICP备18009250号-1</p>
                        <p>技术支持：yellowgg
                            <a href="https://github.com/yellowgg"
                               target="_blank">https://github.com/yellowgg</a>
                        </p>
                    </div>
                    <%--返回顶部,抽取静态包含--%>
                    <%@include file="goTop.jsp" %>
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
</div>

<script type="text/javascript">


    $('.form_date').datetimepicker({
        language: 'zh-CN',
        format: 'yyyy-mm-dd',
        weekStart: 7,
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        minView: 2
    });

    <%
        // 先获取内容
        String floatContent = (String) application.getAttribute("floatcontent");
    %>
    var t = '<%=floatContent%>';
    t = t.split("");
    <%/* 然后fontFloat.js就会使用t*/%>

    function toAddDiary() {
        window.location.href = '<%=basePath%>/diary/addUI';
    }

    $(document).ready(function () {
        $(function () {
            //发送ajax 读取数据挂载表单
            $.ajax({
                type: 'post',
                url: '${pageContext.request.contextPath}/user/getSetting',
                contentType: 'application/json;charset=utf-8',
                data: {"": ""},//数据格式是json串
                success: function (data) {
                    //挂载到表单
                    $("#floatcontent").val(data.floatcontent);
                    $("#boyname").val(data.boyname);
                    $("#girlname").val(data.girlname);
                    $("#lovedate").val(formatDate(data.loveday));
                }
            })
        })
    })

    function formatDate(time) {
        var date = new Date(time);
        var str = date.getFullYear() + "-";
        str += ((date.getMonth() + 1) < 10 ? ("0" + (date.getMonth() + 1)) : (date.getMonth() + 1)) + "-";
        str += (date.getDate() < 10 ? ("0" + date.getDate()) : date.getDate()) + " ";

        return str;
    }

    $(document).ready(function () {
        $(function () {
            //发送ajax 读取日记月份分类
            $.ajax({
                type: 'post',
                url: '${pageContext.request.contextPath}/category/findAll',
                contentType: 'application/json;charset=utf-8',
                data: {"": ""},//数据格式是json串
                success: function (data) {
                    //挂载到右边，遍历json列表，获取每一个分类，包装成li标签，插入到ul内部
                    for (var i = 0; i < data.length; i++) {
                        var typeId = data[i].categoryid;
                        var typeCount = data[i].count;
                        var typeName = data[i].categoryname;
                        $("#c_ul").append("<a " +
                            "href='<%=basePath%>/diary/findPage/1&" + typeId +
                            "' class='list-group-item'><span class='badge' style='background-color: #1380ab;'>" +
                            typeCount + "</span>" + typeName + "</a>")
                    }
                }
            })
        })
    })
</script>
<script src="<%=basePath%>/js/classie.js" type="text/javascript"></script>
<script src="<%=basePath%>/js/sidebarEffects.js"
        type="text/javascript"></script>
<script src="<%=basePath%>/js/fontFloat.js" type="text/javascript"></script>
<script src="<%=basePath%>/js/modernizr.custom.js"
        type="text/javascript"></script>
<script src="https://eqcn.ajz.miesnfu.com/wp-content/plugins/wp-3d-pony/live2dw/lib/L2Dwidget.min.js"></script>
<script src="<%=basePath%>/js/kanbanniang.js" type="text/javascript"></script>
</body>
</html>



