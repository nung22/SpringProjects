package com.nicholasung.javaBeltExam.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.nicholasung.javaBeltExam.models.UserProject;

@Repository
public interface UserProjectRepository extends CrudRepository<UserProject, Long> {
	List<UserProject> findAll();
	List<UserProject> findByUserIdIs(Long id);
	UserProject findByUserIdAndProjectId(Long userId, Long projectId);
}
