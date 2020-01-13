<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<nav class="st-menu st-effect-6" id="menu-6">
    <h2 class="icon icon-stack">❤️<%=res.getString("NavigationTitle")%>❤️</h2>
    <ul>
        <li><a href="<%=basePath%>"><%=res.getString("NavigationIndexText")%>
        </a></li>
        <li><a href="<%=basePath%>/diary/list"><%=res.getString("NavigationDiaryText")%>
        </a></li>
        <li><a href="<%=basePath%>/user/setting"><%=res.getString("NavigationSetText")%>
        </a></li>
        <c:if test="${empty crrentUser}">
            <li><a href="<%=basePath%>/user/loginUI"><%=res.getString("NavigationLoginText")%>
            </a></li>
        </c:if>
        <c:if test="${not empty crrentUser}">
            <li><a href="<%=basePath%>/user/logout"><%=res.getString("NavigationLogoutText")%>
            </a></li>
        </c:if>
        <li><a href="<%=basePath%>/other/playtheball"><%=res.getString("NavigationPlayBallText")%>
        </a></li>
        <li><a href="<%=basePath%>/other/about"><%=res.getString("NavigationAboutText")%>
        </a></li>
    </ul>
</nav>