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
@Table(name = "restaurants")
public class Restaurant {
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
	@NotBlank(message = "Restaurant name is required.")
	@Size(min = 2, max = 20, message = "Restaurant name must be between 2 and 20 characters.")
	private String restaurantName;
	
	@NotBlank(message = "Type of restaurant is required.")
	@Size(min = 2, max = 20, message = "Restaurant type must be between 2 and 20 characters.")
	private String restaurantType;
	
	@NotBlank(message = "Restaurant town / location is required.")
	@Size(min = 2, max = 30, message = "Restaurant town / location must be between 2 and 30 characters.")
	private String restaurantLocation;
	
	@NotNull(message = "Please indicate whether this restaurant offers take-out.")
	private Boolean hasTakeout;
	
	@NotNull(message = "Please indicate if a reservation is required for this restaurant.")
	private Boolean needsReservation;
	
	// Empty constructor for the Java Bean:
	public Restaurant() {}

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

	public String getRestaurantName() {
		return restaurantName;
	}

	public void setRestaurantName(String restaurantName) {
		this.restaurantName = restaurantName;
	}

	public String getRestaurantType() {
		return restaurantType;
	}

	public void setRestaurantType(String restaurantType) {
		this.restaurantType = restaurantType;
	}

	public String getRestaurantLocation() {
		return restaurantLocation;
	}

	public void setRestaurantLocation(String restaurantLocation) {
		this.restaurantLocation = restaurantLocation;
	}

	public Boolean getHasTakeout() {
		return hasTakeout;
	}

	public void setHasTakeout(Boolean hasTakeout) {
		this.hasTakeout = hasTakeout;
	}

	public Boolean getNeedsReservation() {
		return needsReservation;
	}

	public void setNeedsReservation(Boolean needsReservation) {
		this.needsReservation = needsReservation;
	}

	
}
