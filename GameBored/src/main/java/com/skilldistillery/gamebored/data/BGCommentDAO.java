package com.skilldistillery.gamebored.data;

import java.util.List;

import com.skilldistillery.gamebored.entities.BoardGameComment;
import com.skilldistillery.gamebored.entities.Boardgame;
import com.skilldistillery.gamebored.entities.User;

public interface BGCommentDAO {

	BoardGameComment findBGCommentById(int id);

	List<BoardGameComment> findBGCommentByBoardGame(String user);

	List<BoardGameComment> findBGCommentByUser(String user);

	BoardGameComment create(String comment, Boardgame game, User u);

	BoardGameComment update(int id, BoardGameComment comment);

	boolean destroy(int id);


	//List<BoardGameComment> findBGCommentByBoardGame(Boardgame boardGame);

}
