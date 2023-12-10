package com.mfrutchey.indecider.models;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "users")
public class User {
	// Class Attributes & Validations:
	// Automatically Created Attributes:
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(updatable = false)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createdAt;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date updatedAt;
	
	@PreUpdate
	protected void onUpdate() {
		this.updatedAt = new Date();
	}
	
	@PrePersist
	protected void onCreate() {
		this.createdAt = new Date();
		this.updatedAt = new Date();
	}
	
	// The various one-to-many relationships:
	@OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
	private List<Show> shows;
	
	@OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
	private List<RandomItem> randomItems;
	
	@OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
	private List<Restaurant> restaurants;
	
	@OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
	private List<Game> games;
	
	@OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
	private List<Book> books;
	
	// Attributes set by the user:
	@NotEmpty(message = "Username is required.")
	@Size(min = 2, max = 30, message = "Username must be between 2 and 30 characters.")
	private String username;
	
	@NotEmpty(message = "Email is required.")
	@Email(message = "Please enter a valid email format.")
	private String email;
	
	@NotEmpty(message = "Password is required.")
	@Size(min = 8, max = 128, message = "Password must be between 8 and 128 characters.")
	private String password;
	
	@Transient
	@NotEmpty(message = "Please confirm your password.")
	@Size(min = 8, max = 128, message = "Password confirmation must be between 8 and 128 characters.")
	private String confirmPassword;
	
	// Empty constructor for the Java Bean:
	public User() {}

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

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	
	
}
