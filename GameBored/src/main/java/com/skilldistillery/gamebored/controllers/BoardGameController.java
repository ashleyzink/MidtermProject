package com.skilldistillery.gamebored.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.gamebored.data.BoardGameDAO;
import com.skilldistillery.gamebored.entities.Boardgame;

@Controller
public class BoardGameController {
	
	@Autowired
	private BoardGameDAO boardGameDAO;
	
	@RequestMapping(path="index.do", method = RequestMethod.GET)
	public String backHome() {
		return "/WEB-INF/index.jsp";
	}

	@RequestMapping(path="getGame.do", method = RequestMethod.GET)
	public String showGameByID(Integer id, Model model) {
		Boardgame game = boardGameDAO.findById(id);
		model.addAttribute("game", game);
		return "/WEB-INF/SingleGameDetailDisplay.jsp";
	}
	
	@RequestMapping(path="gameList.do", method = RequestMethod.GET)
	public String listOfAllGames(Model model) {
		List<Boardgame> gameList = boardGameDAO.findAll();
		model.addAttribute("games", gameList);
		return "/WEB-INF/boardgame/ListOfGames.jsp";
	}
	
	@RequestMapping(path="gameList.do", method = RequestMethod.GET)
	public String getGamesByKeyword(String searchTerm, String searchType, Model model) {
		List<Boardgame> gameList;
		switch (searchType) {
		case "genre" :
			gameList = boardGameDAO.findGameByGenre(searchTerm);
			break;
		case "category" :
			gameList = boardGameDAO.findGameByCategory(searchTerm);
			break;
		case "publisher" :
			gameList = boardGameDAO.findGameByPublisher(searchTerm);
			break;
		case "numPlayers" :
			try {
				int numOfPlayers = Integer.parseInt(searchTerm);
				gameList = boardGameDAO.findGameByNumberOfPlayers(numOfPlayers);
			} catch (NumberFormatException e) {
				gameList = new ArrayList<>();
				System.err.println("Invalid number format with search term number of players: " + searchTerm);
			}
			break;
		case "keyword" :
			default:
			gameList = boardGameDAO.findGameByKeyword(searchTerm);
			break;
			
		}
		model.addAttribute("games", gameList);
		return "/WEB-INF/ListOfGames.jsp";
	}
	

	
	@RequestMapping(path = "addGame.do", method = RequestMethod.POST)
	public String addGame(Boardgame boardgame, Model model, RedirectAttributes redir) {
		Boardgame bgame = boardGameDAO.addGame(boardgame);
		redir.addFlashAttribute("game", bgame);
		return "redirect:gameAdded.do";
	}
	@RequestMapping(path = "gameAdded.do", method = RequestMethod.GET)
	public String addGameRedir() {
		return "/WEB-INF/GameDetailDisplay.jsp";
	}
	
	@RequestMapping(path = "newGameForm.do", method = RequestMethod.GET)
	public String redirToNewGameForm() {
		return "/WEB-INF/NewGame.jsp";
	}
	
	@RequestMapping(path = "updateGame.do", method = RequestMethod.POST )
	public String updateGame(Boardgame bgame, Model model) {
		Boardgame updateGame = boardGameDAO.updateGame(bgame);
		model.addAttribute("game", updateGame);
		return "/WEB-INF/GameDetailDisplay.jsp";
	}
	
	@RequestMapping(path = "redirToUpdate.do", method = RequestMethod.GET)
	public String redirToUpdate(Integer id, Model model) {
		model.addAttribute("game", boardGameDAO.findById(id));
		return "/WEB-INF/UpdateGame.jsp";
	}
	
	@RequestMapping(path = "deleteGame.do", method = RequestMethod.POST)
	public String deleteGame(Integer id, RedirectAttributes redir) {
		boardGameDAO.deleteGame(id);
		return("redirect:gameDeleted.do");
	}
	
	@RequestMapping(path = "gameDeleted.do", method = RequestMethod.GET)
	public String deleted() {
		return "/WEB-INF/Deleted.jsp";
	}
}
