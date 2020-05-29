<%--
  Created by IntelliJ IDEA.
  User: 86135
  Date: 2020/5/26
  Time: 15:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="login_msg-V">
    <input type="hidden" id="returnUrl" value="${ param.returnUrl }">
    <ol class="breadcrumb">
        <li><a href="${ initParam.webUrl }/index">首页</a></li>
        <li class="active">登录</li>
    </ol>
    <div class="panel panel-default">
        <div class="panel-body">
            <form action="login" method="post" id="login_form">
                <input type="hidden" id="goto_Path" value="${ param.returnUrl }"/>
                <div class="input-group">
                    <span class="input-group-addon three_len">用户名</span>
                    <input type="text" class="form-control userName" placeholder="Username" aria-describedby="sizing-addon2">
                    <p class="input_hint"></p>
                </div>
                <div class="input-group">
                    <span class="input-group-addon showText tow_len">密&nbsp;&nbsp;&nbsp;&nbsp;码</span>
                    <input type="password" class="form-control passWord" placeholder="Password" aria-describedby="sizing-addon2">
                    <p class="input_hint"></p>
                </div>
                <div class="login_hint">
                    <div class="alert alert-danger" role="alert"><strong>登录失败！</strong>用户名或密码错误.</div>
                </div>
                <div class="login_btn-V">
                    <button type="submit" class="login_btn custom_btn">登录</button>
                    <button type="reset" class="reset_btn custom_btn">重置</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="${ initParam.webUrl }/static/js/login.js"></script>
