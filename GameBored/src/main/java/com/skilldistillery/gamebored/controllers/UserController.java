package com.skilldistillery.gamebored.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.cache.spi.support.AbstractCachedDomainDataAccess;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.gamebored.data.AuthenticationDAO;
import com.skilldistillery.gamebored.data.BGCommentDAO;
import com.skilldistillery.gamebored.data.BoardGameDAO;
import com.skilldistillery.gamebored.data.CCommentDAO;
import com.skilldistillery.gamebored.entities.BoardGameComment;
import com.skilldistillery.gamebored.entities.Boardgame;
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
	@Autowired
	private BoardGameDAO boardgameDao;

//	@RequestMapping("addFavorite.do")
//	public 
	
	@RequestMapping("addUser.do")
	public String addUser(User user, Model model) {
		User u = aDao.create(user);
		model.addAttribute("comment", u);
		return "homepage";
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
		return "update";
	}
	//Leaving in case we'd like to add a search by email on the frontend
//	@RequestMapping("searchUser.do")
//	public String searchUser(String keyword, Model model) {
//		User userList=aDao.findByEmail(keyword);
//		model.addAttribute("user", userList);
//		return "result";
//	}
	
	@RequestMapping(path="getUsers.do", method=RequestMethod.GET)
	public ModelAndView getUsers() {
		ModelAndView mv = new ModelAndView();
		List<User> users = aDao.getListOfUsers();
		mv.addObject("users", users);
		mv.setViewName("listofusers");
		return mv;
	}
	
	@RequestMapping(path="getUserById.do", method=RequestMethod.GET)
	public ModelAndView getUserById(int id) {
		ModelAndView mv = new ModelAndView();
		User user = aDao.findById(id);
		mv.addObject("user", user);
		mv.setViewName("searcheduserprofilepage");
		return mv;
		
	}
	

	@RequestMapping(path="addBoardGameComment.do", method = RequestMethod.POST)
	public String addBoardgameComment(HttpSession session, String commentText, Model model, int id, RedirectAttributes redir) {
		User u = (User)(session.getAttribute("loggedInUser"));

		Boardgame game = boardgameDao.findById(id);
		BoardGameComment cc = bgDao.create(commentText, game, u);
		redir.addFlashAttribute("game", game);
		return "redirect:getGame.do?id=" + game.getId();	
	}
	
	
	
	@RequestMapping("deleteBoardGameComment.do")
	public String deleteBoardgameComment(Integer id, Model model) {
		boolean delComment = bgDao.destroy(id);
		model.addAttribute("deleted", delComment);
		return "deletedComment";
	}
	
	@RequestMapping("updateBoardGameComment.do")
	public String editBoardgameComment(Integer id, BoardGameComment comment, Model model) {
		BoardGameComment cc = bgDao.update(id, comment);
		model.addAttribute("update", cc);
		return "update";
	}
	@RequestMapping("addCommunityComment.do")
	public String addCommunityComment(HttpSession session, CommunityComment comment) {
		//add model model
		comment.setUser((User)session.getAttribute("loggedInUser"));
		CommunityComment cc = cDao.create(comment);
//		List<CommunityComment> comments =cDao.listAllCommunityComments();
//		model.addAttribute("commentsList", comments);
		return "redirect:homepage.do";
	}
	
	@RequestMapping("deleteCommunityComment.do")
	public String deleteCommunityComment(Integer id, Model model) {
		boolean delComment = cDao.destroy(id);
		model.addAttribute("deleted", delComment);
		return "deletedComment";
	}
	
	@RequestMapping("updateCommunityComment.do")
	public String editCommunityComment(Integer id, CommunityComment comment, Model model) {
		CommunityComment cc = cDao.update(id, comment);
		model.addAttribute("update", cc);
		return "update";
	}
	@RequestMapping("addToFavs.do")
	public String addGameToFavs(int userId, int gameId, HttpSession session) {
       
		aDao.addFavorite(userId, gameId);
		Boardgame game = boardgameDao.findById(gameId);
		User u = (User)(session.getAttribute("loggedInUser"));
		u.getFavorites().add(game);
		return "redirect:getGame.do?id=" + gameId;
		
	}
	@RequestMapping("removeFromFavs.do")
	public String removeFromFavs(int userId, int gameId, HttpSession session) {
		
		aDao.removeFavorite(userId, gameId);
		Boardgame game = boardgameDao.findById(gameId);
		User u = (User)(session.getAttribute("loggedInUser"));
		u.getFavorites().remove(game);
		return "redirect:getGame.do?id=" + gameId;
		
	}
	@RequestMapping("addToOwned.do")
	public String addGameToOwned(int userId, int gameId, HttpSession session) {

		aDao.addOwned(userId, gameId);
		Boardgame game = boardgameDao.findById(gameId);
		User u = (User)(session.getAttribute("loggedInUser"));
		u.getOwned().add(game);
		return "redirect:getGame.do?id=" + gameId;
	
		
	}
	@RequestMapping("removeFromOwned.do")
	public String removeFromOwned(int userId, int gameId, HttpSession session) {
		
		aDao.removeOwned(userId, gameId);
		Boardgame game = boardgameDao.findById(gameId);
		User u = (User)(session.getAttribute("loggedInUser"));
		u.getOwned().remove(game);
		return "redirect:getGame.do?id=" + gameId;
		
		
	}
	
}