package com.skilldistillery.gamebored.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class BoardGameCommentTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private BoardGameComment boardGameComment;

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
		boardGameComment = em.find(BoardGameComment.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		boardGameComment = null;
	}

	@Test
	void test_BoardGameComment_entity_mapping() {
		assertNotNull(boardGameComment);
		assertEquals(1, boardGameComment.getId());
//		assertEquals("2020-10-30 12:30:16", boardGameComment.getCommentDate());
		assertEquals("This game is good with some houserules", boardGameComment.getCommentText());
		
	}
	
	@Test
	void test_BoardGameComment_to_User_entity_mapping() {
		assertNotNull(boardGameComment);
		assertNotNull(boardGameComment.getUser());
		assertEquals("Game", boardGameComment.getUser().getFirstName());
		
	}
	
	@Test
	void test_BoardGameComment_to_Boardgame_entity_mapping() {
		assertNotNull(boardGameComment);
		assertNotNull(boardGameComment.getBoardgame());
		assertEquals("Seasons", boardGameComment.getBoardgame().getName());
		
	}
	

	
	
	

}
