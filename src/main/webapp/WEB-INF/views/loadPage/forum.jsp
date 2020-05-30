<%--
  Created by IntelliJ IDEA.
  User: 86135
  Date: 2020/5/28
  Time: 13:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="${ initParam.webUrl }/static/css/forumPlate.css"/>
<div class="fill_area_2">
    <input type="hidden" id="fid_2" value="${ forumId }"/>
    <input type="hidden" id="title_2" value="${ title }">
    <input type="hidden" id="isBest_2" value="${ isBest }"/>
    <table class="table bor_btm">
        <tr>
            <th>主题</th>
            <th>作者</th>
            <th>回复</th>
            <th>最后更新时间</th>
        </tr>
        <c:forEach items="${ generalPartitionList }" var="generalPartition">
            <tr>
                <td><a href="${ initParam.webUrl }/showTContent?tid=${ generalPartition.id }" data_tid="${ generalPartition.id }" class="gotoTopic">${ generalPartition.title }</a></td>
                <td>${ generalPartition.authorName }</td>
                <td>${ generalPartition.commentTimes }</td>
                <td><fmt:formatDate value="${ generalPartition.updateTime }" pattern="yyyy-MM-dd hh:mm:ss"/></td>
            </tr>
        </c:forEach>
    </table>
    <c:if test="${ fn:length(generalPartitionList) > 0 }">
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
                                <a href="javaScript:;" onclick="paging(${ currentPage-1 })" aria-label="Previous">
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
                                <li><a href="javaScript:;" onclick="paging(${ status.count })">${ status.count }</a></li>
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
                                <a href="javaScript:;" onclick="paging(${ currentPage+1 })" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:otherwise>
                    </c:choose>

                </ul>
            </nav>
        </span>
    </c:if>
</div>
<script src="${ initParam.webUrl }/static/js/forum.js"></script>
