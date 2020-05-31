<%--
  Created by IntelliJ IDEA.
  User: 86135
  Date: 2020/5/30
  Time: 15:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="panel panel-default">
    <input type="hidden" id="mailId" value="${ mailId }"/>
    <input type="hidden" id="receiverName" value="${ receivers }">
    <link rel="stylesheet" href="${ initParam.webUrl }/static/css/loadPage_mail.css"/>
    <div class="panel-body">编写邮件</div>
    <div class="panel panel-default" style="margin-left: 20px;margin-right: 20px">
        <div class="panel-heading">注意：请在收件处填写发送对象的用户名，诺有多个收件人则用半角逗号","分隔</div>
        <div class="panel-body">
            <table class="table">
                <tr>
                    <th class="smc_width"><span class="text_location">标题：</span></th>
                    <td class="clear_float_input">
                        <div class="input-group">
                            <c:choose>
                                <c:when test="${ communityMessageSending.status == 1 or communityMessageSending.status == 2 }">
                                    <input type="reset" disabled class="form-control email_title" placeholder="标题" value="${ communityMessageSending.title }" aria-describedby="sizing-addon2">
                                </c:when>
                                <c:otherwise>
                                    <input type="text" class="form-control email_title" placeholder="标题" value="${ communityMessageSending.title }" aria-describedby="sizing-addon2">
                                    <span class="email_title_hint hint">标题不能为空！</span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th class="smc_width"><span class="text_location">收件人：</span></th>
                    <td class="clear_float_input">
                        <div class="input-group">
                            <c:choose>
                                <c:when test="${ communityMessageSending.status == 1 or communityMessageSending.status == 2 }">
                                    <input type="text" disabled class="form-control senderName" value="${ communityMessageSending.receivers }" placeholder="收件人" aria-describedby="sizing-addon2">
                                </c:when>
                                <c:otherwise>
                                    <c:choose>
                                        <c:when test="${ not empty receivers }">
                                            <input type="text" class="form-control senderName" value="${ receivers }" placeholder="收件人" aria-describedby="sizing-addon2">
                                            <span class="email_title_hint hint">收件人不能为空！</span>
                                        </c:when>
                                        <c:otherwise>
                                            <input type="text" class="form-control senderName" value="${ communityMessageSending.receivers }" placeholder="收件人" aria-describedby="sizing-addon2">
                                            <span class="email_receivers_hint hint">收件人不能为空！</span>
                                        </c:otherwise>
                                    </c:choose>

                                </c:otherwise>
                            </c:choose>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th class="smc_width">正文：</th>
                    <td class="clear_float_input"></td>
                </tr>
                <tr>
                    <th class="smc_width"></th>
                    <td class="clear_float_input">
                        <c:choose>
                            <c:when test="${ communityMessageSending.status == 1 or communityMessageSending.status == 2 }">
                                <textarea disabled class="email_content">${ communityMessageSending.content }</textarea>
                            </c:when>
                            <c:otherwise>
                                <textarea class="email_content">${ communityMessageSending.content }</textarea>
                                <span class="email_content_hint hint">正文不能为空！</span>
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </table>
        </div>
        <div class="panel-footer">
            <button class="return_send smc_btn">返回</button>
            <c:if test="${ communityMessageSending.status <= 0 or empty communityMessageSending.status }">
                <c:choose>
                    <c:when test="${ communityMessageSending.status == 0 }">
                        <button class="save_draft smc_btn" onclick="save_draft()">保存草稿</button>
                        <button class="send_mail smc_btn" onclick="send_mail()">发送</button>
                    </c:when>
                    <c:otherwise>
                        <button class="save_draft smc_btn" onclick="add_draft()">保存草稿</button>
                        <button class="send_mail smc_btn" onclick="send_mail()">发送</button>
                    </c:otherwise>
                </c:choose>
            </c:if>
        </div>
    </div>
    <script src="${ initParam.webUrl }/static/js/loadPage_mail.js"></script>
</div>
