package com.mycommunity.dao;

import com.mycommunity.entity.CommunityComment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommunityCommentDao {

    //根据主题id获得评论
    List<CommunityComment> getCommunityCommentByTid(@Param("currentPage")int currentPage,@Param("row")int row,@Param("tid") int tid);

    //根据主题id获得评论数量
    int getRowsCount(@Param("tid") int tid);

    //添加评论
    int addCommunityComment(CommunityComment communityComment);
}
