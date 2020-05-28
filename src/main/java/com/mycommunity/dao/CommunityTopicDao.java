package com.mycommunity.dao;

import com.mycommunity.entity.CommunityTopic;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommunityTopicDao {
    //获得六条数据
    List<CommunityTopic> getRecentlyHot_sixCountData();

    //根据板块id获得5条精华帖
    List<CommunityTopic> getDigestByForumId_fiveCountData(@Param("forumId") int forumId);

    //获得普通帖数据 分页
    List<CommunityTopic> getGeneralPartition_ByForumId(@Param("currentPage")int currentPage,@Param("row")int row,@Param("forumId") int forumId,@Param("title")String title,@Param("isBest") int isBest);

    //获得记录总行数
    int rowsCount(@Param("forumId") int forumId,@Param("title")String title,@Param("isBest") int isBest);

    //根据id获得主题
    CommunityTopic getCommunityTopicById(@Param("id") int id);
}
