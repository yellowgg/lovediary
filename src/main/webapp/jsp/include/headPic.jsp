<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="col-md-2"></div>
<%--女头像--%>
<div class="col-md-4">
    <div class="bridecol">
        <div class="bridepic">
            <a href="<%=res.getString("girlUrl") %>">
                <img src="<%=imgPath%>/girl.jpg" alt="bride" width="160" height="160">
            </a>
        </div>
        <div class="brideinfo">
            <h3>${girlname}</h3>
        </div>
        <div class="cplus glyphicon glyphicon-heart"></div>
    </div>
</div>
<%--男头像--%>
<div class="col-md-4">
    <div class="groomcol">
        <div class="groompic">
            <a href="<%=res.getString("boyUrl") %>">
                <img src="<%=imgPath%>/boy.jpg" alt="groom" width="160" height="160">
            </a>
        </div>
        <div class="groominfo">
            <h3>${boyname}</h3>
        </div>
    </div>
</div>
<div class="col-md-2"></div>
