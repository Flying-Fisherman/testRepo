package com.noname.myproject.dao;

import com.noname.myproject.vo.AccountVO;

public interface AccountMapper {

	int checkOverlap(AccountVO vo);

	int signUp(AccountVO vo);

	int checkLogIn(AccountVO vo);

	AccountVO getInfo(String attribute);

	int modifyInfo(AccountVO vo);

}
