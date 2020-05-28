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

import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private CommunityForumService communityForumService;
    @Autowired
    private CommunityTopicService communityTopicService;
    @Autowired
    private CommunityCommentService communityCommentService;


    @RequestMapping("/index")
    public String index(Model model) {
        List<CommunityForum> communityForumList =communityForumService.getMainPartition();
        List<CommunityTopic> communityTopicList = communityTopicService.getRecentlyHot_sixCountData();
        model.addAttribute("communityForumList",communityForumList);
        model.addAttribute("communityTopicList",communityTopicList);
        return "index";
    }

    @RequestMapping("/forumPlate")
    public String forumPlate(Model model,Integer forumId){
        forumId = forumId==null?-1:forumId;
        List<CommunityTopic> digestList = communityTopicService.getDigestByForumId_fiveCountData(forumId);
        CommunityForum communityForum = communityForumService.getCommunityForumById(forumId);
        model.addAttribute("digestList",digestList);
        model.addAttribute("forumId",forumId);
        model.addAttribute("communityForum",communityForum);
        return "forumPlate";
    }

    @RequestMapping("/forum")
    public String forum(Model model,Integer forumId,Integer currentPage,String title,Integer isBest){
        forumId = forumId==null?-1:forumId;
        currentPage = currentPage==null?1:currentPage;
        isBest = isBest==null?-1:isBest;
        int row = 5;
        int rowsCount = communityTopicService.rowsCount(forumId,title,isBest);
        int countPage = rowsCount%row==0?rowsCount/row:rowsCount/row+1;
        List<CommunityTopic> generalPartitionList = communityTopicService.getGeneralPartition_ByForumId(currentPage,row,forumId,title,isBest);
        model.addAttribute("forumId",forumId);
        model.addAttribute("rowsCount",rowsCount);
        model.addAttribute("countPage",countPage);
        model.addAttribute("currentPage",currentPage);
        model.addAttribute("generalPartitionList",generalPartitionList);
        model.addAttribute("title",title);
        model.addAttribute("isBest",isBest);
        return "loadPage/forum";
    }

    //搜索
    @RequestMapping("/search")
    public String search(Model model,String title){
        int rowsCount = communityTopicService.rowsCount(-1,title,-1);
        model.addAttribute("title",title);
        model.addAttribute("rowsCount",rowsCount);
        return "search";
    }

    //主题内容页
    @RequestMapping("/showTContent")
    public String showTContent(Model model,Integer tid){
        tid=tid==null?-1:tid;
        CommunityTopic communityTopic = communityTopicService.getCommunityTopicById(tid);
        model.addAttribute("tid",tid);
        model.addAttribute("communityTopic",communityTopic);
        return "showTContent";
    }

    @RequestMapping("/comment")
    public String comment(Model model,Integer tid,Integer currentPage,Integer row){
        tid=tid==null?-1:tid;
        row = row==null?4:row;
        currentPage=currentPage==null?1:currentPage;
        int rowsCount = communityCommentService.getRowsCount(tid);
        int countPage = 0;
        if(currentPage == 1){
            countPage = rowsCount%row==0?rowsCount/row:rowsCount/row+1;
        }else{
            countPage = (rowsCount+1)%row==0?(rowsCount+1)/row:(rowsCount+1)/row+1;
        }
        CommunityTopic communityTopic = communityTopicService.getCommunityTopicById(tid);
        List<CommunityComment> communityCommentList = communityCommentService.getCommunityCommentByTid(currentPage,row,tid);
        model.addAttribute("tid",tid);
        model.addAttribute("currentPage",currentPage);
        model.addAttribute("countPage",countPage);
        model.addAttribute("communityCommentList",communityCommentList);
        model.addAttribute("communityTopic",communityTopic);
        return "loadPage/comment";
    }

}
