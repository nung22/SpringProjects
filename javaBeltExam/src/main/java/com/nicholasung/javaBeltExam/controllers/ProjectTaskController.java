package com.nicholasung.javaBeltExam.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.nicholasung.javaBeltExam.models.Project;
import com.nicholasung.javaBeltExam.models.Task;
import com.nicholasung.javaBeltExam.models.User;
import com.nicholasung.javaBeltExam.services.ProjectService;
import com.nicholasung.javaBeltExam.services.TaskService;

@Controller
public class ProjectTaskController {
	
	   @Autowired
	   private ProjectService projectServ;
	   @Autowired
	   private TaskService taskServ;
	   
	   // DASHBOARD
	   @GetMapping("/projects")
	   public String home(HttpSession session, Model model) {
		   if(session.getAttribute("user") == null) {
			   return "redirect:/logout";
		   }
		   User user = (User) session.getAttribute("user");
		   List<Project> projectsNotOnTeam = projectServ.allProjectsNotOnTeam(user);
		   List<Project> projectsOnTeam = projectServ.allProjectsOnTeam(user);
		   model.addAttribute("projectsNotOnTeam", projectsNotOnTeam);
		   model.addAttribute("projectsOnTeam", projectsOnTeam);
		   return "dashboard.jsp";
	   }
	   // Join Team
	   @GetMapping("/join/{userId}/{projectId}")
	   public String joinTeam(@PathVariable("userId") Long userId, 
			   @PathVariable("projectId") Long projectId) {
		   projectServ.addUserToProject(projectId, userId);
		   return "redirect:/projects";
	   }
	   // Leave Team
	   @GetMapping("/leave/{userId}/{projectId}")
	   public String leaveTeam(@PathVariable("userId") Long userId, 
			   @PathVariable("projectId") Long projectId) {
		   projectServ.removeUserFromProject(projectId, userId);
		   return "redirect:/projects";
	   }
	   
	   // SHOW PROJECT INFO
	   @GetMapping("/projects/{id}")
	   public String show(HttpSession session, @PathVariable("id") Long id, 
			   Model model) {
		   if(session.getAttribute("user") == null) {
			   return "redirect:/logout";
		   }
		   User user = (User) session.getAttribute("user");
		   model.addAttribute("joinedProject", projectServ.isOnProject(user, id));
		   Project project = projectServ.findById(id);
		   model.addAttribute("project", project);
		   return "show.jsp";
	   }
	   
	   // ADD PROJECT
	   @GetMapping("/projects/new")
	   public String addProject(HttpSession session, 
			   @ModelAttribute("project") Project emptyProject) {
		   if(session.getAttribute("user") == null) {
			   return "redirect:/logout";
		   }
		   return "create.jsp";
	   }
	   // Add Project
	   @PostMapping("/projects/new")
	   public String addProject(HttpSession session,
			   @Valid @ModelAttribute("project") Project filledProject, 
			   BindingResult result) {
		   if(result.hasErrors()) {		   
			   return "create.jsp";
		   }
		   User user = (User) session.getAttribute("user");
		   projectServ.createProject(filledProject);
		   projectServ.addUserToProject(filledProject.getId(), user.getId());
		   return "redirect:/projects";
	   }
	   
	   // EDIT PROJECT
	   @GetMapping("/projects/edit/{id}")
	   public String editProject(HttpSession session, 
			   @PathVariable("id") Long id, Model model) {
		   if(session.getAttribute("user") == null) {
			   return "redirect:/logout";
		   }
		   Project project = projectServ.findById(id);
		   model.addAttribute("project", project);
		   return "edit.jsp";
	   }
	   // Edit Project
	   @PutMapping("/projects/edit/{id}")
	   public String editProject(HttpSession session, @PathVariable("id") Long id,
			   Model model, @Valid @ModelAttribute("project") Project editedProject,
			   BindingResult result) {
		   if(result.hasErrors()) {
			   model.addAttribute("project", editedProject);
			   return "edit.jsp";
		   }
		   User user = (User) session.getAttribute("user");
		   projectServ.updateProject(editedProject);
		   projectServ.addUserToProject(editedProject.getId(), user.getId());
		   return "redirect:/projects";
	   }
	   
	   // DELETE PROJECT
	   @GetMapping("/projects/{id}/delete")
	   public String deleteProject(@PathVariable("id") Long id) {
			projectServ.deleteProject(projectServ.findById(id));
			return "redirect:/projects";
	   }
	   
	   // ADD TASK
	   @GetMapping("/projects/{id}/tasks")
	   public String addTask(HttpSession session, Model model,
			   @PathVariable("id") Long id,
			   @ModelAttribute("task") Task emptyTask) {
		   if(session.getAttribute("user") == null) {
			   return "redirect:/logout";
		   }
		   Project project = projectServ.findById(id);
		   List<Task> tasks = taskServ.allProjectTasks(id);
		   model.addAttribute("project", project);
		   model.addAttribute("tasks", tasks);
		   return "tasks.jsp";
	   }
	   // Add Task
	   @PostMapping("/projects/{projectId}/tasks")
	   public String addTask(@PathVariable("projectId") Long projectId, Model model,
			   @Valid @ModelAttribute("task") Task filledTask, 
			   BindingResult result) {
		   if(result.hasErrors()) {	
			   Project project = projectServ.findById(projectId);
			   List<Task> tasks = taskServ.allProjectTasks(projectId);
			   model.addAttribute("project", project);
			   model.addAttribute("tasks", tasks);
			   return "tasks.jsp";
		   }
		   taskServ.createTask(filledTask);
		   return "redirect:/projects/{projectId}/tasks";
	   }
	   
	   // DELETE TASK
	   @GetMapping("/projects/{projectId}/tasks/{taskId}/delete")
	   public String deleteTask(@PathVariable("projectId") Long projectId, 
			   @PathVariable("taskId") Long taskId) {
			taskServ.deleteTask(taskServ.findById(taskId));
			return "redirect:/projects/{projectId}/tasks";
	   }
}
