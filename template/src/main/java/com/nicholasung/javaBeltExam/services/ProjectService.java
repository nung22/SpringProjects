package com.nicholasung.javaBeltExam.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nicholasung.javaBeltExam.models.Project;
import com.nicholasung.javaBeltExam.models.User;
import com.nicholasung.javaBeltExam.repositories.ProjectRepository;
import com.nicholasung.javaBeltExam.repositories.UserRepository;

@Service
public class ProjectService {
	
	@Autowired
	ProjectRepository projectRepo;
	@Autowired
	UserRepository userRepo;
	@Autowired
	UserService userServ;
	
	// returns all the projects
	public List<Project> allProjects(){
		return projectRepo.findAll();
	}
	// updates a project
	public Project updateProject(Project project) {
		return projectRepo.save(project);
	}
	// returns all the projects where a given user is on the team
	public List<Project> allProjectsOnTeam(User user){
		return projectRepo.findAllByUsers(user);
	}
	// returns all the projects where a given user is not on the team
	public List<Project> allProjectsNotOnTeam(User user){
		return projectRepo.findByUsersNotContains(user);
	}
    // returns if a user is on a given project
    public boolean isOnProject(User user, Long projectId) {
 	   if(this.allProjectsOnTeam(user).contains(this.findById(projectId))) {
 		   return true;
	   }
 	   return false;
    }
    // creates a project
	public Project createProject(Project project) {
		return projectRepo.save(project);
	}
	// deletes a project
	public void deleteProject(Project project) {
		projectRepo.delete(project);
	}
	// retrieves a project
	public Project findById(Long id) {
		return projectRepo.findById(id).orElse(null);
	}
}
