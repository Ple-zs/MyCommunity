<%--
  Created by IntelliJ IDEA.
  User: 86135
  Date: 2020/5/30
  Time: 11:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="panel panel-default filler_email">
    <link rel="stylesheet" href="${ initParam.webUrl }/static/css/loadPage_mail.css"/>
    <input type="hidden" id="emailPage" value="receive_recycleBin"/>
    <div class="panel-body">收件箱-回收站</div>
    <table class="table">
        <tr>
            <th>标题</th>
            <th>发件人</th>
            <th>时间</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${ communityMessageReceivingList }" var="communityMessageReceiving">
            <c:choose>
                <c:when test="${ communityMessageReceiving.readed == 1 }">
                    <tr>
                        <td class="bgk_img readed_mail_logo"><a href="javaScript:;" onclick="readMail(${ communityMessageReceiving.communityMessageSending.id })">${ communityMessageReceiving.communityMessageSending.title }</a></td>
                        <td>${ communityMessageReceiving.sendNickName }</td>
                        <td><fmt:formatDate value="${ communityMessageReceiving.communityMessageSending.sendTime }" pattern="yyyy-MM-dd hh:mm:ss"/></td>
                        <td>
                            <span class="recover btn_email" onclick="recover_mail(${ communityMessageReceiving.id })">恢复</span>
                            <span class="clear_email btn_email" onclick="clear_mail(${ communityMessageReceiving.id })">清除</span>
                        </td>
                    </tr>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td class="bgk_img unreaded_mail_logo"><a href="javaScript:;" onclick="readMail(${ communityMessageReceiving.communityMessageSending.id })">${ communityMessageReceiving.communityMessageSending.title }</a></td>
                        <td>${ communityMessageReceiving.sendNickName }</td>
                        <td><fmt:formatDate value="${ communityMessageReceiving.communityMessageSending.sendTime }" pattern="yyyy-MM-dd hh:mm:ss"/></td>
                        <td>
                            <span class="recover btn_email" onclick="recover_mail(${ communityMessageReceiving.id })">恢复</span>
                            <span class="clear_email btn_email" onclick="clear_mail(${ communityMessageReceiving.id })">清除</span>
                        </td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </table>
    <script src="${ initParam.webUrl }/static/js/loadPage_mail.js"></script>
</div>