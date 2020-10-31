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
import org.junit.jupiter.api.Test;

class UserTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private User user;

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
		user = em.find(User.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		user = null;
	}

	@Test
	void test_User_entity_mapping() {
		assertNotNull(user);
		assertEquals(1, user.getId());
		assertEquals("admin", user.getUsername());
		assertEquals("admin", user.getPassword());
		assertEquals(1, user.getEnabled());
		assertEquals("ADMIN", user.getRole());
		assertEquals("Game", user.getFirstName());
		assertEquals("Bored", user.getLastName());
		assertEquals("adminuser@gamebored.com", user.getEmail());
		assertEquals(null, user.getProfileImageUrl());
		assertEquals(null, user.getBioDescription());
		assertEquals(null, user.getCreateDate());
		
	}
	
	@Test
	void test_User_to_Board_Game_Comment_entity_mapping() {
		assertNotNull(user);
		assertNotNull(user.getBoardGameComments());
		assertTrue(user.getBoardGameComments().size() > 0);
		assertEquals(1, user.getBoardGameComments().size());
	
	}
	
	@Test
	void test_User_to_Community_Comment_entity_mapping() {
		assertNotNull(user);
		assertNotNull(user.getCommunityComment());
		assertTrue(user.getCommunityComment().size() > 0);
		assertEquals(1, user.getCommunityComment().size());
		
	}
	
	@Test
	void test_User_to_meetup_entity_mapping() {
		assertNotNull(user);
		assertNotNull(user.getMeetups().size());
		assertTrue(user.getMeetups().size() > 0);
		assertEquals(1, user.getMeetups().size());
		
	}
	
	@Test
	void test_User_to_Address_entity_mapping() {
		assertNotNull(user);
		assertNotNull(user.getAddress());
		assertEquals("123 Sesame St", user.getAddress().getStreet());
		
	}
	

	
	
	

}
