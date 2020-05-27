package com.mycommunity.service;

import com.mycommunity.entity.CommunityTopic;

import java.util.List;

public interface CommunityTopicService {
    //获得六条数据
    List<CommunityTopic> getRecentlyHot_sixCountData();
}
