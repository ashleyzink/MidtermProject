package com.skilldistillery.gamebored.data;

import java.util.List;

import com.skilldistillery.gamebored.entities.BoardGameComment;
import com.skilldistillery.gamebored.entities.Boardgame;

public interface BoardGameDAO {
	
Boardgame findById(int id);
	
	List<Boardgame> findAll();
	
	List<Boardgame> findGameByKeyword(String keyword);
	
	List<Boardgame> findGameByGenre(String name);
	
	List<Boardgame> findGameByCategory(String name);
	
	List<Boardgame> findGameByPublisher(String name);
	
	List<Boardgame> findGameByNumberOfPlayers(int numOfPlayers);
	
	Boardgame addGame(Boardgame boardGame);
	
	Boardgame updateGame(Boardgame boardGame);
	
	boolean deleteGame(int id);

	List<BoardGameComment> findAllCommentsForGame();

}
