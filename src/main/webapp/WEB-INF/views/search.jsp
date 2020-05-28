<%--
  Created by IntelliJ IDEA.
  User: 86135
  Date: 2020/5/28
  Time: 15:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="CT_List-V">
    <input type="hidden" id="title" value="${ title }"/>
    <ol class="breadcrumb">
        <li><a href="${ initParam.webUrl }/index">首页</a></li>
        <li class="active">搜索结果</li>
    </ol>

    <div class="panel panel-default">
        <!-- Default panel contents -->
        <div class="panel-heading">搜索出包含"${ title }"的记录${ rowsCount }条。</div>
        <!-- Table -->
        <div class="fill_area"></div>
    </div>
</div>
<script src="${ initParam.webUrl }/static/js/search.js"></script>
