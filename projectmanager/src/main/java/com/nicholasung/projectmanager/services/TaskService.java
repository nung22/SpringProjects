package com.nicholasung.projectmanager.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nicholasung.projectmanager.models.Task;
import com.nicholasung.projectmanager.repositories.TaskRepository;

@Service
public class TaskService {
	
	@Autowired
	TaskRepository taskRepo;
	
    // returns all the tasks
    public List<Task> allTasks() {
        return taskRepo.findAll();
    }
    // returns all the tasks for a given project
    public List<Task> allProjectTasks(Long id) {
    	return taskRepo.findByProject_Id(id);
    }
    // creates a task
    public Task createTask(Task b) {
        return taskRepo.save(b);
    }
    // retrieves a task
    public Task findTask(Long id) {
    	return taskRepo.findById(id).orElse(null);
    }
    // updates a task
    public Task updateTask(Task b) {
        return taskRepo.save(b);
    }
    // deletes a task
    public void deleteTask(Long id) {
    	Optional<Task> optionalTask = taskRepo.findById(id);
    	if(optionalTask.isPresent()) {
    		taskRepo.deleteById(id);    		
    	}
    }
}
