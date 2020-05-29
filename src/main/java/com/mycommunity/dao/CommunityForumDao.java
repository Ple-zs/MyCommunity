package com.mycommunity.dao;

import com.mycommunity.entity.CommunityForum;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommunityForumDao {
    //获得主板块
    List<CommunityForum> getMainPartition();

    //通过主板块获得该板块内容
    List<CommunityForum> getPlateContent(@Param("parentId") int parentId);

    //根据id获得板块信息
    CommunityForum getCommunityForumById(@Param("id") int id);

    //获得全部板块内容不包括主板
    List<CommunityForum>getCommunityForumExcludeMain();
}
