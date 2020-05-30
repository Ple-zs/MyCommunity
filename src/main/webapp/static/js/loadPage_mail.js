
//===收件===
//恢复
function recover_mail(cmrId) {
    $.post("recover_mail", {"cmrId": cmrId}, function () {
        refresh_mailStatus();
    })
}

//删除
function delete_mail(cmrId) {
    $.post("delete_mail", {"cmrId": cmrId}, function () {
        refresh_mailStatus();
    })
}

//清除
function clear_mail(cmrId) {
    $.post("clear_mail", {"cmrId": cmrId}, function () {
        refresh_mailStatus();
    })
}

//===发件===
//删除
function delete_sendMail(id) {
    $.post("delete_sendMail", {"id": id}, function () {
        refresh_mailStatus();
    })
}

//恢复
function recover_sendMail(id) {
    $.post("recover_sendMail", {"id": id}, function () {
        refresh_mailStatus();
    })
}

//清除
function clear_sendMail(id) {
    $.post("clear_sendMail", {"id": id}, function () {
        refresh_mailStatus();
    })
}

//查看邮件
function show_mail(cmsId) {
    $(".filler_email").load("show_mailContent",{"cmsId":cmsId},function () {
        $('.filler_email').each(function () {
            let _dom = $(this).html();
            $(this).after(_dom).remove();
        });
    });
}


//刷新
function refresh_mailStatus() {
    $(".filler_email").load($("#emailPage").val(),function () {
        $('.filler_email').each(function () {
            let _dom = $(this).html();
            $(this).after(_dom).remove();
        });
    })
}

var emailTitleBool = false;
var emailReceiversBool = false;
var emailContentBool = false;

$(".email_title").blur(function () {
    if($(this).val() == null || $(this).val().trim() == ""){
        $(".email_title_hint").show();
        emailTitleBool = false;
    }else{
        $(".email_title_hint").hide();
        emailTitleBool = true;
    }
});

$(".senderName").blur(function () {
    if ($(this).val() == null || $(this).val().trim() == "") {
        $(".email_receivers_hint").show().html("收件人不能为空！");
        emailReceiversBool = false;
    } else {
        let tempStr = $(this).val();
        let tempArray = tempStr.split(",");
        let notArray = new Array();
        for(let i in tempArray){
            $.get("userName_isExist",{"name":tempArray[i]},function (data) {
                if(data == "false"){
                    notArray.push(tempArray[i]);
                    emailReceiversBool = false;
                    $(".email_receivers_hint").show().html("收件人不存在！");
                    // alert("收件人：" + tempArray[i] + ",不存在！");
                }
            })
        }
        $(".email_receivers_hint").hide();
        emailReceiversBool = true;
    }
});

$(".email_content").blur(function () {
    if($(this).val() == null || $(this).val().trim() == ""){
        $(".email_content_hint").show();
        emailContentBool = false;
    }else{
        $(".email_content_hint").hide();
        emailContentBool = true;
    }
});

function not_nullF() {
    let bool = false;
    $(".email_title").trigger("blur");
    $(".senderName").trigger("blur");
    $(".email_content").trigger("blur");
    if(emailTitleBool && emailReceiversBool && emailContentBool){
        bool = true;
    }
    return bool;
}

//保存到草稿
function save_draft() {
    if(not_nullF()) {
        $.post("saveDraft", {
            "id": $("#mailId").val(),
            "title": $(".email_title").val(),
            "receivers": $(".senderName").val(),
            "content": $(".email_content").val()
        }, function (data) {
            if (data == "true") {
                location.replace("mailbox?page=5");
            } else {
                alert("保存失败！");
            }
        });
    }
}
//新增一个草稿
function add_draft() {
    if(not_nullF()) {
        $.post("addDraft", {
            "title": $(".email_title").val(),
            "receivers": $(".senderName").val(),
            "content": $(".email_content").val()
        }, function (data) {
            if (data == "true") {
                location.replace("mailbox?page=5");
            } else {
                alert("保存失败！");
            }
        });
    }
}
//发送
function send_mail() {
    if(not_nullF()) {
        $.post("sendMail",{"title":$(".email_title").val(),"receivers":$(".senderName").val(),"content":$(".email_content").val()},function (data) {
            if(data == "true"){
                location.replace("mailbox?page=4");
            }else{
                alert("发送失败！");
            }
        });
    }
}

//查看邮件
function readMail(id) {
    $(".filler_email").load("read_only_mail",{"id":id},function () {
        $('.filler_email').each(function () {
            let _dom = $(this).html();
            $(this).after(_dom).remove();
        });
    });
}

//回复
function replyMail() {

}


