package com.noname.myproject.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QuestionVO {
	
	private int boardnum;
	private String userID;
	private String title;
	private String content;
	private String inputdate;
	private int hit;
}
