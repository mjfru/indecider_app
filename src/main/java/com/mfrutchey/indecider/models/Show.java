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
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "shows")
public class Show {
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
	@NotBlank(message = "Show name is required.")
	@Size(min = 1, max = 50, message = "Show name must be between 1 and 50 characters.")
	private String showTitle;
	
	@NotBlank(message = "Genre is required.")
	@Size(min = 3, max = 15, message = "Genre must be between 3 and 15 characters.")
	private String showGenre;
	
	@NotBlank(message = "Streaming platform is required.")
	@Size(min = 2, max = 15, message = "Name of streaming platform must be between 2 and 15 characters.")
	private String showPlatform;
	
	@NotNull(message = "Please indicate how many seasons this show has.")
	@Min(value = 1, message = "Show must have at least 1 season")
	@Max(value = 100, message = "Show must not have more than 100 seasons.")
	private Integer numberOfSeasons;
	
	
	// Empty constructor for the Java Bean:
	public Show() {}

	// Getters & Setters
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

	public String getShowTitle() {
		return showTitle;
	}

	public void setShowTitle(String showTitle) {
		this.showTitle = showTitle;
	}

	public String getShowGenre() {
		return showGenre;
	}

	public void setShowGenre(String showGenre) {
		this.showGenre = showGenre;
	}

	public String getShowPlatform() {
		return showPlatform;
	}

	public void setShowPlatform(String showPlatform) {
		this.showPlatform = showPlatform;
	}

	public Integer getNumberOfSeasons() {
		return numberOfSeasons;
	}

	public void setNumberOfSeasons(Integer numberOfSeasons) {
		this.numberOfSeasons = numberOfSeasons;
	}	
}
