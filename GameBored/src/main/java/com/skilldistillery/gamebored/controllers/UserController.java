package com.skilldistillery.gamebored.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.gamebored.data.AuthenticationDAO;
import com.skilldistillery.gamebored.data.BGCommentDAO;
import com.skilldistillery.gamebored.data.CCommentDAO;
import com.skilldistillery.gamebored.entities.CommunityComment;

@Controller
public class UserController {

	@Autowired
	private AuthenticationDAO aDao;

	@Autowired
	private BGCommentDAO bgDao;

	@Autowired
	private CCommentDAO cDao;

	@RequestMapping("addComment.do")
	public String addCommunityComment(CommunityComment comment, Model model) {
		CommunityComment cc = cDao.create(comment);
		model.addAttribute("comment", cc);
		return "homepage.jsp";
	}

	@RequestMapping("deleteComment.do")
	public String deleteCommentComment(Integer id, Model model) {
		boolean delComment = cDao.destroy(id);
		model.addAttribute("deleted", delComment);
		return "deletedComment";
	}

	@RequestMapping("updateComment.do")
	public String editCommunityComment(Integer id, CommunityComment comment, Model model) {
		CommunityComment cc = cDao.update(id, comment);
		model.addAttribute("update", cc);
		return "update.jsp";

	}
}