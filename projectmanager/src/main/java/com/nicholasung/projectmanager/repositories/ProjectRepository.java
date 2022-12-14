package com.nicholasung.projectmanager.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.nicholasung.projectmanager.models.Project;
import com.nicholasung.projectmanager.models.User;

public interface ProjectRepository extends CrudRepository<Project, Long> {
	List<Project> findAll();
	List<Project> findAllByUsers(User user);
	List<Project> findByUsersNotContains(User user);
}
