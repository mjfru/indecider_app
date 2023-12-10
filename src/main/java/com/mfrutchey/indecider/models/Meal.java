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
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "meals")
public class Meal {
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
	@NotBlank(message = "Meal name is required.")
	@Size(min = 2, max = 30, message = "Meal name must be between 2 and 30 characters.")
	private String mealName;
	
	@NotBlank(message = "Please indicate what kind of food this is.")
	@Size(min = 3, max = 20, message = "Food type must be between 3 and 20 characters.")
	private String foodType;
	
	@NotBlank(message = "Please indicate what course you would like to make this for.")
	@Size(min = 3, max = 10, message = "Course must be between 3 and 10 characters.")
	private String course;
	
	@NotBlank(message = "Please add a brief description or note (ingredients needed, tips, etc.")
	@Size(min = 5, max = 255, message = "Descriptions / Notes must be at least 5 characters.")
	@Column(columnDefinition = "TEXT")
	private String mealDescription;
	
	// Empty constructor for the Java Bean:
	public Meal() {}

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

	public String getMealName() {
		return mealName;
	}

	public void setMealName(String mealName) {
		this.mealName = mealName;
	}

	public String getFoodType() {
		return foodType;
	}

	public void setFoodType(String foodType) {
		this.foodType = foodType;
	}

	public String getCourse() {
		return course;
	}

	public void setCourse(String course) {
		this.course = course;
	}

	public String getMealDescription() {
		return mealDescription;
	}

	public void setMealDescription(String mealDescription) {
		this.mealDescription = mealDescription;
	}	
}
