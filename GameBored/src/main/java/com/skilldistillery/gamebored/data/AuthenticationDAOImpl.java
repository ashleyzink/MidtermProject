package com.skilldistillery.gamebored.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.gamebored.entities.Boardgame;
import com.skilldistillery.gamebored.entities.User;


@Transactional
@Service
public class AuthenticationDAOImpl implements AuthenticationDAO {

	@PersistenceContext
	private EntityManager em;
//for registration
	@Override
	public User create(User user) {
		System.out.println("***********" + user);
		if (isEmailUnique(user.getEmail())) {
			em.persist(user);
			em.flush();
			return user;
		}
		return null;

	}
//for login
	@Override
	public boolean isEmailUnique(String email) {
		String jpql = "Select u from User u where email = :userEmail";
		List<User> users =  em.createQuery(jpql, User.class).setParameter("userEmail", email).getResultList();
		return users.size()==0;
	}
// for login
	@Override
	public User getUserByEmail(String email) {
		String jpql = "Select u from User u where email = :userEmail";
		List<User> user =  em.createQuery(jpql, User.class).setParameter("userEmail", email).getResultList();
		return user.size()!=0?user.get(0):null;
	}
// for login
//	@Override
//	public boolean isValidUser(User u) {
//		if (getUserByEmail(u.getEmail()) == null) {
//			return false;
//		}
//		boolean validUser = em.contains(u);
//		return validUser;
//	}
	@Override
	public boolean isValidUser(String email, String password) {
		if (getUserByEmail(email) == null) {
			return false;
		}
		boolean validUser = false;
		User user = null;
		String jpql = "Select u from User u where email = :userEmail";
		user =  em.createQuery(jpql, User.class).setParameter("userEmail", email).getSingleResult();
		if (user.getPassword().equals(password)) {
			validUser = true;
		}
		
		return validUser;
	}
	
	//List all Users
	@Override
	public List<User> listAll() {
		List <User> userList= null;
		String jpql = "Select u from User u";
		userList=  em.createQuery(jpql, User.class).getResultList();
		return userList;
		}
	
	//update user information
	@Override
	public User update(int id, User user) {
		User u = em.find(User.class, id);

		u.setAddress(user.getAddress());
		u.setBioDescription(user.getBioDescription());
		u.setBoardGameComments(user.getBoardGameComments());
		u.setCommunityComments(user.getCommunityComments());
		u.setEmail(user.getEmail());
		u.setFirstName(user.getFirstName());
		u.setLastName(user.getLastName());
		u.setCreateDate(user.getCreateDate());
		u.setEnabled(user.getEnabled());
		u.setId(user.getId());
		u.setMeetups(user.getMeetups());
		u.setOwned(user.getOwned());
		u.setPassword(user.getPassword());
		u.setProfileImageUrl(u.getProfileImageUrl());
		u.setRole(u.getRole());
		u.setUsername(u.getUsername());

		em.flush();

		return u;
	}
	
	public User addFavorite(int userId, int gameId) {
		User u = em.find(User.class, userId);
		Boardgame bg=em.find(Boardgame.class, gameId);
		
		u.getFavorites().add(bg);
		em.flush();
		
		return u;
	}
	
	public User removeFavorite(int userId, int gameId) {
		User u = em.find(User.class, userId);
		Boardgame bg=em.find(Boardgame.class, gameId);
		
		u.getFavorites().remove(bg);
		em.flush();
		
		return u;
	}
	public User addOwned(int userId, int ownedId) {
		User u = em.find(User.class, userId);
		Boardgame bg=em.find(Boardgame.class, ownedId);
		
		u.getOwned().add(bg);
		em.flush();
		
		return u;
	}
	public User removeOwned(int userId, int gameId) {
		User u = em.find(User.class, userId);
		Boardgame bg=em.find(Boardgame.class, gameId);
		
		u.getOwned().remove(bg);
		em.flush();
		
		return u;
	}
	//delete a user
	@Override
	public boolean destroy(int id) {

		User user = em.find(User.class, id);
		em.remove(user);

		boolean userDel = !em.contains(user);

		em.flush();

		return userDel;
	}

	
	//Find User by email
	@Override
	public User findByEmail(String email) {
		String jpql = "Select u from User u where email = :userEmail";
		User user =  em.createQuery(jpql, User.class).setParameter("userEmail", email).getSingleResult();
		return user;
		// TODO Auto-generated method stub
	
	}
	@Override
	public boolean isValidUser(User u) {
		// TODO Auto-generated method stub
		return false;
	}
	
	
	
	
}
