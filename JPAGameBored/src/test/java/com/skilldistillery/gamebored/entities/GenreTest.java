package com.skilldistillery.gamebored.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class GenreTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Genre genre;

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
		genre = em.find(Genre.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		genre = null;
	}

	@Test
	void test_Genre_entity_mapping() {
		assertNotNull(genre);
		assertEquals("Fantasy", genre.getName());
		assertEquals("Takes place in a world of magic", genre.getDescription());
	}
	
	@Test
	void test_Genre_to_BoardGame_entity_mapping() {
		assertNotNull(genre);
		assertNotNull(genre.getBoardGames());
		assertNotNull(genre.getBoardGames().size() >0);
		assertEquals(1, genre.getBoardGames().size());
		
	}
	

	
}
