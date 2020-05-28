package com.mycommunity.test;

import com.mycommunity.entity.CommunityComment;
import com.mycommunity.service.CommunityCommentService;
import com.mycommunity.service.CommunityForumService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class CommunityCommentServiceTest {
    public static void main(String[] args) {
        ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
        CommunityCommentService communityCommentService = (CommunityCommentService) context.getBean(CommunityCommentService.class);
        System.out.println(communityCommentService.getRowsCount(2));
        for (CommunityComment communityComment:communityCommentService.getCommunityCommentByTid(1,5,2)) {
            System.out.println(communityComment);
        }
    }
}
