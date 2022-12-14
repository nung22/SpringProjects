package com.nicholasung.javaBeltExam.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="users")
public class User {
    // Member Variables
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Size(min=3, max=30, message="First name must be between 3 and 30 characters.")
    private String firstName;
    
    @Size(min=3, max=30, message="Last name must be between 3 and 30 characters.")
    private String lastName;
    
    @NotEmpty(message="Email is required.")
    @Email(message="Please enter a valid email.")
    private String email;
    
    @Size(min=8, max=128, message="Password must be between 8 and 128 characters.")
    private String password;
    
    @Transient
    @Size(min=8, max=128, message="Confirm PW must be between 8 and 128 characters.")
    private String confirm;
    
    // createdAt & updatedAt
    @Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
	@PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }
    
    // Implement one to many relationship with projects
    @OneToMany(mappedBy="leader", fetch=FetchType.LAZY)
    private List<Project> leadProjects;
    // Implement one to many relationship with tasks
    @OneToMany(mappedBy="user", fetch=FetchType.LAZY)
    private List<Task> tasks;
    // Implement many to many relationship with user
    @ManyToMany(fetch=FetchType.LAZY)
    @JoinTable(
    		name = "users_projects",
    		joinColumns = @JoinColumn(name="user_id"),
    		inverseJoinColumns = @JoinColumn(name = "project_id"))
    private List<Project> projects;
    
    // Constructors
    public User() {}

    // Getters & Setters
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getConfirm() {
		return confirm;
	}
	public void setConfirm(String confirm) {
		this.confirm = confirm;
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
	public List<Project> getProjects() {
		return projects;
	}
	public void setProjects(List<Project> projects) {
		this.projects = projects;
	}
	public List<Task> getTasks() {
		return tasks;
	}
	public void setTasks(List<Task> tasks) {
		this.tasks = tasks;
	}
	public List<Project> getLeadProjects() {
		return leadProjects;
	}
	public void setLeadProjects(List<Project> leadProjects) {
		this.leadProjects = leadProjects;
	}
}
