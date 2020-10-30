package com.skilldistillery.gamebored.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class BoardgameTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Boardgame boardgame;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("GameBoredPU");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		boardgame = em.find(Boardgame.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		boardgame = null;
	}
	
	@Test
	@DisplayName("testing board_game mapping")
	void test2() {
		assertNotNull(boardgame);
		assertEquals("Play 12 seasons", boardgame.getDescription());
		assertEquals("Seasons", boardgame.getName());
	}
	
	
	@Test
	@DisplayName("testing board_game to genre mapping")
	void test3() {
		assertNotNull(boardgame);
		assertNotNull(boardgame.getGenre());
		assertEquals("Fantasy", boardgame.getGenre().getName());
	}
	
	@Test
	@DisplayName("testing board_game to publisher mapping")
	void test4() {
		assertNotNull(boardgame);
		assertNotNull(boardgame.getPublisher());
		assertEquals("Libellud", boardgame.getPublisher().getName());
	}
	
	@Test
	@DisplayName("testing board_game to category mapping")
	void test5() {
		assertNotNull(boardgame);
		assertNotNull(boardgame.getPublisher());
		assertEquals("Deck Builder", boardgame.getCategory().getName());
	}
	
	@Test
	@DisplayName("testing board_game to board_game_comment mapping")
	void test6() {
		assertNotNull(boardgame);
		assertNotNull(boardgame.getBoardGameComments());
		assertTrue(boardgame.getBoardGameComments().size()>0);
		assertEquals(1, boardgame.getBoardGameComments().size());
	}

}
