<%--
  Created by IntelliJ IDEA.
  User: 86135
  Date: 2020/5/26
  Time: 11:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="${ initParam.webUrl }/static/css/index.css"/>
    <script src="${ initParam.webUrl }/static/js/jquery-3.4.1.js"></script>
    <script src="${ initParam.webUrl }/static/ckeditor/ckeditor.js"></script>
    <script src="http://pv.sohu.com/cityjson?ie=utf-8"></script>
</head>
<body>
<div id="header">
    <div class="fixation-login"></div>
    <dvi class="nav">
        <tiles:insertAttribute name="header"></tiles:insertAttribute>
    </dvi>
</div>
<div id="main">
    <tiles:insertAttribute name="content"></tiles:insertAttribute>
</div>
<div id="footer">
    <tiles:insertAttribute name="footer"></tiles:insertAttribute>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
        integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
        crossorigin="anonymous"></script>
</body>
</html>
