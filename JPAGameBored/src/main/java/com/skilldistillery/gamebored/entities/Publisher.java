package com.skilldistillery.gamebored.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Publisher {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	@Column(name="logo_url")
	private String logoUrl;
	
	private String description;
	
	@OneToMany(mappedBy="publisher")
	private List<Boardgame> boardGames;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLogoUrl() {
		return logoUrl;
	}

	public void setLogoUrl(String logoUrl) {
		this.logoUrl = logoUrl;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	

	public List<Boardgame> getBoardGames() {
		return boardGames;
	}

	public void setBoardGames(List<Boardgame> boardGames) {
		this.boardGames = boardGames;
	}
	
	public void addBoardgame(Boardgame game) {
		if(boardGames == null) boardGames = new ArrayList<Boardgame>();
		
		if(!boardGames.contains(game)) {
			boardGames.add(game);
			if(game.getPublisher() != null) {
				game.getPublisher().getBoardGames().remove(game);
			}
			game.setPublisher(this);
		}
	}

	public void removeBoardgame(Boardgame game) {
		game.setPublisher(null);
		if(boardGames != null) {
			boardGames.remove(game);
		}
	}

	
	@Override
	public String toString() {
		return "Publisher [id=" + id + ", name=" + name + ", logoUrl=" + logoUrl + ", description=" + description + "]";
	}

	public Publisher() {
		super();
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
		Publisher other = (Publisher) obj;
		if (id != other.id)
			return false;
		return true;
	}
	
	

}
