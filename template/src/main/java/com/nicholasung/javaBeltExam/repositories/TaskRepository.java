package com.nicholasung.javaBeltExam.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.nicholasung.javaBeltExam.models.Task;

@Repository
public interface TaskRepository extends CrudRepository<Task, Long> {
	List<Task> findAll();
	List<Task> findByProjectIdIs(Long id);
}
