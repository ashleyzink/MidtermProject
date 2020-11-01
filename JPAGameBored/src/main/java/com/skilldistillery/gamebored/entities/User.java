package com.skilldistillery.gamebored.entities;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class User {

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String username;
	
	private String password;
	
	private int enabled;
	
	private String role;
	
	@Column(name ="first_name")
	private String firstName;
	
	@Column(name ="last_name")
	private String lastName;
	
	private String email;
	@ManyToMany
	  @JoinTable(name="favorite_board_game",
	    joinColumns=@JoinColumn(name="user_id"),
	    inverseJoinColumns=@JoinColumn(name="board_game_id"))
	private List<Boardgame> favorites;
	@ManyToMany
	  @JoinTable(name="owned_board_game",
	    joinColumns=@JoinColumn(name="user_id"),
	    inverseJoinColumns=@JoinColumn(name="board_game_id"))
	private List<Boardgame> owned;
	
	@OneToOne
	@JoinColumn(name ="address_id")
	private Address address;
	
	@Column(name ="profile_image_url")
	private String profileImageUrl;
	
	@Column(name ="bio_description")
	private String bioDescription;
	
	@Column(name ="create_date")
	private LocalDateTime createDate;
	
	@OneToMany(mappedBy = "user")
	private List<BoardGameComment> boardGameComments;
	
	@OneToMany(mappedBy = "user")
	private List<CommunityComment> communityComments;

	@OneToMany(mappedBy = "user")
	private List<Meetup> meetups;
	
	public User() {
		super();
	}
	
	public User(int id, String username, String password, int enabled, String firstName, String lastName, String email,
			Address address) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.enabled = enabled;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.address = address;
	}
	
	public User(String username, String password, int enabled, String firstName, String lastName, String email,
			Address address) {
		super();
		this.username = username;
		this.password = password;
		this.enabled = enabled;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.address = address;
	}





	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getEnabled() {
		return enabled;
	}

	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getProfileImageUrl() {
		return profileImageUrl;
	}

	public void setProfileImageUrl(String profileImageUrl) {
		this.profileImageUrl = profileImageUrl;
	}

	public String getBioDescription() {
		return bioDescription;
	}

	public void setBioDescription(String bioDescription) {
		this.bioDescription = bioDescription;
	}

	public LocalDateTime getCreateDate() {
		return createDate;
	}

	public void setCreateDate(LocalDateTime createDate) {
		this.createDate = createDate;
	}

	
	public List<BoardGameComment> getBoardGameComments() {
		return boardGameComments;
	}

	public void setBoardGameComments(List<BoardGameComment> boardGameComments) {
		this.boardGameComments = boardGameComments;
	}
	

	public List<CommunityComment> getCommunityComment() {
		return communityComments;
	}

	public void setCommunityComment(List<CommunityComment> communityComment) {
		this.communityComments = communityComment;
	}
	
	

	public List<Meetup> getMeetups() {
		return meetups;
	}

	public void setMeetups(List<Meetup> meetups) {
		this.meetups = meetups;
	}

	
	public Address getAddress() {
		return address;
	}



	public void setAddress(Address address) {
		this.address = address;
	}
	
	
	public List<Boardgame> getFavorites() {
		return favorites;
	}

	public void setFavorites(List<Boardgame> favorites) {
		this.favorites = favorites;
	}

	public List<Boardgame> getOwned() {
		return owned;
	}

	public void setOwned(List<Boardgame> owned) {
		this.owned = owned;
	}

	public List<CommunityComment> getCommunityComments() {
		return communityComments;
	}

	public void setCommunityComments(List<CommunityComment> communityComments) {
		this.communityComments = communityComments;
	}

	public void addBoardgameComment(BoardGameComment comment) {
		if(boardGameComments == null) boardGameComments = new ArrayList<BoardGameComment>();
		
		if(!boardGameComments.contains(comment)) {
			boardGameComments.add(comment);
			if(comment.getUser() != null) {
				comment.getUser().getBoardGameComments().remove(comment);
			}
			comment.setUser(this);
		}
	}

	public void removeBoardgameComment(BoardGameComment comment) {
		comment.setUser(null);
		if(boardGameComments != null) {
			boardGameComments.remove(comment);
		}
	}
	
	public void addCommunityComment(CommunityComment comment) {
		if(communityComments == null) communityComments = new ArrayList<CommunityComment>();
		
		if(!communityComments.contains(comment)) {
			communityComments.add(comment);
			if(comment.getUser() != null) {
				comment.getUser().getCommunityComment().remove(comment);
			}
			comment.setUser(this);
		}
	}
	
	public void removeCommunityComment(BoardGameComment comment) {
		comment.setUser(null);
		if(communityComments != null) {
			communityComments.remove(comment);
		}
	}
	public void addMeetUp(Meetup meetUp) {
		if(meetups == null) meetups = new ArrayList<Meetup>();
		
		if(!meetups.contains(meetUp)) {
			meetups.add(meetUp);
			if(meetUp.getUser() != null) {
				meetUp.getUser().getBoardGameComments().remove(meetUp);
			}
			meetUp.setUser(this);
		}
	}
	
	public void removeMeetUp(Meetup meetUp) {
		meetUp.setUser(null);
		if(meetups != null) {
			meetups.remove(meetUp);
		}
	}
	public void addFavorite(Boardgame favorite) {
		if(favorites == null) {favorites = new ArrayList<Boardgame>();}
		if(!favorites.contains(favorite)) {
			favorites.add(favorite);
			favorite.addUserWithFav(this);
		}
	}
	public void removeFavorite(Boardgame favorite) {
		if(favorites != null && favorites.contains(favorite)) {
			favorites.remove(favorite);
			favorite.removeUserWithFav(this);
		}
		
	}
	public void addOwned(Boardgame ownedBG) {
		if(owned == null) {owned = new ArrayList<Boardgame>();}
		if(!owned.contains(ownedBG)) {
			owned.add(ownedBG);
			ownedBG.addUserWithOwned(this);
		}
	}
	public void removeOwned(Boardgame ownedBG) {
		if(owned != null && owned.contains(ownedBG)) {
			owned.remove(ownedBG);
			ownedBG.removeUserWithOwned(this);
		}
		
	}
	
	



	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", enabled=" + enabled
				+ ", role=" + role + ", firstName=" + firstName + ", lastName=" + lastName + ", email=" + email
				+ ", profileImageUrl=" + profileImageUrl + ", bioDescription=" + bioDescription + ", createDate="
				+ createDate + "]";
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
		User other = (User) obj;
		if (id != other.id)
			return false;
		return true;
	}


	
}
