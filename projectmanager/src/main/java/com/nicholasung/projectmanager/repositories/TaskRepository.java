package com.nicholasung.projectmanager.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.nicholasung.projectmanager.models.Task;

public interface TaskRepository extends CrudRepository<Task, Long> {
	List<Task> findByProject_Id(Long id);
	List<Task> findAll();
}
