<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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