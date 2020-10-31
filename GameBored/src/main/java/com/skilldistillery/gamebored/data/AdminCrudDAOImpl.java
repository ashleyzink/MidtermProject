package com.skilldistillery.gamebored.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.gamebored.entities.Boardgame;
import com.skilldistillery.gamebored.entities.User;

//may not need Repository
@Transactional
@Service
public class AdminCrudDAOImpl implements AdminCrudDAO {

	@PersistenceContext
	  private EntityManager em;

	//Verify user ROLE is ADMIN in .jsp with a for each (e.g. if user.role =admin
	//continue mapping. Else, error message.
	
	@Override
	public Boardgame adminFindById(Integer id) {
		return em.find(Boardgame.class, id);
		// TODO Auto-generated method stub
	
	}

	
	@Override
	public Boardgame adminUpdateById(Integer id, Boardgame boardgame) {
		Boardgame boardGameToUpdate = em.find(Boardgame.class, id);
		boardGameToUpdate.setId(boardgame.getId());
		boardGameToUpdate.setName(boardgame.getName());
		boardGameToUpdate.setDescription(boardgame.getDescription());
		boardGameToUpdate.setMinPlayers(boardgame.getMinPlayers());
		boardGameToUpdate.setMaxPlayers(boardgame.getMaxPlayers());
		boardGameToUpdate.setPlayTimeMinutes(boardgame.getPlayTimeMinutes());
		boardGameToUpdate.setCost(boardgame.getCost());
		boardGameToUpdate.setGenre(boardgame.getGenre());
		boardGameToUpdate.setPublisher(boardgame.getPublisher());
		boardGameToUpdate.setLogoUrl(boardgame.getLogoUrl());
		boardGameToUpdate.setBoxArtUrl(boardgame.getBoxArtUrl());
		em.flush();
		return boardGameToUpdate;
		// TODO Auto-generated method stub
		
	}
	



	
	@Override
	public Boardgame adminCreateBoardgame(Boardgame boardgame) {
		em.persist(boardgame);
		return boardgame;
		// TODO Auto-generated method stub
		
	}

	
	
	@Override
	public boolean adminDeleteBoardGame(Integer id) {
		Boardgame boardgame = em.find(Boardgame.class, id);
		em.remove(boardgame);
		boolean boardgameRemoved = !em.contains(boardgame);
		// TODO Auto-generated method stub
		return boardgameRemoved;
		
	}

	
	
	
}
