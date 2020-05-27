$(function () {

    let nickNameBool = true;
    let userNameBool = true;
    let pwdBool = true;
    let pwd2Bool = true;
    let emailBool = true;

    $(".nickName").blur(function () {
        if ($(this).val() == null || $(this).val().trim() == "") {
            $(this).next().html("昵称不能为空！").show();
            nickNameBool = false;
        }else{
            $(this).next().hide();
            nickNameBool = true;
        }
    });
    $(".userName").blur(function () {
        if ($(this).val() == null || $(this).val().trim() == "") {
            $(this).next().html("用户名不能为空！").show();
            userNameBool = false;
        }else{
            $.post("userNameExists",{"name":$(this).val()},function (data) {
                if(data == "true"){
                    userNameBool = false;
                    $(".userName").next().html("用户名已存在！").show();
                }else{
                    $(".userName").next().hide();
                    userNameBool = true;
                }
            });
            //ajax 查询数据库 该名字是否存在
        }
    });
    $(".pwd").blur(function () {
        if ($(this).val() == null || $(this).val().trim() == "") {
            $(this).next().html("密码不能为空！").show();
            pwdBool = false;
        }else{
            $(this).next().hide();
            pwdBool = true;
        }
    });
    $(".pwd2").blur(function () {
        if ($(this).val() == null || $(this).val().trim() == "") {
            $(this).next().html("请再次确认密码！").show();
            pwd2Bool = false;
        }else{
            if($(".pwd2").val() != $(".pwd").val()){
                $(".pwd2").next().html("密码不正确！").show();
                pwd2Bool = false;
            }else{
                $(".pwd2").next().hide();
                pwd2Bool = true;
            }

        }
    });
    $(".email").blur(function () {
        if ($(this).val() == null || $(this).val().trim() == "") {
            $(this).next().html("邮箱不能为空！").show();
            emailBool = false;
        }else{
            const EMAIL_FORMAT = /^\w+@\w+(\.[a-zA-Z]{2,3}){1,2}$/;
            if(!EMAIL_FORMAT.test($(".email").val())){
                emailBool = false;
                $(".email").next().html("请输入正确的邮箱格式！").show();
            }else{
                $(this).next().hide();
                emailBool = true;
            }
        }
    });

    //注册提交
    $(".register_btn").click(function () {
        $("#register_form input").trigger("blur");
        if(nickNameBool && userNameBool && pwdBool && pwd2Bool && emailBool){
            let nickName = $(".nickName").val();
            let name = $(".userName").val();
            let pwd = $(".pwd").val();
            let email = $(".email").val();
            $.post("userRegister",{"nickName":nickName,"name":name,"pwd":pwd,"email":email},function (data) {
                if(data == "true"){
                    alert("注册成功！");
                    location.replace("index");
                }else{
                    alert("注册失败！");
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