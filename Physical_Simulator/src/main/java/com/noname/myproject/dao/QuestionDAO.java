package com.noname.myproject.dao;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.noname.myproject.vo.QuestionVO;
import com.noname.myproject.vo.Reply_questVO;

@Repository
public class QuestionDAO {
	
	private final int countPerPage = 10;
	private final int pagePerGroup = 5;
	
	@Autowired
	private SqlSession sqlsession;
	
	public ArrayList<QuestionDAO> getQuestionList(String searchItem, String searchKey, PageNavigator navi) {
		CommunityMapper mapper = sqlsession.getMapper(CommunityMapper.class);
		HashMap<String, String> map = new HashMap<>();
		map.put("Item", searchItem);
		map.put("Key", searchKey);
		ArrayList<QuestionDAO> list = null;
		RowBounds rb = new RowBounds(navi.getStartRecord(), navi.getCountPerPage());
		try {
			list = mapper.getQuestionList(map, rb);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public PageNavigator getNavi(int currentPage, String searchItem, String searchKey) {
		HashMap<String, String> map = new HashMap<>();
		CommunityMapper mapper = sqlsession.getMapper(CommunityMapper.class);
		map.put("searchItem", searchItem);
		map.put("searchKey", searchKey);
		int totalRecordsCount = 0;
		
		try {
			totalRecordsCount = mapper.getTotal(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, currentPage, totalRecordsCount);
		return navi;
	}

	public boolean questionWrite(QuestionVO vo, HttpSession session) {
		
		CommunityMapper mapper = sqlsession.getMapper(CommunityMapper.class);
		int res = 0;
		vo.setUserID((String)session.getAttribute("userID"));
		
		try {
			res = mapper.questionWrite(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res > 0;
	}

	public boolean write_quest_reply(Reply_questVO vo, HttpSession session) {
		CommunityMapper mapper = sqlsession.getMapper(CommunityMapper.class);
		vo.setUserID((String)session.getAttribute("userID"));
		int res = 0;
		try {
			System.out.println(vo);
			res = mapper.write_quest_reply(vo);
			sqlsession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res>0;
	}
	
	public ArrayList<Reply_questVO> read_quest_reply(int boardnum) {
		ArrayList<Reply_questVO> list = null;
		CommunityMapper mapper = sqlsession.getMapper(CommunityMapper.class);
		try {
			list = mapper.read_quest_reply(boardnum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public Object boardRead(QuestionVO vo, boolean temp2) {
		CommunityMapper mapper = sqlsession.getMapper(CommunityMapper.class);
		QuestionVO temp = null;
		try {
			if(temp2) {mapper.update_quest_hit(vo);}
			temp = mapper.read_quest(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}

	public boolean delete_quest_reply(Reply_questVO vo, HttpSession session) {
		CommunityMapper mapper = sqlsession.getMapper(CommunityMapper.class);
		vo.setUserID((String)session.getAttribute("userID"));
		int res = 0;
		try {
			res = mapper.delete_quest_reply(vo);
			sqlsession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res > 0;
	}

	public boolean delete_quest(QuestionVO vo, HttpSession session) {
		CommunityMapper mapper = sqlsession.getMapper(CommunityMapper.class);
		int res = 0;
		vo.setUserID((String)session.getAttribute("userID"));
		try {
			res = mapper.delete_quest(vo);
			sqlsession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res > 0;
	}

	public boolean update_question(QuestionVO vo, HttpSession session, MultipartFile uploadFile) {
		CommunityMapper mapper = sqlsession.getMapper(CommunityMapper.class);
		int res = 0;
		vo.setUserID((String)session.getAttribute("userID"));
		try {
			//비어있지 않는 경우
			res = mapper.update_quest(vo);
			sqlsession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res > 0;
	}

	public Object update_quest_read(QuestionVO vo, HttpSession session) {
		CommunityMapper mapper = sqlsession.getMapper(CommunityMapper.class);
		QuestionVO temp = null;
		vo.setUserID((String)session.getAttribute("userID"));
		try {
			temp = mapper.read_quest(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}
}
