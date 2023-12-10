package com.mfrutchey.indecider.models;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "games")
public class Game {
	// Class Attributes & Validations:
	// Automatically created attributes:
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(updatable = false)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createdAt;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date updatedAt;
	
	@PrePersist
	protected void onCreate() {
		this.createdAt = new Date();
		this.updatedAt = new Date();
	}
	
	@PreUpdate
	protected void onUpdate() {
		this.updatedAt = new Date();
	}
	
	// Connect the relationship (User -> Shows)
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	private User user;
	
	// Attributes set by the user:
	@NotBlank(message = "Game title is required.")
	@Size(min = 1, max = 30, message = "Game title must be between 1 and 30 characters.")
	private String gameTitle;
	
	@NotBlank(message = "Game genre is required.")
	@Size(min = 3, max = 20, message = "Game genre must be between 3 and 20 characters.")
	private String gameGenre;
	
	@NotBlank(message = "Game platform must not be blank.")
	@Size(min = 2, max = 20, message = "Game platform must be between 2 and 20 characters")
	private String gamePlatform;
	
	@NotNull(message = "Please indicate if this game is available for multiplayer.")
	private Boolean isMultiplayer;
	
	@NotBlank(message = "Please add a brief description or note (progress, details regarding your play, etc.) about the game.")
	@Size(min = 10, max = 255, message = "Description / Notes must be at least 10 characters.")
	@Column(columnDefinition = "TEXT")
	private String gameNotes;
	
	// Empty constructor for the Java Bean:
	public Game() {}

	// Getters & Setters:
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getGameTitle() {
		return gameTitle;
	}

	public void setGameTitle(String gameTitle) {
		this.gameTitle = gameTitle;
	}

	public String getGameGenre() {
		return gameGenre;
	}

	public void setGameGenre(String gameGenre) {
		this.gameGenre = gameGenre;
	}

	public String getGamePlatform() {
		return gamePlatform;
	}

	public void setGamePlatform(String gamePlatform) {
		this.gamePlatform = gamePlatform;
	}

	public Boolean getIsMultiplayer() {
		return isMultiplayer;
	}

	public void setIsMultiplayer(Boolean isMultiplayer) {
		this.isMultiplayer = isMultiplayer;
	}

	public String getGameNotes() {
		return gameNotes;
	}

	public void setGameNotes(String gameNotes) {
		this.gameNotes = gameNotes;
	}
	
	
}
