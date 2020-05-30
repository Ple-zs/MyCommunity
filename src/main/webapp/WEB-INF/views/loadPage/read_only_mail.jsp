<%--
  Created by IntelliJ IDEA.
  User: 86135
  Date: 2020/5/30
  Time: 18:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div>
    <ol class="breadcrumb">
        <li><a href="${ initParam.webUrl }/index">首页</a></li>
        <li><a href="javaScript:;">我的收件箱</a></li>
        <li class="active">邮件内容</li>
    </ol>
</div>
<div class="panel panel-default" style="margin-left: 20px;margin-right: 20px">
    <div class="panel-heading">标题：${ communityMessageSending.title }</div>
    <div class="panel-body">
        <table class="table">
            <tr>
                <th class="smc_width"><span class="text_location">发件人：</span></th>
                <td class="clear_float_input">${ communityMessageSending.receivers }</td>
            </tr>
            <tr>
                <th class="smc_width"><span class="text_location">发送时间：</span></th>
                <td class="clear_float_input"><fmt:formatDate value="${ communityMessageSending.sendTime }" pattern="yyyy-MM-dd hh:mm:ss"/></td>
            </tr>
            <tr>
                <th class="smc_width">正文：</th>
                <td class="clear_float_input"></td>
            </tr>
            <tr>
                <th class="smc_width"></th>
                <td class="clear_float_input">${ communityMessageSending.content }</td>
            </tr>
        </table>
    </div>
    <div class="panel-footer">
        <button class="return_send smc_btn">返回</button>
        <button class="save_draft smc_btn" onclick="">回复</button>
        <button class="send_mail smc_btn" onclick="">删除</button>
    </div>
    <script src="${ initParam.webUrl }/static/js/loadPage_mail.js"></script>
</div>