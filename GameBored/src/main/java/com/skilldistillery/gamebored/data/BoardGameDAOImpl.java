package com.skilldistillery.gamebored.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.gamebored.entities.Boardgame;
import com.skilldistillery.gamebored.entities.Category;
import com.skilldistillery.gamebored.entities.Genre;

@Transactional
@Service
public class BoardGameDAOImpl implements BoardGameDAO {
	
	@PersistenceContext
	private EntityManager  em;

	@Override
	public Boardgame findById(int id) {
		return em.find(Boardgame.class, id);
	}

	@Override
	public List<Boardgame> findAll() {
		String jpql = "SELECT game FROM Boardgame game";
		return em.createQuery(jpql, Boardgame.class).getResultList();
	}

	@Override
	public List<Boardgame> findGameByKeyword(String keyword) {
		List<Boardgame> boardGameListByKeyword = null;
		String jpql = "SELECT b FROM Boardgame b WHERE b.name LIKE :name OR b.description LIKE :description";
		
		boardGameListByKeyword = em.createQuery(jpql, Boardgame.class)
								   .setParameter("name", "%" + keyword + "%")
								   .setParameter("description", "%" + keyword + "%")
								   .getResultList();
		
		return boardGameListByKeyword;
	}

	@Override
	public List<Boardgame> findGameByGenre(String name) {
		List<Boardgame> boardGameListByGenre = null;
		String jpql = "SELECT g FROM Genre g WHERE name LIKE :name";
		
		boardGameListByGenre = em.createQuery(jpql, Genre.class)
				 				.setParameter("name", "%" + name + "%")
				 				.getSingleResult().getBoardGames();
		 
		return boardGameListByGenre;
	}

	@Override
	public List<Boardgame> findGameByCategory(String name) {
		List<Boardgame> boardGameListByCategory = null;
		String jpql = "SELECT c FROM Category c WHERE name LIKE :name";
		
		boardGameListByCategory = em.createQuery(jpql, Category.class)
				 				.setParameter("name", "%" + name + "%")
				 				.getSingleResult().getBoardGames();
		return boardGameListByCategory;
	}

	@Override
	public List<Boardgame> findGameByPublisher(String name) {
		List<Boardgame> boardGameListByPublisher = null;
		String jpql = "SELECT p FROM Publisher p WHERE name LIKE :name";
		
		boardGameListByPublisher = em.createQuery(jpql, Category.class)
				 				.setParameter("name", "%" + name + "%")
				 				.getSingleResult().getBoardGames();
		return boardGameListByPublisher;
	}
	
	@Override
	public List<Boardgame> findGameByNumberOfPlayers(int numOfPlayers) {
		List<Boardgame> boardGameListByNumberOfPlayers = null;
		String jpql = "SELECT b FROM Boardgame b WHERE b.minPlayer <= :minPlayers AND b.maxPlayers >= :maxPlayers";
		
		boardGameListByNumberOfPlayers = em.createQuery(jpql, Boardgame.class)
								   .setParameter("minPlayers", numOfPlayers)
								   .setParameter("maxPlayers", numOfPlayers)
								   .getResultList();
		
		return boardGameListByNumberOfPlayers;
	}


	@Override
	public Boardgame addGame(Boardgame boardGame) {
		em.persist(boardGame);
		em.flush();
		return boardGame;
	}

	@Override
	public Boardgame updateGame(Boardgame boardGame) {
		Boardgame updateGame = em.find(Boardgame.class, boardGame.getId());
		updateGame.setName(boardGame.getName());
		updateGame.setDescription(boardGame.getDescription());
		updateGame.setMinPlayers(boardGame.getMinPlayers());
		updateGame.setMaxPlayers(boardGame.getMaxPlayers());
		updateGame.setPlayTimeMinutes(boardGame.getPlayTimeMinutes());
		updateGame.setCost(boardGame.getCost());
		updateGame.setCategory(boardGame.getCategory());
		updateGame.setGenre(boardGame.getGenre());
		updateGame.setPublisher(boardGame.getPublisher());
		updateGame.setLogoUrl(boardGame.getLogoUrl());
		updateGame.setBoxArtUrl(boardGame.getBoxArtUrl());
		em.flush();
		return updateGame;
	}

	@Override
	public boolean deleteGame(int id) {
		Boardgame deleteGame = em.find(Boardgame.class, id);
		em.remove(deleteGame);
		boolean gameDeleted = ! em.contains(deleteGame);
		em.flush();
		return gameDeleted;
	}

	
}
