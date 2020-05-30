<%--
  Created by IntelliJ IDEA.
  User: 86135
  Date: 2020/5/25
  Time: 19:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="${ initParam.webUrl }/static/js/index.js"></script>
<title>首页</title>
<link rel="stylesheet" href="${ initParam.webUrl }/static/css/carousel.css"/>
<div class="ctn_1_twoModule">
    <div class="left_carousel">
        <div class="slider-container">
            <div class="slider-control left inactive"></div>
            <div class="slider-control right"></div>
            <ul class="slider-pagi"></ul>
            <div class="slider">
                <div class="slide slide-0 active">
                    <div class="slide__bg"></div>
                </div>
                <div class="slide slide-1 ">
                    <div class="slide__bg"></div>
                </div>
                <div class="slide slide-2">
                    <div class="slide__bg"></div>
                </div>
                <div class="slide slide-3">
                    <div class="slide__bg"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="right_hotPlate">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">正在讨论</h3>
            </div>
            <div class="panel-body">
                <ul class="list-group">
                    <c:forEach items="${ communityTopicList }" var="topic">
                        <li class="list-group-item">
                            <span class="badge">回复:&nbsp;${ topic.commentTimes }</span>
                            <a href="${ initParam.webUrl }/showTContent?tid=${ topic.id }" data_tid="${ topic.id }" class="gotoTopic">${ topic.title }</a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="ctn_2_platePartition">
    <c:forEach items="${ communityForumList }" var="mainPlate">
        <div class="well well-sm">${ mainPlate.name }</div>
        <div class="row">
            <c:forEach items="${ mainPlate.plateList }" var="platePartition">
                <div class="col-xs-6 col-md-3">
                    <a href="${ initParam.webUrl }/forumPlate?forumId=${ platePartition.id }" class="thumbnail">
                        <img src="${ initParam.webUrl }/static/images/forum/${ platePartition.forumImagePath }"
                             alt="...">
                        <label>${ platePartition.name }</label>
                        <p>${ platePartition.description }</p>
                    </a>
                </div>
            </c:forEach>
        </div>
    </c:forEach>
</div>


<script src="${ initParam.webUrl }/static/js/carousel.js"></script>