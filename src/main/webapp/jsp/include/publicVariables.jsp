<%@ page import="java.util.ResourceBundle" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%!
    ResourceBundle res = ResourceBundle.getBundle("text");
%>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
    // 虚拟目录 localhost:8080/img
    String imgPath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + "/img";
    String floatContent = (String) application.getAttribute("floatcontent");
%>
