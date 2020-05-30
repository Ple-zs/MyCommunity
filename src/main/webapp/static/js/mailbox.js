$(function () {
    //初始界面
    let showMailPage = $("#showMailPage").val();
    switch (showMailPage) {
        case "1":
            $(".show_mail_msg").load("all_mail");
            $(".navTitle").html("所有邮件");
            break;
        case "2":
            $(".show_mail_msg").load("starred");
            $(".navTitle").html("未读邮件");
            break;
        case "3":
            $(".show_mail_msg").load("receive_recycleBin");
            $(".navTitle").html("收信箱-回收站");
            break;
        case "4":
            $(".show_mail_msg").load("send");
            $(".navTitle").html("已发送");
            break;
        case "5":
            $(".show_mail_msg").load("draft");
            $(".navTitle").html("草稿箱");
            break;
        case "6":
            $(".show_mail_msg").load("send_recycleBin");
            $(".navTitle").html("发件箱-回收站");
            break;
        case "7":
            $(".show_mail_msg").load("show_mailContent");
            $(".navTitle").html("编写新邮件");
            break;
        default:
            $(".show_mail_msg").load("all_mail");
            $(".navTitle").html("所有邮件");
            break;
    }

    //收件
    $(".allMail").click(function () {
        $(".show_mail_msg").load("all_mail");
        $(".navTitle").html("所有邮件");
    });
    $(".unreadMail").click(function () {
        $(".show_mail_msg").load("starred");
        $(".navTitle").html("未读邮件");
    });
    $(".pickUp_recycleBin").click(function () {
        $(".show_mail_msg").load("receive_recycleBin");
        $(".navTitle").html("收信箱-回收站");
    });

    //发件
    $(".send").click(function () {
        $(".show_mail_msg").load("send");
        $(".navTitle").html("已发送");
    });
    $(".draft").click(function () {
        $(".show_mail_msg").load("draft");
        $(".navTitle").html("草稿箱");
    });
    $(".send_recycleBin").click(function () {
        $(".show_mail_msg").load("send_recycleBin");
        $(".navTitle").html("发件箱-回收站");
    });

    //编写
    $(".writeNewMail").click(function () {
        $(".show_mail_msg").load("show_mailContent");
        $(".navTitle").html("编写新邮件");
    });

});