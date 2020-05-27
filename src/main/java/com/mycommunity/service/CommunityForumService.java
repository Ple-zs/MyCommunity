package com.mycommunity.service;

import com.mycommunity.entity.CommunityForum;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommunityForumService {

    //获得主板块
    List<CommunityForum> getMainPartition();

    //通过主板块获得该板块内容
    List<CommunityForum> getPlateContent(@Param("parentId") int parentId);
}
