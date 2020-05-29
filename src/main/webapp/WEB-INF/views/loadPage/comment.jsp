<%--
  Created by IntelliJ IDEA.
  User: 86135
  Date: 2020/5/28
  Time: 20:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="fill_area_3">
    <input type="hidden" id="currentPage" value="${ currentPage }"/>
    <input type="hidden" id="tid_2" value="${ tid }"/>
    <input type="hidden" id="row" value="${ row }"/>
    <ul class="comment-V">
        <li class="one_floor">
            <table border="1" cellspacing="0" cellpadding="0" class="tc_table">
                <tr class="tr_1">
                    <td class="td_width">昵称：${ communityTopic.authorName }</td>
                    <td class="td_text hover_floor">
                        <span class="float_left">标题：${ communityTopic.title }
                            <button class="reply_btn_hover" data_cid="${ communityTopic.authorId }"
                                    data_reply_user_nickName="${ communityTopic.authorName }"
                                    onclick="replyF(this)">回复</button></span>
                        <span class="float_right"><a href="" class="mail_logo">发邮件</a></span>
                    </td>
                </tr>
                <tr>
                    <td class="td_width td_UHP">
                        <img src="${ initParam.webUrl }/static/images/user_HP/${ communityTopic.user_Hp_Path }"/>
                    </td>
                    <td class="td_text clr_float content_padding">
                        <p>${ communityTopic.content }</p>
                        <c:if test="${ not empty communityTopic.signature }">
                            <p class="signature">——————${ communityTopic.signature }</p>
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <td class="td_width">积分：${ communityTopic.grade }</td>
                    <td class="td_text clr_float">
                        <span class="float_left">发表时间：<fmt:formatDate value="${ communityTopic.createTime }"
                                                                      pattern="yyyy-MM-dd hh:mm:ss"/></span>
                        <span class="float_right">IP：${ communityTopic.ip }</span>
                    </td>
                </tr>
            </table>
        </li>
        <c:forEach items="${ communityCommentList }" var="communityComment" varStatus="status">
            <li>
                <table border="1" cellspacing="0" cellpadding="0" class="tc_table">
                    <tr class="tr_1">
                        <td class="td_width">昵称：${ communityComment.commenterUser_nickName }</td>
                        <td class="td_text hover_floor">
                            <c:choose>
                                <c:when test="${ currentPage==1 }">
                                    <span class="float_left">${ status.count + 1 }楼<button class="reply_btn_hover"
                                                                                           data_cid="${ communityComment.id }"
                                                                                           data_reply_user_nickName="${ communityComment.commenterUser_nickName }"
                                                                                           onclick="replyF(this)">回复</button></span>
                                </c:when>
                                <c:otherwise>
                                    <span class="float_left">${ (currentPage-1) * 5 + status.count }楼<button
                                            class="reply_btn_hover" data_cid="${ communityComment.id }"
                                            data_reply_user_nickName="${ communityComment.commenterUser_nickName }"
                                            onclick="replyF(this)">回复</button></span>
                                </c:otherwise>
                            </c:choose>
                            <span class="float_right"><a href="${ communityComment.commenterId }"
                                                         class="mail_logo">发邮件</a></span>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_width td_UHP">
                            <img src="${ initParam.webUrl }/static/images/user_HP/${ communityComment.user_Hp_Path }"/>
                        </td>
                        <td class="td_text clr_float content_padding">
                            <c:choose>
                                <c:when test="${ commentType == 2 }">
                                    <p><span
                                            class="show_reply_user">回复：${ communityComment.referenceId }</span>${ communityComment.content }
                                    </p>
                                </c:when>
                                <c:otherwise>
                                    <p>${ communityComment.content }</p>
                                </c:otherwise>
                            </c:choose>
                            <c:if test="${ not empty communityComment.signature }">
                                <p class="signature">——————${ communityComment.signature }</p>
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_width">积分：${ communityComment.userGrade }</td>
                        <td class="td_text clr_float">
                            <span class="float_left">发表时间：<fmt:formatDate value="${ communityComment.commentTime }"
                                                                          pattern="yyyy-MM-dd hh:mm:ss"/></span>
                            <span class="float_right">IP：${ communityComment.ip }</span>
                        </td>
                    </tr>
                </table>
            </li>
        </c:forEach>
        <c:if test="${ fn:length(communityCommentList) > 0  }">
            <li style="overflow: hidden;">
            <span class="pagingButton">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <c:choose>
                            <c:when test="${ currentPage == 1 }">
                                <li class="disabled">
                                    <a href="javaScript:;" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li>
                                    <a href="javaScript:;" onclick="commentPaging(4,${ currentPage-1 })"
                                       aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                        <c:forEach begin="1" end="${ countPage }" step="1" varStatus="status">
                            <c:choose>
                                <c:when test="${ status.count == currentPage }">
                                    <li class="active"><a href="javaScript:void(null);">${ status.count }</a></li>
                                </c:when>
                                <c:otherwise>
                                    <c:choose>
                                        <c:when test="${ status.count == 1 }">
                                            <li><a href="javaScript:;"
                                                   onclick="commentPaging(4,1)">${ status.count }</a></li>
                                        </c:when>
                                        <c:otherwise>
                                            <li><a href="javaScript:;"
                                                   onclick="commentPaging(5,${ status.count })">${ status.count }</a></li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        <c:choose>
                            <c:when test="${ currentPage == countPage }">
                                <li class="disabled">
                                    <a href="javaScript:;" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li>
                                    <a href="javaScript:;" onclick="commentPaging(5,${ currentPage+1 })"
                                       aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </nav>
            </span>
            </li>
        </c:if>
    </ul>
    <div class="panel panel-default">
        <div class="panel-heading">回复</div>
        <div class="panel-body clr_float">
            <c:choose>
                <c:when test="${ not empty loginUser }">
                    <div class="reply_floor_hint">
                        <div class="alert alert-warning alert-dismissible" role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                            <strong>@</strong>&nbsp;<span class="user_nickName"></span>
                        </div>
                    </div>
                    <div class="non_null_hint" style="display: none">
                        <div class="alert alert-danger" role="alert"><strong>回复内容不能为空！</strong></div>
                    </div>
                    <table class="reply_table">
                        <tr>
                            <td class="reply_td"><p>内容</p></td>
                            <td>
                                <textarea class="reply_content"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td class="reply_td"></td>
                            <td>
                                <button class="publish" onclick="publishF()">发表</button>
                            </td>
                        </tr>
                    </table>
                </c:when>
                <c:otherwise>
                    <div class="alert alert-success" role="alert"><strong><a
                            href="${ initParam.webUrl }/login?returnUrl=showTContent?tid=${ tid }">点击我去登录~</a></strong>&nbsp;&nbsp;&nbsp;&nbsp;未登录账号无法发表回复。
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    <script src="${ initParam.webUrl }/static/js/comment.js"></script>
</div>
