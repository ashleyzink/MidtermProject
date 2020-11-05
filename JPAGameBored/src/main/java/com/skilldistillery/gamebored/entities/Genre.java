package com.skilldistillery.gamebored.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Genre {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;

	private String description;
	
	@OneToMany(mappedBy="genre")
	private List<Boardgame> boardGames;

	public Genre() {
		super();
	}
	

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


	

	@Override
	public String toString() {
		return name;
	}
	
	public void addBoardgame(Boardgame game) {
		if(boardGames == null) boardGames = new ArrayList<Boardgame>();
		
		if(!boardGames.contains(game)) {
			boardGames.add(game);
			if(game.getGenre() != null) {
				game.getGenre().getBoardGames().remove(game);
			}
			game.setGenre(this);
		}
	}

	public void removeBoardgame(Boardgame game) {
		game.setGenre(null);
		if(boardGames != null) {
			boardGames.remove(game);
		}
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
		Genre other = (Genre) obj;
		if (id != other.id)
			return false;
		return true;
	}
	
	

}
