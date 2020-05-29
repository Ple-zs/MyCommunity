package com.mycommunity.service.impl;

import com.mycommunity.dao.CommunityForumDao;
import com.mycommunity.entity.CommunityForum;
import com.mycommunity.service.CommunityForumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommunityForumServiceImpl implements CommunityForumService {

    @Autowired
    private CommunityForumDao communityForumDao;

    @Override
    public List<CommunityForum> getMainPartition() {
        List<CommunityForum> mainList = communityForumDao.getMainPartition();
        for (CommunityForum communityForum: mainList) {
            communityForum.setPlateList(communityForumDao.getPlateContent(communityForum.getId()));
        }
        return mainList;
    }

    @Override
    public List<CommunityForum> getPlateContent(int parentId) {
        return communityForumDao.getPlateContent(parentId);
    }

    @Override
    public CommunityForum getCommunityForumById(int id) {
        return communityForumDao.getCommunityForumById(id);
    }

    @Override
    public List<CommunityForum> getCommunityForumExcludeMain() {
        return communityForumDao.getCommunityForumExcludeMain();
    }
}
