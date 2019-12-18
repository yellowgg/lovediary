<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%!
    String girlUrl = "";
    String boyUrl = "";
    String NavigationButton = "别动我";
%>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
    String floatContent = (String) application.getAttribute("floatcontent");
%>