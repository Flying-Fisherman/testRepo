package com.noname.myproject.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.noname.myproject.dao.PageNavigator;
import com.noname.myproject.dao.QuestionDAO;
import com.noname.myproject.vo.QuestionVO;
import com.noname.myproject.vo.Reply_questVO;


@Controller
public class CommunityController {
	
	@Autowired
	private QuestionDAO daoQ;
	
	
	@RequestMapping(value="community/community_question", method = RequestMethod.GET)
	public String community_question(Model model,
			@RequestParam(value="currentPage", defaultValue="1") int currentPage,
			@RequestParam(value="searchItem", defaultValue="title") String searchItem,
			@RequestParam(value="searchKey", defaultValue="") String searchKey) {
		
		PageNavigator navi = daoQ.getNavi(currentPage, searchItem, searchKey);
		ArrayList<QuestionDAO> list = daoQ.getQuestionList(searchItem, searchKey, navi);
		model.addAttribute("questionList", list);
		model.addAttribute("searhItem", searchItem);
		model.addAttribute("searchKey", searchKey);
		model.addAttribute("navi", navi);
		
		return "/community/community_question";	
	}
	
	@RequestMapping(value = "community/write_question", method = RequestMethod.GET)
	public String write_question() {
		return "/community/write_question";
	}
	
	@RequestMapping(value = "community/write_question_process", method = RequestMethod.POST)
	public String boardWrite(QuestionVO vo,HttpSession session, RedirectAttributes rttr) {
		boolean res = false;
		res = daoQ.questionWrite(vo, session);
		rttr.addFlashAttribute("questdWriteRes", res);
		return "redirect:/community/community_question";
	}
	
	@RequestMapping(value = "community/read_question", method = RequestMethod.GET)
	public String read_question(QuestionVO vo, HttpSession session, Model model, boolean temp) {
		boolean temp2 = true;
		if(temp) {temp2 = !temp;}
		ArrayList<Reply_questVO> replyList = daoQ.read_quest_reply(vo.getBoardnum());
		model.addAttribute("VO", daoQ.boardRead(vo, temp2));
		model.addAttribute("replyList", replyList);
		return "community/read_question";
	}
	
	@RequestMapping(value = "community/write_quest_reply", method = RequestMethod.POST)
	public String write_quest_reply(Reply_questVO vo, HttpSession session, RedirectAttributes rttr, Model model) {
			boolean res = false;
			res = daoQ.write_quest_reply(vo, session);
			rttr.addAttribute("boardnum", vo.getBoardnum());
			rttr.addFlashAttribute("replyWriteRes", res);
		return "redirect:/community/read_question";
	}
	
	@RequestMapping(value = "community/delete_quest_reply", method = RequestMethod.GET)
	public String delete_quest_reply(int boardnum, Reply_questVO vo, HttpSession session, RedirectAttributes rttr) {
		boolean res = false;
		res = daoQ.delete_quest_reply(vo, session);
		rttr.addAttribute("boardnum", boardnum);
		rttr.addFlashAttribute("replyRes", res);
		return "redirect:/community/read_question";
	}
	
	@RequestMapping(value = "community/delete_question", method = RequestMethod.GET)
	public String delete_question(QuestionVO vo, HttpSession session, RedirectAttributes rttr) {
		boolean res = false;
		res = daoQ.delete_quest(vo, session);
		rttr.addFlashAttribute("deleteRes", res);
		return "redirect:/community/community_question";
	}
	
	@RequestMapping(value = "community/update_question", method = RequestMethod.GET)
	public String boardUpdateForm(QuestionVO vo, HttpSession session, Model model) {
		model.addAttribute("VO", daoQ.update_quest_read(vo, session));
		return "community/update_question";
	}
	
	@RequestMapping(value = "community/update_question_process", method = RequestMethod.POST)
	public String boardUpdate(QuestionVO vo, HttpSession session, RedirectAttributes rttr, MultipartFile uploadFile) {
		boolean res = false;
		res = daoQ.update_question(vo, session, uploadFile);
		rttr.addFlashAttribute("updateRes", res);
		rttr.addAttribute("boardnum", vo.getBoardnum());
		rttr.addAttribute("temp", true);
		return "redirect:/community/community_question";
		
	}
}
