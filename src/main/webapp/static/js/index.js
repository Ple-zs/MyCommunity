$(function () {
    //更新点击量
    $(".gotoTopic").click(function () {
        $.post("updateClicks",{"tid":$(this).attr("data_tid")},function () {return true;});
    });


});
