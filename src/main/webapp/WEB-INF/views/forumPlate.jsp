<%--
  Created by IntelliJ IDEA.
  User: 86135
  Date: 2020/5/27
  Time: 18:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" href="${ initParam.webUrl }/static/css/forumPlate.css"/>
<input type="hidden" id="fid" value="${ forumId }"/>
<input type="hidden" id="isBest" value="0"/>
<div class="forum-nav-V">
    <ol class="breadcrumb">
        <li><a href="${ initParam.webUrl }/index">首页</a></li>
        <li class="active">${ communityForum.name }</li>
    </ol>
</div>
<div class="digest-V">
    <div class="panel panel-default">
        <!-- Default panel contents -->
        <div class="panel-heading">${ communityForum.name }-精华区</div>
        <!-- Table -->
        <table class="table">
            <tr>
                <th>主题</th>
                <th>作者</th>
                <th>回复</th>
                <th>最后更新时间</th>
            </tr>
            <c:forEach items="${ digestList }" var="digest">
                <tr>
                    <td><a href="">${ digest.title }</a></td>
                    <td>${ digest.authorName }</td>
                    <td>${ digest.commentTimes }</td>
                    <td><fmt:formatDate value="${ digest.updateTime }" pattern="yyyy-MM-dd hh:mm:ss"/></td>
                </tr>
            </c:forEach>

        </table>
    </div>
</div>
<div class="generalPartition-V">
    <div class="panel panel-default">
        <!-- Default panel contents -->
        <div class="panel-heading">${ communityForum.name }</div>
        <!-- Table -->
        <div class="fill_area"></div>
    </div>
</div>
<script src="${ initParam.webUrl }/static/js/forumPlate.js"></script>

