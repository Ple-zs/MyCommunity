package com.mycommunity.test;

import com.mycommunity.entity.CommunityUser;
import com.mycommunity.service.CommunityUserService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class CommunityUserServiceTest {
    public static void main(String[] args) {
        ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
        CommunityUserService communityUserService = (CommunityUserService) context.getBean(CommunityUserService.class);
        System.out.println("用户数量：" + communityUserService.getAll().size());
        System.out.println(communityUserService.getUserByStr("sam","123"));
        //注册 xiaofu
        CommunityUser communityUser = new CommunityUser();
        communityUser.setNickName("x1aoFu");
        communityUser.setUserName("xiaofu");
        communityUser.setPassWord("123");
        communityUser.setEmail("2506381226@qq.com");
        //System.out.println(communityUserService.userRegistration(communityUser)); 注册成功
        System.out.println(communityUserService.getUserByStr("xiaofu","ssss"));
        System.out.println(communityUserService.exists("xiaofu"));
    }
}
