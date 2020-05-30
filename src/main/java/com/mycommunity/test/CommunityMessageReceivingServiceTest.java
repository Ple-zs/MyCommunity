package com.mycommunity.test;

import com.mycommunity.entity.CommunityMessageReceiving;
import com.mycommunity.service.CommunityMessageReceivingService;
import com.mycommunity.service.CommunityTopicService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class CommunityMessageReceivingServiceTest {
    public static void main(String[] args) {
        ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
        CommunityMessageReceivingService communityMessageReceivingService = (CommunityMessageReceivingService) context.getBean(CommunityMessageReceivingService.class);
        for (CommunityMessageReceiving communityMessageReceiving:communityMessageReceivingService.getAllMailById(1,1,-1)) {
            System.out.println(communityMessageReceiving);
        }
    }
}
