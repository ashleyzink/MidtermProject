package com.skilldistillery.gamebored.data;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.skilldistillery.gamebored.entities.User;

//may not need Repository
@Repository
@Transactional
@Service
public class AuthenticationDAOImpl implements AuthenticationDAO {
	private Map<String, User> users = new HashMap<>();

	@PersistenceContext
	private EntityManager em;

	public AuthenticationDAOImpl() {
		// NEED TO ADD SPECIFIC CONSTRUCTOR TO USER ENTITY
		
//		this.users.put("adminuser@gamebored.com", new User(1, "admin", "password", 1, "Game",
//				"Bored", "adminuser@gamebored.com", Address());
		
//		this.users.put("adminuser@gamebored.com", new User(1, "admin", "admin", 1, "ADMIN",
//				"Game", "Bored", "adminuser@gamebored.com", 1, null, null, null));
	}

	@Override
	public User create(User user) {
		if (isEmailUnique(user.getEmail())) {
			em.persist(user);
			em.flush();
			return user;
		}
		return null;

	}

	@Override
	public boolean isEmailUnique(String email) {
		// TODO: Check to see if the provided email exists as a key in the users HashMap
		return !users.containsKey(email);
	}

	@Override
	public User getUserByEmail(String email) {
		if (users.containsKey(email)) {
			return users.get(email);
		}
		return null;
	}

	@Override
	public boolean isValidUser(User u) {
		if (getUserByEmail(u.getEmail()) == null) {
			return false;
		}
		if (users.get(u.getEmail()).getPassword().equals(u.getPassword())) {
			return true;
		}
		return false;
	}
	
	//List all Users
	@Override
	public List<User> listAll() {
		List <User> userList= null;
		String jpql = "Select u from User u";
		userList=  em.createQuery(jpql, User.class).getResultList();
		return userList;
		}
	
	//Find User by email

	@Override
	public User findByEmail(String email) {
		String jpql = "Select u from User u where email = :userEmail";
		User user =  em.createQuery(jpql, User.class).setParameter("userEmail", email).getSingleResult();
		return user;
		// TODO Auto-generated method stub
	
	}
	
	
	
	
}
