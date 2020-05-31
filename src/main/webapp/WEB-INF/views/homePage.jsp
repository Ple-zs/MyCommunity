<%--
  Created by IntelliJ IDEA.
  User: 86135
  Date: 2020/5/31
  Time: 11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${ initParam.webUrl }/static/css/homePage.css"/>
<div class="home_fill_area">
    <input type="hidden" id="userHP_Path" value="${ initParam.webUrl }/static/images/user_HP/${ communityUser.user_HP_Path }"/>
    <div>
        <ol class="breadcrumb">
            <li><a href="${ initParam.webUrl }/index">首页</a></li>
            <li class="active">个人主页</li>
        </ol>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">个人资料</div>
        <div class="panel-body">
            <div class="table-V"></div>
            <table class="home_table">
                <tr>
                    <th class="home_th_width">上传头像</th>
                    <td class="home_td_width">
                        <div class="float_left">
                            <ul>
                                <li class="user_hp"><img src="${ initParam.webUrl }/static/images/user_HP/${ communityUser.user_HP_Path }" class="show_hp" alt=""></li>
                                <li>
                                    <button class="home_btn select_hp">选择文件</button>
                                    <button class="home_btn" onclick="reset_hp()">取消</button>
                                    <input type="file" class="file_input" id="file" style="display: none;"/>
                                </li>
                            </ul>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th class="home_th_width">用户名</th>
                    <td class="home_td_width">
                        <div class="home_input">
                            <div class="input-group"><input type="text" value="${ communityUser.userName }" disabled class="form-control" placeholder="用户名"
                                                            aria-describedby="basic-addon1"></div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th class="home_th_width">密码</th>
                    <td class="home_td_width">
                        <div class="home_input">
                            <div class="input-group">
                                <input type="text" class="form-control pwd1" placeholder="密码" aria-describedby="basic-addon1">
                                <span class="home_hint pwd1_hint">请输入密码</span>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th class="home_th_width">确认密码</th>
                    <td class="home_td_width">
                        <div class="home_input">
                            <div class="input-group">
                                <input type="text" class="form-control pwd2" placeholder="确认密码" aria-describedby="basic-addon1">
                                <span class="home_hint pwd2_hint">请再次确认密码</span>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th class="home_th_width">昵称</th>
                    <td class="home_td_width">
                        <div class="home_input">
                            <div class="input-group">
                                <input value="${ communityUser.nickName }" type="text" class="form-control nickName" placeholder="昵称" aria-describedby="basic-addon1">
                                <span class="home_hint nickName_hint">昵称不能为空</span>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th class="home_th_width">个性签名</th>
                    <td class="home_td_width">
                        <div class="home_input">
                            <div class="input-group"><input value="${ communityUser.signature }" type="text" class="form-control signature" placeholder="个性签名"
                                                            aria-describedby="basic-addon1"></div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th class="home_th_width">积分</th>
                    <td class="home_td_width">
                        <div class="home_input">
                            <div class="input-group"><input value="${ communityUser.grade }" type="text" disabled class="form-control" placeholder="积分"
                                                            aria-describedby="basic-addon1"></div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th class="home_th_width">Email</th>
                    <td class="home_td_width">
                        <div class="home_input">
                            <div class="input-group"><input value="${ communityUser.email }" type="text" disabled class="form-control"
                                                            placeholder="Email" aria-describedby="basic-addon1"></div>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <div class="panel-footer">
            <button class="home_btn update">修改</button>
            <a href="${ initParam.webUrl }/index" class="gotoHome">回到首页</a>
        </div>
    </div>
    <script>
        var imageBase64 = "";
        $(".select_hp").click(function () {
            $(".file_input").trigger("click");

        });
        $("#file").on("input", function () {
            if ($(".file_input").val() != null && $(".file_input").val().trim() != "") {
                var reads = new FileReader();
                f = document.getElementById('file').files[0];
                reads.readAsDataURL(f);
                reads.onload = function (e) {
                    $(".show_hp").attr("src", this.result);
                    imageBase64 = this.result;
                };
            }else{
                reset_hp();
            }
        });

        var nickNameBool = true;

        //昵称
        $(".nickName").blur(function () {
            if($(".nickName").val() == null || $(".nickName").val().trim() == ""){
                nickNameBool = false;
                $(".nickName_hint").show(300);
            }else{
                nickNameBool = true;
                $(".nickName_hint").hide(300);
            }
        });
        //
        $(".nickName").on("input",function () {
            $(".nickName_hint").hide(300);
        });
        $(".pwd1").on("input",function () {
            $(".pwd1_hint").hide(300);
        });
        $(".pwd2").on("input",function () {
            $(".pwd2_hint").hide(300);
        });

        //修改
        $(".update").click(function () {
            if(($(".pwd1").val() == null || $(".pwd1").val().trim() == "") && ($(".pwd2").val() == null || $(".pwd2").val().trim() == "")){
                if(nickNameBool){
                    $.post("modification",{"imageBase64":imageBase64,"nickName":$(".nickName").val(),"signature":$(".signature").val()},function (data) {
                        if(data == "false"){
                            alert("修改失败！");
                        }else{
                            refresh_home();
                        }
                    });
                }
            }else{
                var pwd1 = $(".pwd1").val();
                var pwd2 = $(".pwd2").val();
                if(pwd1.trim() == "" || pwd1 == null){
                    $(".pwd1_hint").show(300);
                    return false;
                }else if(pwd2.trim() == "" || pwd2 == null){
                    $(".pwd2_hint").show(300).html("请再次确认密码");
                }else if(pwd2 != pwd1){
                    $(".pwd2_hint").show(300).html("两次密码不相同");
                }else{
                    if(nickNameBool){
                        $.post("modification",{"imageBase64":imageBase64,"pwd":pwd1,"nickName":$(".nickName").val(),"signature":$(".signature").val()},function (data) {
                            if(data == "false"){
                                alert("修改失败！");
                            }else{
                                refresh_home();
                            }
                        });
                    }
                }
            }
        });
        
        //重置
        function reset_hp() {
            imageBase64 = "";
            $(".show_hp").attr("src",$("#userHP_Path").val());
        }

        //刷新
        function refresh_home(){
            location.reload();
        }
    </script>
</div>
