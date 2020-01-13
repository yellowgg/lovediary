<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="include/publicVariables.jsp" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta name="viewport" content="width=device-width, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="chrome=1">
    <meta http-equiv="Content-Type" content="text/html; charset = UTF-8"/>
    <title>你打球好像蔡徐坤</title>
    <style>
        body {
            overflow: hidden;
            background-color: #000000;
            user-select: none;
            -webkit-user-select: none;
            -moz-user-select: none;
            -o-user-select: none;
            -ms-user-select: none;
        }
    </style>
</head>
<body>
<div id="canvas"></div>
<script src="<%=basePath%>/js/protoclass.js"></script>
<script src='<%=basePath%>/js/box2d.js'></script>
<script src='<%=basePath%>/js/Main.js'></script>
</body>
</html>
