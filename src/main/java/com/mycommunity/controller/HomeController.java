package com.mycommunity.controller;

import com.mycommunity.entity.CommunityForum;
import com.mycommunity.entity.CommunityTopic;
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


    @RequestMapping("/index")
    public String index(Model model) {
        List<CommunityForum> communityForumList =communityForumService.getMainPartition();
        List<CommunityTopic> communityTopicList = communityTopicService.getRecentlyHot_sixCountData();
        model.addAttribute("communityForumList",communityForumList);
        model.addAttribute("communityTopicList",communityTopicList);
        return "index";
    }

    @RequestMapping("/forumPlate")
    public String forumPlate(){

        return "forumPlate";
    }

}
