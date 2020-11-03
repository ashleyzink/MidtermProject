package com.skilldistillery.gamebored.data;

import java.util.List;

import com.skilldistillery.gamebored.entities.User;

public interface AuthenticationDAO {

	User create(User user);

	boolean isEmailUnique(String email);

	User getUserByEmail(String email);

	boolean isValidUser(User u);

	List<User> listAll();

	User findByEmail(String email);

	User update(int id, User user);

	boolean destroy(int id);

	//can be deleted if not used
	boolean isValidUser(String email, String password);


}
