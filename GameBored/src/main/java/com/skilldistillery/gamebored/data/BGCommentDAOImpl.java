package com.skilldistillery.gamebored.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.gamebored.entities.BoardGameComment;

@Service
@Transactional
public class BGCommentDAOImpl implements BGCommentDAO{

	private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("GameBoredPU");
	
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public BoardGameComment findBGCommentById(int id) {
		return em.find(BoardGameComment.class, id);
	}
	@Override
	public List<BoardGameComment> findBGCommentByBoardGame(String boardGame) {
		List<BoardGameComment> comments = null;
		EntityManager em = emf.createEntityManager();
		String jpql="SELECT bg FROM BoardGameComment bg WHERE bg.boardgame=:bg";
		comments = em.createQuery(jpql, BoardGameComment.class).setParameter("bg", boardGame).getResultList();
		em.close();
		return comments;
	}
	@Override
	public List<BoardGameComment> findBGCommentByUser(String user) {
		List<BoardGameComment> comments = null;
		EntityManager em = emf.createEntityManager();
		String jpql="SELECT bg FROM BoardGameComment bg WHERE bg.user=:bg";
		comments = em.createQuery(jpql, BoardGameComment.class).setParameter("bg", user).getResultList();
		em.close();
		return comments;
	}
	
	@Override
	public BoardGameComment create(BoardGameComment comment) {

		em.persist(comment);

		em.flush();

		return comment;
	}

	@Override
	public BoardGameComment update(int id, BoardGameComment comment) {
		BoardGameComment dbComment = em.find(BoardGameComment.class, id);

		dbComment.setBoardgame(comment.getBoardgame());
		dbComment.setCommentDate(comment.getCommentDate());
		dbComment.setCommentText(comment.getCommentText());
		dbComment.setUser(comment.getUser());

		em.flush();

		return dbComment;
	}

	@Override
	public boolean destroy(int id) {

		BoardGameComment dbComment = em.find(BoardGameComment.class, id);
		em.getTransaction().begin();

		em.remove(dbComment);

		boolean commentDel = !em.contains(dbComment);

		em.flush();


		return commentDel;
	}

}
