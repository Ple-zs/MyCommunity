<%--
  Created by IntelliJ IDEA.
  User: 86135
  Date: 2020/5/26
  Time: 11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="nav-V">
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="${ initParam.webUrl }/index">首页</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <c:if test="${ not empty loginUser }">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#">个人主页 <span class="sr-only">(current)</span></a></li>
                    <li><a href="${ initParam.webUrl }/send/publishTopic">发表主题</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">我的邮箱 <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="${ initParam.webUrl }/mbx/mailbox?page=1">收信箱</a></li>
                            <li><a href="${ initParam.webUrl }/mbx/mailbox?page=4">发信箱</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="${ initParam.webUrl }/mbx/mailbox?page=7">编写新邮件</a></li>
                        </ul>
                    </li>
                    </c:if>
                </ul>
                <form action="${ initParam.webUrl }/search" method="get" class="navbar-form navbar-left">
                    <div class="form-group">
                        <input type="text" name="title" value="${ title }" class="form-control" placeholder="主题">
                    </div>
                    <button type="submit" class="btn btn-default">搜索</button>
                </form>
                <ul class="nav navbar-nav navbar-right">
                    <c:choose>
                        <c:when test="${ not empty loginUser }">
                            <li><a href="${ initParam.webUrl }/logout">注销</a></li>
                            <li><a href="#">您好，${ loginUser.nickName }</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="${ initParam.webUrl }/login">登录</a></li>
                            <li><a href="${ initParam.webUrl }/register">注册</a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
</div>
<script>
    $("button[type=submit]").click(function () {
        if($("input[name=title]").val() == null || $("input[name=title]").val().trim() == ""){
            return false;
        }
    });
</script>