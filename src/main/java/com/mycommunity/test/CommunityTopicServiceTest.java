package com.mycommunity.test;

import com.mycommunity.entity.CommunityTopic;
import com.mycommunity.service.CommunityForumService;
import com.mycommunity.service.CommunityTopicService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class CommunityTopicServiceTest {
    public static void main(String[] args) {
        ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
        CommunityTopicService communityTopicService = (CommunityTopicService) context.getBean(CommunityTopicService.class);
//        System.out.println(communityTopicService.getRecentlyHot_sixCountData().get(0));
//        System.out.println(communityTopicService.getRecentlyHot_sixCountData().size());
//        System.out.println(communityTopicService.rowsCount(3,".",-1));
//        for (CommunityTopic communityTopic:communityTopicService.getGeneralPartition_ByForumId(2,5,3,null,-1)) {
//            System.out.println(communityTopic);
//        }
//        System.out.println(communityTopicService.getNewestCommunityTopicId());
        CommunityTopic communityTopic = new CommunityTopic();
        communityTopic.setAuthorId(9);
        communityTopic.setContent("ceshi");
        communityTopic.setForumId(10);
        communityTopic.setIp("223.73.218.3");
        communityTopic.setTitle("册数");
        System.out.println(communityTopicService.addCommunityTopic(communityTopic));
    }
}
