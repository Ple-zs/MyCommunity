package com.mycommunity.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.Date;

@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class CommunityTopic {
    private int id;
    private String title;
    private String content;
    private Date createTime;
    private int forumId;
    private int authorId;
    private String ip;
    private int commentTimes;
    private Date updateTime;
    private int clicks;
    private int isBest;
    private int status;
}
