<%--
  Created by IntelliJ IDEA.
  User: 86135
  Date: 2020/5/28
  Time: 16:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" href="${ initParam.webUrl }/static/css/topic_content.css"/>
<input type="hidden" id="tid" value="${ tid }"/>
<div>
    <ol class="breadcrumb">
        <li><a href="${ initParam.webUrl }/index">首页</a></li>
        <li>
            <a href="${ initParam.webUrl }/forumPlate?forumId=${ communityTopic.forumId }">${ communityTopic.forumName }</a>
        </li>
        <li class="active">${ communityTopic.title }</li>
    </ol>
</div>
<div class="_TC clr_float">

</div>
<script src="${ initParam.webUrl }/static/js/topic_content.js"></script>
