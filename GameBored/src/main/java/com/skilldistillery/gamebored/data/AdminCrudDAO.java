package com.skilldistillery.gamebored.data;

import java.util.List;

import com.skilldistillery.gamebored.entities.Boardgame;
import com.skilldistillery.gamebored.entities.User;

public interface AdminCrudDAO {

	Boardgame adminFindById(Integer id);

	Boardgame adminUpdateById(Integer id, Boardgame boardgame);

	Boardgame adminCreateBoardgame(Boardgame boardgame);

	boolean adminDeleteBoardGame(Integer id);

	

}
