$(function () {
    let userNameBool = true;
    let passWordBool = true;
    $(".userName").blur(function () {
        if($(this).val() == null || $(this).val().trim() == ""){
            $(this).next().html("请输入用户名").show();
            userNameBool = false;
        }else{
            $(this).next().hide();
            userNameBool = true;
        }
    });
    $(".passWord").blur(function () {
        if($(this).val() == null || $(this).val().trim() == ""){
            $(this).next().html("请输入密码").show();
            passWordBool = false;
        }else{
            $(this).next().hide();
            passWordBool = true;
        }
    });

    //隐藏登录失败提示
    $("#login_form input").on("input",function () {
        $(".login_hint").hide();
    });

    //登录提交
    $(".login_btn").click(function () {
        $("input").trigger("blur");
        if(userNameBool && passWordBool){
            $.post("userLogin",{"name":$(".userName").val(),"pwd":$(".passWord").val()},function (data) {
                if(data == "true"){
                    location.replace("index");
                }else{
                    $(".login_hint").show();
                }
            });
        }
        return false;
    });

    //重置
    $(".reset_btn").click(function () {
        $(".input_hint").hide();
    });

});