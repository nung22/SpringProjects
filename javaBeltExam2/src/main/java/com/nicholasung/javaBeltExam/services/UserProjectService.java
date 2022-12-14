package com.nicholasung.javaBeltExam.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nicholasung.javaBeltExam.models.Project;
import com.nicholasung.javaBeltExam.models.User;
import com.nicholasung.javaBeltExam.models.UserProject;
import com.nicholasung.javaBeltExam.repositories.UserProjectRepository;

@Service
public class UserProjectService {
	
	@Autowired
	UserProjectRepository userProjRepo;
	@Autowired
	ProjectService projectServ;
  	@Autowired
  	UserService userServ;
	
	// adds a given user to a given project
	public void addUserToProject(Long projectId, Long userId) {
		// retrieve an instance of a project
		Project thisProject = projectServ.findById(projectId);
		// retrieve an instance of a user
		User thisUser = userServ.findById(userId);
		// create relationship between user and project
		UserProject assignment = new UserProject(thisUser, thisProject);
		// save assignment
		userProjRepo.save(assignment);
	}
	// removes a given user from a given project
	public void removeUserFromProject(Long projectId, Long userId) {
		UserProject assignment = userProjRepo.findByUserIdAndProjectId(userId, projectId);
		userProjRepo.delete(assignment);
	}
	// returns all the userProjects
	public List<UserProject> allUserProjects(){
		return userProjRepo.findAll();
	}
    // retrieves a userProject
    public UserProject findById(Long id) {
    	return userProjRepo.findById(id).orElse(null);
    }
    // deletes a userProject
    public void deleteUserProject(Long id) {
    	userProjRepo.deleteById(id);    		
    }
}
