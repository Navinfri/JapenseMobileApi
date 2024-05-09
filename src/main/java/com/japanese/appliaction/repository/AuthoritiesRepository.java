package com.japanese.appliaction.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.japanese.appliaction.model.Authorities;

public interface AuthoritiesRepository extends JpaRepository<Authorities, Long> {

	void deleteByUserId(Long userId);
    // You can add custom query methods here if needed

	List<Authorities> findByUserId(long userId);

	Authorities findByemail(String userEmail);
}

