package com.noname.myproject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.noname.myproject.dao.AccountDAO;
import com.noname.myproject.vo.AccountVO;

@Controller
public class AccountController {
	
	@Autowired
	private AccountDAO dao;

	
	@RequestMapping(value = "account/onLogIn", method = RequestMethod.POST)
	public String logIn(AccountVO vo, String pageLocation, HttpSession session, RedirectAttributes rttr, HttpServletRequest request) {
		boolean res = dao.checkLogIn(vo, session);
		rttr.addFlashAttribute("logInRes", res);
		return "redirect:" + pageLocation;
	}
	
	@RequestMapping(value = "account/account_SignUp", method = RequestMethod.GET)
	public String account_SignUp() {
		
		return "/account/account_SignUp";
	}
	
	@RequestMapping(value = "account/account_IDCheck", method = RequestMethod.GET)
	public String account_IDCheck() {
		return "/account/account_IDCheck";
	}
	
	@RequestMapping(value = "account/account_CheckOverlap", method = RequestMethod.POST)
	public String account_CheckOverlap(AccountVO vo, RedirectAttributes rttr) {
		boolean checkRes = dao.checkOverlap(vo);
		rttr.addFlashAttribute("checkRes", checkRes);
		rttr.addFlashAttribute("userID", vo.getUserID());
		return "redirect:/account/account_IDCheck";
	}
	
	@RequestMapping(value = "account/account_SignUpProcess", method = RequestMethod.POST)
	public String account_SignUpProcess(AccountVO vo, RedirectAttributes rttr) {
		boolean checkRes = dao.signUp(vo);
		System.out.println(vo);
		rttr.addFlashAttribute("checkRes", checkRes);
		return "redirect:/";
	}
	
	@RequestMapping(value = "account/logOut", method = RequestMethod.GET)
	public String logOut(boolean logOutReq, String pageLocation, HttpSession session, RedirectAttributes rttr) {
		session.removeAttribute("userID");
		rttr.addFlashAttribute("logOutRes", true);
		return "redirect:" + pageLocation;
	}
	
	@RequestMapping(value = "account/account_MyPage", method = RequestMethod.GET)
	public String account_MyPage() {
		return "/account/account_MyPage";
	}
	
	@RequestMapping(value = "account/account_Information", method = RequestMethod.GET)
	public String account_Information(HttpSession session, Model model) {
		model.addAttribute("vo", dao.getInfo(session));
		return "/account/account_Information";
	}
	
	@RequestMapping(value = "account/account_Modify", method = RequestMethod.GET)
	public String account_Modify(HttpSession session, Model model) {
		model.addAttribute("vo", dao.getInfo(session));
		return "/account/account_Modify";
	}
	
	@RequestMapping(value = "account/account_ModifyProcess", method = RequestMethod.POST)
	public String account_ModifyProcess(AccountVO vo, RedirectAttributes rttr) {
		rttr.addFlashAttribute("modifyRes", dao.modifyInfo(vo));
		return "redirect:/account/account_Information";
	}
	
	
}
