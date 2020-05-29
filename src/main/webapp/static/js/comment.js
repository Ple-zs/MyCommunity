//显示楼主
if ($("#currentPage").val() == 1) {
    $(".one_floor").show();
} else {
    $(".one_floor").hide();
}

//悬浮楼层出现回复按钮
$(".hover_floor").hover(function () {
    $(this).children("span").children("button").show();
}, function () {
    if ($(this).children("span").children("button").attr("class") != "reply_cid_btn")
        $(this).children("span").children("button").hide();
})

//回复的楼层ID
var replyId = 0;

//点击回复方法
function replyF(btn) {
    let $btn = btn;
    //alert($($btn).attr("data_cid"));
    if ($($btn).attr("class") == "reply_cid_btn") {
        $("td button:not(.publish)").attr("class", "reply_btn_hover");
        $(".reply_floor_hint").hide();
        replyId = 0;
    } else {
        $("td button:not(.publish)").attr("class", "reply_btn_hover").hide();
        $($btn).removeAttr("class");
        $($btn).attr("class", "reply_cid_btn").show();
        $(".user_nickName").html($($btn).attr("data_reply_user_nickName"));
        $(".reply_floor_hint").show();
        replyId = $($btn).attr("data_cid");
    }
}


//换页
function commentPaging(row, currentPage) {
    $(".fill_area_3").load("comment", {"currentPage": currentPage, "tid": $("#tid_2").val(), "row": row}, function () {
        $('.fill_area_3').each(function () {
            let _dom = $(this).html();
            $(this).after(_dom).remove();
        });
    });
}

//隐藏非空提示
$(".reply_content").on("input",function () {
    $(".non_null_hint").hide(300);
});

//发表
function publishF() {
    if($(".reply_content").val() == null || $(".reply_content").val().trim() == ""){
        $(".non_null_hint").show(300);
    }else{
        $.post("send/sendComment",{"tid":$("#tid_2").val(),"content":$(".reply_content").val(),"replyId":replyId,"ip":returnCitySN["cip"]},function (data) {
            if(data == "true"){
                alert("发表成功!");
                commentPaging($("#row").val(),$("#currentPage").val());
            }else{
                alert("发表失败!");
            }
        });
    }
}