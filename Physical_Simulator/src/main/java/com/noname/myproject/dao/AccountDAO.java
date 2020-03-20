package com.noname.myproject.dao;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.noname.myproject.vo.AccountVO;

@Repository
public class AccountDAO {
	
	@Autowired
	private SqlSession sqlsession;

	public boolean checkOverlap(AccountVO vo) {
		int res = 1;
		try {
			AccountMapper mapper = sqlsession.getMapper(AccountMapper.class);
			res = mapper.checkOverlap(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res < 1;
	}

	public boolean signUp(AccountVO vo) {
		int res = 0;
		try {
			AccountMapper mapper = sqlsession.getMapper(AccountMapper.class);
			res = mapper.signUp(vo);
			sqlsession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res > 0;
	}

	public boolean checkLogIn(AccountVO vo, HttpSession session) {
		int res = 0;
		try {
			AccountMapper mapper = sqlsession.getMapper(AccountMapper.class);
			res = mapper.checkLogIn(vo);
			if(res > 0) {
				session.setAttribute("userID", vo.getUserID());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res > 0;
	}

	public AccountVO getInfo(HttpSession session) {
		AccountVO vo = new AccountVO();
		try {
			AccountMapper mapper = sqlsession.getMapper(AccountMapper.class);
			vo = mapper.getInfo((String)session.getAttribute("userID"));
			vo.setUserBirth(vo.getUserBirth().substring(0, 10));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}

	public boolean modifyInfo(AccountVO vo) {
		int res = 0;
		try {
			AccountMapper mapper = sqlsession.getMapper(AccountMapper.class);
			res = mapper.modifyInfo(vo);
			sqlsession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res > 0;
	}

}
