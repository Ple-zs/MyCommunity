package com.mycommunity.controller;

import com.mycommunity.entity.CommunityComment;
import com.mycommunity.entity.CommunityForum;
import com.mycommunity.entity.CommunityTopic;
import com.mycommunity.service.CommunityCommentService;
import com.mycommunity.service.CommunityForumService;
import com.mycommunity.service.CommunityTopicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/send")
public class SendController {

    @Autowired
    private CommunityCommentService communityCommentService;
    @Autowired
    private CommunityForumService communityForumService;
    @Autowired
    private CommunityTopicService communityTopicService;

    @RequestMapping("/sendComment")
    @ResponseBody
    public void sendComment(String content, Integer tid, Integer replyId, String ip, HttpSession session, HttpServletResponse response) throws IOException {
        int userId = Integer.valueOf(session.getAttribute("loginUserId").toString());
        int type = 1;
        int referenceId = tid;
        if (replyId > 0) {
            type = 2;
            referenceId = replyId;
        }
        System.out.println("userId:" + userId + " | " + "content:" + content + " | " + "ip:" + ip + " | " + "type:" + type + " | " + "referenceId:" + referenceId);
        CommunityComment communityComment = new CommunityComment();
        communityComment.setCommenterId(userId);
        communityComment.setContent(content);
        communityComment.setIp(ip);
        communityComment.setCommentType(type);
        communityComment.setReferenceId(referenceId);
        int result = communityCommentService.addCommunityComment(communityComment);
        if(result > 0){
            communityTopicService.updateCommentTimesById(tid);
            communityTopicService.updateRecentlyCommunityTimeById(tid);
            response.getWriter().print("true");
        }else{
            response.getWriter().print("false");
        }
    }

    //发表主题页面
    @RequestMapping("/publishTopic")
    public String publishTopic(Model model,Integer fid){
        fid=fid==null?-1:fid;
        List<CommunityForum> communityForumList = communityForumService.getCommunityForumExcludeMain();
        model.addAttribute("fid",fid);
        model.addAttribute("communityForumList",communityForumList);
        return "publishTopic";
    }

    //发表主题
    @RequestMapping("/sendTopic")
    @ResponseBody
    public void sendTopic(String title, String content, Integer forumId, String ip, HttpSession session, HttpServletResponse response,HttpServletRequest request) throws IOException {
        int userId = Integer.valueOf(session.getAttribute("loginUserId").toString());
        CommunityTopic communityTopic = new CommunityTopic();
        communityTopic.setAuthorId(userId);
        communityTopic.setContent(content);
        communityTopic.setForumId(forumId);
        communityTopic.setIp(ip);
        communityTopic.setTitle(title);
        System.out.println("userId:" + userId + " | " + "title:" + title + " | " + "forumId:" + forumId + " | " + "ip:" + ip);
        System.out.println("content:" + content);
        int result = communityTopicService.addCommunityTopic(communityTopic);
        if(result > 0){
            String url = request.getContextPath() + "/showTContent?tid=" + communityTopicService.getNewestCommunityTopicId();
            response.getWriter().print(url);
        }else{
            response.getWriter().print("false");
        }
    }

}
