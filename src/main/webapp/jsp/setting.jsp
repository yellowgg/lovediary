<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="include/publicVariables.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>设置</title>
    <link rel="shortcut icon" type="image/x-icon" href="<%=basePath%>/images/favicon.ico"/>
    <link rel="stylesheet" href="<%=basePath%>/css/bootstrap.min.css" type="text/css"/>
    <link rel="stylesheet" href="<%=basePath%>/css/bootstrap-fileinput.css" type="text/css"/>
    <link rel="stylesheet" href="<%=basePath%>/css/bootstrap-datetimepicker.min.css" type="text/css"/>
    <link rel="stylesheet" href="<%=basePath%>/css/base.css" type="text/css"/>
    <link rel="stylesheet" href="<%=basePath%>/css/diary.css" type="text/css"/>
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/normalize.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/demo.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/component.css"/>
    <!--引入bootstrap中js文件，注意必须先引入jquery.min.js 后引入js-->
    <script src="<%=basePath%>/js/jquery.min.js" type="text/javascript"></script>
    <script src="<%=basePath%>/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="<%=basePath%>/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
    <script src="<%=basePath%>/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="<%=basePath%>/js/bootstrap-fileinput.js" type="text/javascript"></script>
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
                        <%--中间设置的部分--%>
                        <div id="diaryMiddleSetting" class="col-md-6" style="height: 100%">
                            <%--设置的表单--%>
                            <form class="form-horizontal" method="post" style="width: 100%;margin: 30px 1px 1px;"
                                  action="${pageContext.request.contextPath}/user/updateSetting" method="post"
                                  enctype="multipart/form-data">
                                <div class="form-group">
                                    <label for="floatcontent" style="font-size:20px" class="col-sm-2 control-label">漂浮
                                    </label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control input-lg" id="floatcontent" required
                                               name="floatcontent" placeholder="输入漂浮的文字内容">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="boyname" style="font-size:20px" class="col-sm-2 control-label">男生名
                                    </label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control input-lg" id="boyname" required
                                               name="boyname" placeholder="输入男方名字">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="girlname" style="font-size:20px" class="col-sm-2 control-label">女生名
                                    </label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control input-lg" id="girlname" required
                                               name="girlname" placeholder="输入女方名字">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="lovedate" style="font-size:20px" class="col-sm-2 control-label">恋爱日期
                                    </label>
                                    <div class="input-group date form_date col-sm-10" style="padding-left:2%;
                                         padding-right:2%" data-link-field="lovedate" data-date-format="yyyy MM dd"
                                         data-link-format="yyyy-mm-dd">
                                        <input class="form-control input-lg" size="16" name="lovedate" readonly
                                               id="lovedate" type="text" value="2018-04-16">
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar"></span></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label style="font-size:20px" class="col-sm-2 control-label">头像 </label>
                                    <div class="fileinput fileinput-new" data-provides="fileinput" id="girlPhoto"
                                         style="margin-left: 10%;">
                                        <div class="fileinput-new thumbnail"
                                             style="width: 200px;height: auto;max-height:150px;">
                                            <img id="girlImg" style="width: 100%;height: auto;max-height: 140px;"
                                                 src="<%=basePath%>/images/girl.jpg"/>
                                        </div>
                                        <div class="fileinput-preview fileinput-exists thumbnail"
                                             style="max-width: 200px; max-height: 150px;"></div>
                                        <div>
                                        <span class="btn btn-primary btn-file">
                                            <span class="fileinput-new">选择文件</span>
                                            <span class="fileinput-exists">换一张</span>
                                            <input type="file" name="girlPic" id="girlImgFile"
                                                   accept="image/gif,image/jpeg,image/x-png"/>
                                        </span>
                                            <a href="javascript:;" class="btn btn-warning fileinput-exists"
                                               data-dismiss="fileinput">移除</a>
                                        </div>
                                    </div>
                                    <div class="fileinput fileinput-new" data-provides="fileinput" id="boyPhoto"
                                         style="margin-left: 10%;">
                                        <div class="fileinput-new thumbnail"
                                             style="width: 200px;height: auto;max-height:150px;">
                                            <img id="boyImg" style="width: 100%;height: auto;max-height: 140px;"
                                                 src="<%=basePath%>/images/boy.jpg"/>
                                        </div>
                                        <div class="fileinput-preview fileinput-exists thumbnail"
                                             style="max-width: 200px; max-height: 150px;"></div>
                                        <div>
                                        <span class="btn btn-primary btn-file">
                                            <span class="fileinput-new">选择文件</span>
                                            <span class="fileinput-exists">换一张</span>
                                            <input type="file" name="boyPic" id="boyImgFile"
                                                   accept="image/gif,image/jpeg,image/x-png"/>
                                        </span>
                                            <a href="javascript:;" class="btn btn-warning fileinput-exists"
                                               data-dismiss="fileinput">移除</a>
                                        </div>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-primary btn-lg"
                                        style="background-color: #1380ab;margin: 10px 45%"> 保存
                                </button>
                            </form>
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
    $('.form_date').datetimepicker({
        language: 'zh-CN',
        format: 'yyyy-mm-dd',
        weekStart: 7,
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        minView: 2
    });

    var t = '<%=floatContent%>'.split("");
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

</script>
<script src="<%=basePath%>/js/classie.js" type="text/javascript"></script>
<script src="<%=basePath%>/js/sidebarEffects.js" type="text/javascript"></script>
<script src="<%=basePath%>/js/fontFloat.js" type="text/javascript"></script>
<script src="<%=basePath%>/js/modernizr.custom.js" type="text/javascript"></script>
<script src="https://eqcn.ajz.miesnfu.com/wp-content/plugins/wp-3d-pony/live2dw/lib/L2Dwidget.min.js"></script>
<script src="<%=basePath%>/js/kanbanniang.js" type="text/javascript"></script>
</body>
</html>



