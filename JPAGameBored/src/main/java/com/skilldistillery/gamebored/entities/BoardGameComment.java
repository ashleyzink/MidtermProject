package com.skilldistillery.gamebored.entities;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="board_game_comment")
public class BoardGameComment {

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name ="comment_date")
	private LocalDateTime commentDate;
	
	@Column(name ="comment_text")
	private String commentText;
	

	public BoardGameComment() {
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
		return "BoardGameComment [id=" + id + ", commentDate=" + commentDate + ", commentText=" + commentText + "]";
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		return result;
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		BoardGameComment other = (BoardGameComment) obj;
		if (id != other.id)
			return false;
		return true;
	}

	
	
	
}
