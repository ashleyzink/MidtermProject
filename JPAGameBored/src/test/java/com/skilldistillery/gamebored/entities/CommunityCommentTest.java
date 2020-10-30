package com.skilldistillery.gamebored.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class CommunityCommentTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private CommunityComment comment;

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
		comment = em.find(CommunityComment.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		comment = null;
	}
	
	@Test
	@DisplayName("testing board_game mapping")
	void test2() {
		assertNotNull(comment);
		
		assertEquals("I love board games!!", comment.getCommentText());

	}
	
	@Test
	@DisplayName("testing board_game to community_comment mapping")
	void test3() {
		assertNotNull(comment);
		assertEquals("Game", comment.getUser().getFirstName());
		
	}

}
