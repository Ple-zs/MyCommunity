<%--
  Created by IntelliJ IDEA.
  User: 86135
  Date: 2020/5/29
  Time: 14:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="${ initParam.webUrl }/static/css/publish_topic.css"/>
<div>
    <ol class="breadcrumb">
        <li><a href="${ initParam.webUrl }/index">首页</a></li>
        <li class="active">发表主题</li>
    </ol>
</div>
<div>
    <form action="" method="post" class="newTopic_form">
        <div class="topic_title">
            <div class="input-group">
                <span class="input-group-addon" id="sizing-addon2">标&nbsp;&nbsp;&nbsp;题</span>
                <input type="text" class="form-control title_input" placeholder="Title" aria-describedby="sizing-addon2">
                <span class="title_hint hint">标题不能为空!</span>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6">
                <div class="input-group">
                    <div class="input-group-btn">
                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">板块&nbsp;<span class="caret"></span></button>
                        <ul class="dropdown-menu">
                            <c:forEach items="${ communityForumList }" var="communityForum">
                                <li><a href="javaScript:;" onclick="switchForum(this)" data_forumName="${ communityForum.name }" data_forumId="${ communityForum.id }">${ communityForum.name }</a></li>
                            </c:forEach>
                        </ul>
                    </div><!-- /btn-group -->
                    <input type="reset" class="form-control show_forumName" aria-label="..." value="---请选择板块---"/>
                    <span class="forum_hint hint">请选择一个板块!</span>
                </div><!-- /input-group -->
            </div><!-- /.col-lg-6 -->
        </div>
        <div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">内容</h3>
                </div>
                <div class="panel-body clear_float">
                    <div class="alert alert-danger content_hint" role="alert">请编写主题内容!</div>
                    <textarea id="TextArea1" cols="20" rows="2" class="ckeditor"></textarea>
                    <button class="publish">发表</button>
                </div>
            </div>
        </div>
    </form>
</div>
<script src="${ initParam.webUrl }/static/js/publish_topic.js"></script>
