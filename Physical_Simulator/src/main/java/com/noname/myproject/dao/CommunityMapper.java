package com.noname.myproject.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;

import com.noname.myproject.vo.QuestionVO;
import com.noname.myproject.vo.Reply_questVO;

public interface CommunityMapper {

	ArrayList<QuestionDAO> getQuestionList(HashMap<String, String> map, RowBounds rb);

	int getTotal(HashMap<String, String> map);

	int questionWrite(QuestionVO vo);

	int write_quest_reply(Reply_questVO vo);

	ArrayList<Reply_questVO> read_quest_reply(int boardnum);

	QuestionVO read_quest(QuestionVO vo);

	void update_quest_hit(QuestionVO vo);

	int delete_quest_reply(Reply_questVO vo);

	int delete_quest(QuestionVO vo);

	int update_quest(QuestionVO vo);

}
