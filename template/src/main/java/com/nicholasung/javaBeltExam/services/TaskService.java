package com.nicholasung.javaBeltExam.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nicholasung.javaBeltExam.models.Task;
import com.nicholasung.javaBeltExam.repositories.TaskRepository;

@Service
public class TaskService {
	
	@Autowired
	TaskRepository taskRepo;
	
	// returns all the tasks
	public List<Task> allTasks(){
		return taskRepo.findAll();
	}
	// returns all the tasks for a given project
	public List<Task> allProjectTasks(Long projectId){
		return taskRepo.findByProjectIdIs(projectId);
	}
	// creates a task
	public Task createTask(Task task) {
		return taskRepo.save(task);
	}
	// updates a task
	public void deleteTask(Task task) {
		taskRepo.delete(task);
	}
    // retrieves a task
    public Task findById(Long id) {
    	return taskRepo.findById(id).orElse(null);
    }
    // deletes a task
    public void deleteTask(Long id) {
    	taskRepo.deleteById(id);    		
    }
}
