<%--
  Created by IntelliJ IDEA.
  User: 86135
  Date: 2020/5/30
  Time: 18:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="filler_email">
    <input type="hidden" id="emailPage" value="mailbox"/>
    <input type="hidden" id="cmrId" value="${ communityMessageReceiving.id }"/>
    <div>
        <ol class="breadcrumb">
            <li><a href="${ initParam.webUrl }/index">首页</a></li>
            <li><a href="javaScript:;">我的收件箱</a></li>
            <li class="active">邮件内容</li>
        </ol>
    </div>
    <div class="panel panel-default" style="margin-left: 20px;margin-right: 20px">
        <div class="panel-heading">标题：${ communityMessageReceiving.communityMessageSending.title }</div>
        <div class="panel-body">
            <table class="table">
                <tr>
                    <th class="smc_width"><span class="text_location">发件人：</span></th>
                    <td class="clear_float_input">${ communityMessageReceiving.communityMessageSending.senderName }</td>
                </tr>
                <tr>
                    <th class="smc_width"><span class="text_location">发送时间：</span></th>
                    <td class="clear_float_input"><fmt:formatDate value="${ communityMessageReceiving.communityMessageSending.sendTime }"
                                                                  pattern="yyyy-MM-dd hh:mm:ss"/></td>
                </tr>
                <tr>
                    <th class="smc_width">正文：</th>
                    <td class="clear_float_input"></td>
                </tr>
                <tr>
                    <th class="smc_width"></th>
                    <td class="clear_float_input">${ communityMessageReceiving.communityMessageSending.content }</td>
                </tr>
            </table>
        </div>
        <div class="panel-footer">
            <button class="return_send smc_btn">返回</button>
            <button class="save_draft smc_btn" onclick="replyMail('${ communityMessageReceiving.communityMessageSending.senderName }')">回复
            </button>
            <c:choose>
                <c:when test="${ communityMessageReceiving.status == 1 }">
                    <button class="showMailPage_delete smc_btn" onclick="delete_mail(${ communityMessageReceiving.id })">删除</button>
                </c:when>
                <c:otherwise>
                    <button class="showMailPage_delete smc_btn" onclick="clear_mail(${ communityMessageReceiving.id })">删除</button>
                </c:otherwise>
            </c:choose>

        </div>
        <script src="${ initParam.webUrl }/static/js/loadPage_mail.js"></script>
        <script>
            $.get("sign_read_mail",{"cmrId":$("#cmrId").val()},function () {return true;});
        </script>
    </div>
</div>