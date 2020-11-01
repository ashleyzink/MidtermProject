package com.skilldistillery.gamebored.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name= "board_game")
public class Boardgame {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	private String description;
	
	@Column(name= "min_players")
	private int minPlayers;
	
	@Column(name= "max_players")
	private Integer maxPlayers;
	
	@Column(name= "play_time_minutes")
    private Integer playTimeMinutes;
	
	private Double cost;
	
	@ManyToOne
	@JoinColumn(name="genre_id")
	private Genre genre;
	
	@ManyToOne
	@JoinColumn(name="category_id")
	private Category category;
	
	@ManyToOne
	@JoinColumn(name="publisher_id")
	private Publisher publisher;

	@Column(name= "logo_url")
	private String logoUrl;
	
	@Column(name= "box_art_url")
	private String boxArtUrl;
	
	@OneToMany(mappedBy = "boardgame")
	private List<BoardGameComment> boardGameComments;
	
	@ManyToMany(mappedBy= "favorites")
	private List<User> userWithFavs;
	@ManyToMany(mappedBy= "owned")
	private List<User> userWithOwned;
	

	public Boardgame() {
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
	public int getMinPlayers() {
		return minPlayers;
	}
	public void setMinPlayers(int minPlayers) {
		this.minPlayers = minPlayers;
	}
	public Integer getMaxPlayers() {
		return maxPlayers;
	}
	public void setMaxPlayers(Integer maxPlayers) {
		this.maxPlayers = maxPlayers;
	}
	public Integer getPlayTimeMinutes() {
		return playTimeMinutes;
	}
	public void setPlayTimeMinutes(Integer playTimeMinutes) {
		this.playTimeMinutes = playTimeMinutes;
	}
	public Double getCost() {
		return cost;
	}
	public void setCost(Double cost) {
		this.cost = cost;
	}
	public String getLogoUrl() {
		return logoUrl;
	}
	public void setLogoUrl(String logoUrl) {
		this.logoUrl = logoUrl;
	}
	public String getBoxArtUrl() {
		return boxArtUrl;
	}
	public void setBoxArtUrl(String boxArtUrl) {
		this.boxArtUrl = boxArtUrl;
	}
	

	public Genre getGenre() {
		return genre;
	}

	public void setGenre(Genre genre) {
		this.genre = genre;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}




	public Publisher getPublisher() {
		return publisher;
	}




	public void setPublisher(Publisher publisher) {
		this.publisher = publisher;
	}




	public List<BoardGameComment> getBoardGameComments() {
		return boardGameComments;
	}




	public void setBoardGameComments(List<BoardGameComment> boardGameComments) {
		this.boardGameComments = boardGameComments;
	}




	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Boardgame [id=");
		builder.append(id);
		builder.append(", name=");
		builder.append(name);
		builder.append(", description=");
		builder.append(description);
		builder.append(", minPlayers=");
		builder.append(minPlayers);
		builder.append(", maxPlayers=");
		builder.append(maxPlayers);
		builder.append(", playTimeMinutes=");
		builder.append(playTimeMinutes);
		builder.append(", cost=");
		builder.append(cost);
		builder.append(", logoUrl=");
		builder.append(logoUrl);
		builder.append(", boxArtUrl=");
		builder.append(boxArtUrl);
		builder.append("]");
		return builder.toString();
	}
	
	public void addBoardgameComment(BoardGameComment comment) {
		if(boardGameComments == null) boardGameComments = new ArrayList<BoardGameComment>();
		
		if(!boardGameComments.contains(comment)) {
			boardGameComments.add(comment);
			if(comment.getBoardgame() != null) {
				comment.getBoardgame().getBoardGameComments().remove(comment);
			}
			comment.setBoardgame(this);
		}
	}

	public void removeBoardgameComment(BoardGameComment comment) {
		comment.setBoardgame(null);
		if(boardGameComments != null) {
			boardGameComments.remove(comment);
		}
	}
	
	public void addUserWithFav(User user) {
		if(userWithFavs == null) {userWithFavs = new ArrayList<User>();}
		if(!userWithFavs.contains(user)) {
			userWithFavs.add(user);
			user.addFavorite(this);
		}
	}
	
	public void removeUserWithFav(User user) {
		if(userWithFavs != null && userWithFavs.contains(user)) {
			userWithFavs.remove(user);
			user.removeFavorite(this);
		}
		
	}
	public void addUserWithOwned(User user) {
		if(userWithOwned == null) {userWithOwned = new ArrayList<User>();}
		if(!userWithOwned.contains(user)) {
			userWithOwned.add(user);
			user.addOwned(this);
		}
	}
	
	public void removeUserWithOwned(User user) {
		if(userWithOwned != null && userWithOwned.contains(user)) {
			userWithOwned.remove(user);
			user.removeOwned(this);
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
		Boardgame other = (Boardgame) obj;
		if (id != other.id)
			return false;
		return true;
	}
}
