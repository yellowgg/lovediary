<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%--左边部分--%>
<div id="diaryLeftSearchClassify" class="col-md-3"
     style="height: 100%">
    <%--搜索框--%>
    <div class="search d7">
        <form method="get"
              action="<%=basePath%>/diary/searchlist">
            <input type="text" name="searchKey"
                   maxlength="10"
                   placeholder="搜索日记内容╮(￣▽￣)╭">
            <button type="submit"></button>
            <button class="addDiary" type="button"
                    title="添加日记"
                    onclick="toAddDiary()">
            </button>
        </form>
    </div>
    <%--日期分类--%>
    <div class="list-group" style="width: 100%"
         id="c_ul">
        <a href="javascript:void(0);"
           class="list-group-item disabled">
            时间分类
        </a>
    </div>
</div>