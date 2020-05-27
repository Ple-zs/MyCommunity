package com.mycommunity.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.List;

@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class CommunityForum {
    private int id;
    private String name;
    private String description;
    private int parentId;
    private String forumImagePath;
    private List<CommunityForum> plateList;
}
