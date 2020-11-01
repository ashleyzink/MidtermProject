package com.skilldistillery.gamebored.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.gamebored.data.AuthenticationDAO;
import com.skilldistillery.gamebored.data.BGCommentDAO;
import com.skilldistillery.gamebored.data.CCommentDAO;
import com.skilldistillery.gamebored.entities.BoardGameComment;
import com.skilldistillery.gamebored.entities.CommunityComment;
import com.skilldistillery.gamebored.entities.User;

@Controller
public class UserController {

	@Autowired
	private AuthenticationDAO aDao;

	@Autowired
	private BGCommentDAO bgDao;

	@Autowired
	private CCommentDAO cDao;

	@RequestMapping("addUser.do")
	public String addUser(User user, Model model) {
		User u = aDao.create(user);
		model.addAttribute("comment", u);
		return "homepage.jsp";
	}

	@RequestMapping("deleteUser.do")
	public String deleteUser(Integer id, Model model) {
		boolean delUser = aDao.destroy(id);
		model.addAttribute("deleted", delUser);
		return "deletedComment";
	}

	@RequestMapping("updateUser.do")
	public String editUSer(Integer id, User user, Model model) {
		User u = aDao.update(id, user);
		model.addAttribute("update", u);
		return "update.jsp";
	}
	
	@RequestMapping("addCommunityComment.do")
	public String addBoardgameComment(BoardGameComment comment, Model model) {
		BoardGameComment cc = bgDao.create(comment);
		model.addAttribute("comment", cc);
		return "homepage.jsp";
	}
	
	@RequestMapping("deleteCommunityComment.do")
	public String deleteBoardgameComment(Integer id, Model model) {
		boolean delComment = bgDao.destroy(id);
		model.addAttribute("deleted", delComment);
		return "deletedComment";
	}
	
	@RequestMapping("updateCommunityComment.do")
	public String editBoardgameComment(Integer id, BoardGameComment comment, Model model) {
		BoardGameComment cc = bgDao.update(id, comment);
		model.addAttribute("update", cc);
		return "update.jsp";
	}
	@RequestMapping("addCommunityComment.do")
	public String addCommunityComment(CommunityComment comment, Model model) {
		CommunityComment cc = cDao.create(comment);
		model.addAttribute("comment", cc);
		return "homepage.jsp";
	}
	
	@RequestMapping("deleteCommunityComment.do")
	public String deleteCommentComment(Integer id, Model model) {
		boolean delComment = cDao.destroy(id);
		model.addAttribute("deleted", delComment);
		return "deletedComment";
	}
	
	@RequestMapping("updateCommunityComment.do")
	public String editCommunityComment(Integer id, CommunityComment comment, Model model) {
		CommunityComment cc = cDao.update(id, comment);
		model.addAttribute("update", cc);
		return "update.jsp";
	}
	
}