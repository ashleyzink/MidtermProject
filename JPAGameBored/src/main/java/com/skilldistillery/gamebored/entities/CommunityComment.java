package com.skilldistillery.gamebored.entities;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name= "community_comment")
public class CommunityComment {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name= "comment_date")
	private LocalDateTime commentDate;
	@Column(name= "comment_text")
	private String commentText;
	
	
	
	
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
