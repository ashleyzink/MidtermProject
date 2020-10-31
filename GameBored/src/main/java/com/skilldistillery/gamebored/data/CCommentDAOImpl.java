package com.skilldistillery.gamebored.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.gamebored.entities.CommunityComment;

@Service
@Transactional
public class CCommentDAOImpl implements CCommentDAO {

		@PersistenceContext
		private EntityManager em;

		@Override
		public CommunityComment findCCommentById(int id) {
			return em.find(CommunityComment.class, id);
		}


		@Override
		public List<CommunityComment> findCCommentByUser(String user) {
			List<CommunityComment> comments = null;
			String jpql = "SELECT cc FROM CommunityComment cc WHERE cc.user=:cc";
			comments = em.createQuery(jpql, CommunityComment.class).setParameter("cc", user).getResultList();
			return comments;
		}

		@Override
		public CommunityComment create(CommunityComment comment) {

			em.persist(comment);

			em.flush();

			return comment;
		}

		@Override
		public CommunityComment update(int id, CommunityComment comment) {
			CommunityComment dbComment = em.find(CommunityComment.class, id);

			dbComment.setCommentDate(comment.getCommentDate());
			dbComment.setCommentText(comment.getCommentText());
			dbComment.setUser(comment.getUser());

			em.flush();

			return dbComment;
		}

		@Override
		public boolean destroy(int id) {

			CommunityComment dbComment = em.find(CommunityComment.class, id);

			em.remove(dbComment);

			boolean commentDel = !em.contains(dbComment);

			em.flush();

			return commentDel;
		}
	}

