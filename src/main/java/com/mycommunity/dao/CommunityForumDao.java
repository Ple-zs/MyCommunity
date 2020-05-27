package com.mycommunity.dao;

import com.mycommunity.entity.CommunityForum;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommunityForumDao {
    //获得主板块
    List<CommunityForum> getMainPartition();

    //通过主板块获得该板块内容
    List<CommunityForum> getPlateContent(@Param("parentId") int parentId);
}
