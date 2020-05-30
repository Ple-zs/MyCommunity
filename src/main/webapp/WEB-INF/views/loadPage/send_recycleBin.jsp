<%--
  Created by IntelliJ IDEA.
  User: 86135
  Date: 2020/5/30
  Time: 14:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="panel panel-default filler_email">
    <link rel="stylesheet" href="${ initParam.webUrl }/static/css/loadPage_mail.css"/>
    <input type="hidden" id="emailPage" value="send_recycleBin"/>
    <div class="panel-body">发件箱-回收站</div>
    <table class="table">
        <tr>
            <th>标题</th>
            <th>收件人</th>
            <th>时间</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${ communityMessageSendingList }" var="communityMessageSending">
            <tr>
                <td class="bgk_img send_mail_logo"><a href="javaScript:;" onclick="show_mail(${ communityMessageSending.id })">${ communityMessageSending.title }</a></td>
                <td>${ communityMessageSending.receivers }</td>
                <td><fmt:formatDate value="${ communityMessageSending.sendTime }" pattern="yyyy-MM-dd hh:mm:ss"/></td>
                <td>
                    <span class="recover btn_email" onclick="recover_sendMail(${ communityMessageSending.id })">恢复</span>
                    <span class="clear_email btn_email" onclick="clear_sendMail(${ communityMessageSending.id })">清除</span>
                </td>
            </tr>
        </c:forEach>
    </table>
    <script src="${ initParam.webUrl }/static/js/loadPage_mail.js"></script>
</div>
