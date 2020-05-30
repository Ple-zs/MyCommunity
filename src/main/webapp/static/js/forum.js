$(function () {
    $(".bor_btm tr:last").css("border-bottom","1px solid #DDDDDD");
});

//换页
function paging(currentPage) {
    $(".fill_area_2").load("forum",{"currentPage":currentPage,"forumId":$("#fid_2").val(),"title":$("#title_2").val(),"isBest":$("#isBest_2").val()},function(){
        $('.fill_area_2').each(function(){
            let _dom = $(this).html();
            $(this).after(_dom).remove();
        });
    });
}

//更新点击量
$(".gotoTopic").click(function () {
    $.post("updateClicks",{"tid":$(this).attr("data_tid")},function () {return true;});
});