package com.mycommunity.test;

import com.mycommunity.service.CommunityMessageReceivingService;
import com.mycommunity.service.CommunityMessageSendingService;
import com.mycommunity.service.CommunityUserService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class CommunityMessageSendingServiceTest {
    public static void main(String[] args) {
        ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
        CommunityMessageSendingService communityMessageSendingService = (CommunityMessageSendingService) context.getBean(CommunityMessageSendingService.class);
        CommunityUserService communityUserService = (CommunityUserService) context.getBean(CommunityUserService.class);
        String str = "sam,xiaofu";
        String[] strArray = str.split(",");
//        System.out.println(communityMessageSendingService.sendMail(2,strArray));
        System.out.println(communityUserService.getUserIdByName("xiaofu"));
    }
}
