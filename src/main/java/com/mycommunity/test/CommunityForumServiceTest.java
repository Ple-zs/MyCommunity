package com.mycommunity.test;

import com.mycommunity.entity.CommunityForum;
import com.mycommunity.service.CommunityForumService;
import com.mycommunity.service.CommunityUserService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class CommunityForumServiceTest {
    public static void main(String[] args) {
        ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
        CommunityForumService communityForumService = (CommunityForumService) context.getBean(CommunityForumService.class);
        System.out.println("主要板块：" + communityForumService.getMainPartition().size());
        System.out.println("主板块为1的内容：" + communityForumService.getPlateContent(1).size());
        System.out.println(communityForumService.getPlateContent(1).get(0));
        for (CommunityForum communityForum: communityForumService.getMainPartition()) {
            System.out.println("主板块Id：" + communityForum.getId() + "\t" + "板块内容：" + communityForum.getPlateList().size());
        }
    }
}
