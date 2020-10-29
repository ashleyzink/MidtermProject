package com.skilldistillery.gamebored.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.gamebored.entities.User;

@Service
@Transactional
public class TestDAOJPAImpl implements TestDao {

	
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public User getTestUser() {
		// TODO Auto-generated method stub
		return em.find(User.class, 1);
	}

}
