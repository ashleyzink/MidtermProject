package com.skilldistillery.gamebored.data;

import java.util.List;

import com.skilldistillery.gamebored.entities.CommunityComment;

public interface CCommentDAO {

	CommunityComment findCCommentById(int id);

	List<CommunityComment> findCCommentByUser(String user);

	CommunityComment create(CommunityComment comment);

	CommunityComment update(int id, CommunityComment comment);

	boolean destroy(int id);

}
