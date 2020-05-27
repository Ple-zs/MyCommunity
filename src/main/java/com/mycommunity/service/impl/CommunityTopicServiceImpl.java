package com.mycommunity.service.impl;

import com.mycommunity.dao.CommunityTopicDao;
import com.mycommunity.entity.CommunityTopic;
import com.mycommunity.service.CommunityTopicService;
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
}
