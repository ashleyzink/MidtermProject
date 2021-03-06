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

class PublisherTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Publisher publisher;

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
		publisher = em.find(Publisher.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		publisher = null;
	}

	@Test
	void test_Publisher_entity_mapping() {
		assertNotNull(publisher);
		assertEquals("Libellud", publisher.getName());
	}
	
	@Test
	void test_Publisher_to_BoardGame_entity_mapping() {
		assertNotNull(publisher);
		assertNotNull(publisher.getBoardGames());
		assertNotNull(publisher.getBoardGames().size() >0);
		assertEquals(1, publisher.getBoardGames().size());
		
	}

}
