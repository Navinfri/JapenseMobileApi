package com.japanese.appliaction.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.stereotype.Repository;

import com.japanese.appliaction.model.StudyMaterial;

@Repository
@EnableJpaRepositories
public interface AddMeterialRepo extends JpaRepository<StudyMaterial, Long> {

	Optional<StudyMaterial> findById(Long id);

	void deleteById(Long id);

	boolean existsById(Long id);

}
