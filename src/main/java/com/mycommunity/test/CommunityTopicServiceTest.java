package com.mycommunity.test;

import com.mycommunity.service.CommunityForumService;
import com.mycommunity.service.CommunityTopicService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class CommunityTopicServiceTest {
    public static void main(String[] args) {
        ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
        CommunityTopicService communityTopicService = (CommunityTopicService) context.getBean(CommunityTopicService.class);
        System.out.println(communityTopicService.getRecentlyHot_sixCountData().get(0));
        System.out.println(communityTopicService.getRecentlyHot_sixCountData().size());
    }
}
