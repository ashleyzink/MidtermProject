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

class MeetupTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Meetup meetup;

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
		meetup = em.find(Meetup.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		meetup = null;
	}

	@Test
	void test_Meetup_entity_mapping() {
		assertNotNull(meetup);
		assertEquals(1, meetup.getId());
		assertEquals("Games at the Park", meetup.getTitle());
		assertEquals("Play games at the park", meetup.getDescription());
//		assertEquals("2020-10-10", meetup.getMeetupDate());
		assertEquals(12, meetup.getStartTime().getHour());
		assertEquals(00, meetup.getStartTime().getMinute());
		assertEquals(00, meetup.getStartTime().getSecond());
		
		assertEquals(2020, meetup.getCreateDate().getYear());
		assertEquals(10, meetup.getCreateDate().getMonthValue());
		assertEquals(10, meetup.getCreateDate().getDayOfMonth());
		assertEquals(9, meetup.getCreateDate().getHour());
		assertEquals(10, meetup.getCreateDate().getMinute());
		assertEquals(10, meetup.getCreateDate().getSecond());
	
	}
	

	
	
	

}
