<%--
  Created by IntelliJ IDEA.
  User: 86135
  Date: 2020/5/26
  Time: 15:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="register_msg-V">
    <ol class="breadcrumb">
        <li><a href="${ initParam.webUrl }/index">首页</a></li>
        <li class="active">注册</li>
    </ol>
    <div class="panel panel-default">
        <div class="panel-body">
            <form action="register" method="post" id="register_form">
                <div class="input-group">
                    <span class="input-group-addon tow_len">昵&nbsp;&nbsp;&nbsp;&nbsp;称</span>
                    <input type="text" class="form-control nickName" placeholder="Nickname" aria-describedby="sizing-addon2">
                    <p class="input_hint"></p>
                </div>
                <div class="input-group">
                    <span class="input-group-addon three_len">用户名</span>
                    <input type="text" class="form-control userName" placeholder="Username" aria-describedby="sizing-addon2">
                    <p class="input_hint"></p>
                </div>
                <div class="input-group">
                    <span class="input-group-addon tow_len">密&nbsp;&nbsp;&nbsp;&nbsp;码</span>
                    <input type="password" class="form-control pwd" placeholder="Password" aria-describedby="sizing-addon2">
                    <p class="input_hint"></p>
                </div>
                <div class="input-group">
                    <span class="input-group-addon">确认密码</span>
                    <input type="password" class="form-control pwd2" placeholder="Confirm Password" aria-describedby="sizing-addon2">
                    <p class="input_hint"></p>
                </div>
                <div class="input-group">
                    <span class="input-group-addon tow_len">邮&nbsp;&nbsp;&nbsp;&nbsp;箱</span>
                    <input type="text" class="form-control email" placeholder="E-mail" aria-describedby="sizing-addon2">
                    <p class="input_hint"></p>
                </div>
                <div class="login_btn-V">
                    <button type="submit" class="register_btn custom_btn">注册</button>
                    <button type="reset" class="reset_btn custom_btn">重置</button>
                </div>
            </form>
        </div>
    </div>
</div><script src="${ initParam.webUrl }/static/js/register.js"></script>
