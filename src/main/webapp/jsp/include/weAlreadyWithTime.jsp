<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--时间条--%>
<div class="timer-box" style="border-bottom: 1px solid #efefef;">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2 class="timehead">
                    <%=res.getString("WeAlreadyWtihTime") %>
                </h2>
                <div id="ctimer" style="margin-left: 36.5%">
                    <span> <h3>${loveYear}</h3> 年 </span>
                    <span> <h3>${loveMonth}</h3> 月 </span>
                    <span> <h3>${loveDay}</h3> 日 </span>
                </div>
            </div>
        </div>
    </div>
</div>