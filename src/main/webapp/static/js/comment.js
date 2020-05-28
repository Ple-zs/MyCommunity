$(function () {


    if ($("#currentPage").val() == 1) {
        $(".one_floor").show();
    } else {
        $(".one_floor").hide();
    }

//回复的楼层ID
    let replyId = 0;

//悬浮楼层出现回复按钮
    $(".hover_floor").hover(function () {
        $(this).children("span").children("button").show();
    }, function () {
        if ($(this).children("span").children("button").attr("class") != "reply_cid_btn")
            $(this).children("span").children("button").hide();
    })

//点击回复按钮
    $("td button:not(.publish)").click(function () {
        if ($(this).attr("class") == "reply_cid_btn") {
            $("td button:not(.publish)").attr("class", "reply_btn_hover");
            $(".reply_floor_hint").hide();
            replyId = 0;
        } else {
            $("td button:not(.publish)").attr("class", "reply_btn_hover").hide();
            $(this).removeAttr("class");
            $(this).attr("class", "reply_cid_btn").show();
            $(".user_nickName").html($(this).attr("data_reply_user_nickName"));
            $(".reply_floor_hint").show();
            replyId = $(this).attr("data_cid");
        }
    });
});


//换页
function commentPaging(row, currentPage) {
    $(".fill_area_3").load("comment", {"currentPage": currentPage, "tid": $("#tid_2").val(), "row": row}, function () {
        $('.fill_area_3').each(function () {
            let _dom = $(this).html();
            $(this).after(_dom).remove();
        });
    });
}