package com.mycommunity.service.impl;

import com.mycommunity.dao.CommunityTopicDao;
import com.mycommunity.entity.CommunityTopic;
import com.mycommunity.service.CommunityTopicService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class CommunityTopicServiceImpl implements CommunityTopicService {

    @Autowired
    private CommunityTopicDao communityTopicDao;

    @Override
    public List<CommunityTopic> getRecentlyHot_sixCountData() {
        return communityTopicDao.getRecentlyHot_sixCountData();
    }

    @Override
    public List<CommunityTopic> getDigestByForumId_fiveCountData(int forumId) {
        return communityTopicDao.getDigestByForumId_fiveCountData(forumId);
    }

    @Override
    public List<CommunityTopic> getGeneralPartition_ByForumId(int currentPage, int row, int forumId, String title,int isBest) {
        return communityTopicDao.getGeneralPartition_ByForumId(currentPage, row, forumId, title,isBest);
    }

    @Override
    public int rowsCount(int forumId, String title,int isBest) {
        return communityTopicDao.rowsCount(forumId, title,isBest);
    }

    @Override
    public CommunityTopic getCommunityTopicById(int id) {
        return communityTopicDao.getCommunityTopicById(id);
    }

    @Override
    public int addCommunityTopic(CommunityTopic communityTopic) {
        return communityTopicDao.addCommunityTopic(communityTopic);
    }

    @Override
    public int getNewestCommunityTopicId() {
        return communityTopicDao.getNewestCommunityTopicId();
    }
}
