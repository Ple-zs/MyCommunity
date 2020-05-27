package com.mycommunity.service.impl;

import com.mycommunity.dao.CommunityUserDao;
import com.mycommunity.entity.CommunityUser;
import com.mycommunity.service.CommunityUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class CommunityUserServiceImpl implements CommunityUserService {

    @Autowired
    private CommunityUserDao communityUserDao;

    @Override
    public List<CommunityUser> getAll() {
        return communityUserDao.getAll();
    }

    @Override
    public CommunityUser getUserByStr(String name, String pwd) {
        return communityUserDao.getUserByStr(name, pwd);
    }

    @Override
    public int userRegistration(CommunityUser communityUser) {
        return communityUserDao.userRegistration(communityUser);
    }

    @Override
    public int exists(String name) {
        return communityUserDao.exists(name);
    }

}
