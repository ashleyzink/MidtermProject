package com.skilldistillery.gamebored.entities;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity
public class Meetup {

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	
	private String title;
	
	private String description;
	
	@OneToOne
	@JoinColumn(name = "address_id")
	private Address address;
	
	@OneToOne
	@JoinColumn(name = "board_game_id")
	private Boardgame boardGame;
	
	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;
	
	//private BoardGame boardGameId;
	@Column (name ="meetup_date")
	private LocalDate meetupDate;
	
	@Column (name ="start_time")
	private LocalTime startTime;
	
	// private User userId;
	
	@Column (name ="create_date")
	private LocalDateTime createDate;

	public Meetup() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public LocalDate getMeetupDate() {
		return meetupDate;
	}

	public void setMeetupDate(LocalDate meetupDate) {
		this.meetupDate = meetupDate;
	}

	public LocalTime getStartTime() {
		return startTime;
	}

	public void setStartTime(LocalTime startTime) {
		this.startTime = startTime;
	}

	public LocalDateTime getCreateDate() {
		return createDate;
	}

	public void setCreateDate(LocalDateTime createDate) {
		this.createDate = createDate;
	}
	
	


	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public Boardgame getBoardGame() {
		return boardGame;
	}

	public void setBoardGame(Boardgame boardGame) {
		this.boardGame = boardGame;
	}

	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "Meetup [id=" + id + ", title=" + title + ", description=" + description + ", meetupDate=" + meetupDate
				+ ", startTime=" + startTime + ", createDate=" + createDate + "]";
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
		Meetup other = (Meetup) obj;
		if (id != other.id)
			return false;
		return true;
	}

	
	
	
	
}
