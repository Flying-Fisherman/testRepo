package com.noname.myproject.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Reply_questVO {
	
	private int replynum;
	private int boardnum;
	private String userID;
	private String replyText;
	private String inputdate;
}
