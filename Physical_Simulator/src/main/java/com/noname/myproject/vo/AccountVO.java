package com.noname.myproject.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AccountVO {

	private int userSeq;
	private String userID;
	private String userPW;
	private String userName;
	private String userPhone;
	private String userBirth;
	private String userQuest;
	private String userAnswer;
	
	
	
}
