package com.skilldistillery.gamebored.entities;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

@Entity
@Table(name= "community_comment")
public class CommunityComment {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name= "comment_date")
	@CreationTimestamp
	private LocalDateTime commentDate;
	
	@Column(name= "comment_text")
	private String commentText;
	
	@ManyToOne
	@JoinColumn(name= "user_id")
	private User user; 
	
	//In reply to id
	
	public CommunityComment() {
		super();
	}
	
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public LocalDateTime getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(LocalDateTime commentDate) {
		this.commentDate = commentDate;
	}
	public String getCommentText() {
		return commentText;
	}
	public void setCommentText(String commentText) {
		this.commentText = commentText;
	}
	
	
	public User getUser() {
		return user;
	}



	public void setUser(User user) {
		this.user = user;
	}



	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("CommunityComment [id=");
		builder.append(id);
		builder.append(", commentDate=");
		builder.append(commentDate);
		builder.append(", commentText=");
		builder.append(commentText);
		builder.append("]");
		return builder.toString();
	}
}
