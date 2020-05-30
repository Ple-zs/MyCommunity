<%--
  Created by IntelliJ IDEA.
  User: 86135
  Date: 2020/5/30
  Time: 10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${ initParam.webUrl }/static/css/mailbox.css"/>
<div>
    <input type="hidden" id="showMailPage" value="${ page }"/>
    <ol class="breadcrumb">
        <li><a href="${ initParam.webUrl }/index">首页</a></li>
        <li><a href="javaScript:;">我的收件箱</a></li>
        <li class="active navTitle">Data</li>
    </ol>
</div>
<div class="clear_float">
    <div class="left_float">
        <div class="list-group">
            <a href="javaScript:;" class="list-group-item disabled">收件箱</a>
            <a href="javaScript:;" class="list-group-item allMail">所有邮件</a>
            <a href="javaScript:;" class="list-group-item unreadMail">未读邮件</a>
            <a href="javaScript:;" class="list-group-item pickUp_recycleBin">回收站</a>
        </div>
        <div class="list-group">
            <a href="javaScript:;" class="list-group-item disabled">发件箱</a>
            <a href="javaScript:;" class="list-group-item send">已发送</a>
            <a href="javaScript:;" class="list-group-item draft">草稿箱</a>
            <a href="javaScript:;" class="list-group-item send_recycleBin">回收站</a>
        </div>
        <div class="list-group">
            <a href="javaScript:;" class="list-group-item disabled">编写</a>
            <a href="javaScript:;" class="list-group-item writeNewMail">编写新邮件</a>
        </div>
    </div>
    <div class="right_float show_mail_msg">

    </div>
</div>
<script src="${ initParam.webUrl }/static/js/mailbox.js"></script>
