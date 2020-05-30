package com.mycommunity.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class CommunityMessageReceiving {
    private int id;
    private int messageSendingId;
    private int receiverId;
    private int readed;
    private int status;
    private CommunityMessageSending communityMessageSending;
    private String sendNickName;
}
