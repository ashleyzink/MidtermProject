package com.skilldistillery.gamebored.entities;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
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
	List<BoardGameComment> boardGameComments;
	
	@OneToMany(mappedBy = "user")
	private List<CommunityComment> communityComment;

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
		return communityComment;
	}

	public void setCommunityComment(List<CommunityComment> communityComment) {
		this.communityComment = communityComment;
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
