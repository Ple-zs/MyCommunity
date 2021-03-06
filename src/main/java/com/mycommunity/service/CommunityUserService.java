package com.mycommunity.service;

import com.mycommunity.entity.CommunityUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommunityUserService {
    //获取所有用户
    List<CommunityUser> getAll();

    //根据用户名and密码获取用户
    CommunityUser getUserByStr(@Param("name") String name, @Param("pwd") String pwd);

    //注册
    int userRegistration(CommunityUser communityUser);

    //查询用户名是否存在
    int exists(@Param("name") String name);

    //根据Name获得Id
    int getUserIdByName(@Param("name")String name);

    //根据id获得Name
    String getUserNameById(@Param("id") int id);

    //更新用户资料
    int updateUser(CommunityUser communityUser);

    //根据id获取用户
    CommunityUser getUserById(@Param("id") int id);
}
