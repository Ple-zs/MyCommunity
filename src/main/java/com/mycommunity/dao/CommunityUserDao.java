package com.mycommunity.dao;

import com.mycommunity.entity.CommunityUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommunityUserDao {
    //获取所有用户
    List<CommunityUser> getAll();

    //根据用户名and密码获取用户
    CommunityUser getUserByStr(@Param("name") String name, @Param("pwd") String pwd);

    //注册
    int userRegistration(CommunityUser communityUser);

    //查询用户名是否存在
    int exists(@Param("name")String name);
}
