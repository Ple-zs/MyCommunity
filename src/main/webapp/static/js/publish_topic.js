// 初始化板块id and 标题
var forumId = 0;
var topicBool = false;

//检查非空
$(".title_input").blur(function () {
    if($(this).val() == null || $(this).val().trim() == ""){
        $(".title_hint").show(300);
        topicBool = false;
    }else{
        $(".title_hint").hide(300);
        topicBool = true;
    }
});

//切换板块
function switchForum(doc) {
    let $doc = doc;
    forumId = $($doc).attr("data_forumId");
    $(".show_forumName").val($($doc).attr("data_forumName"));
    $(".forum_hint").hide(300);
}

//非空验证
function not_null_F(){
    let bool = true;
    let content = CKEDITOR.instances.TextArea1.getData();
    if(forumId < 1){
        $(".forum_hint").show(300);
        bool = false;
    }
    if(!topicBool){
        $(".title_input").trigger("blur");
        bool = false;
    }
    if(content == null || content.trim() == ""){
        $(".content_hint").show(300);
        setTimeout(function () {
            $(".content_hint").hide(1000);
        },3000);
        bool = false;
    }
    return bool;

}

//发表
$(".publish").click(function () {
    if(not_null_F()){
        $.post("sendTopic",{"title":$(".title_input").val(),"content":CKEDITOR.instances.TextArea1.getData(),"forumId":forumId,"ip":returnCitySN["cip"]},function (data) {
            if(data != "false"){
                location.replace(data);
            }else{
                alert("发表失败!");
            }
        });
    }
    return false;
});