package com.codingdojo.benjamin.repositorios;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.benjamin.modelos.PlayList;

@Repository
public interface RepositorioLookify extends CrudRepository<PlayList, Long> {

	List<PlayList> findAll();
	
	List<PlayList> findByArtist(String artist);
	
	List<PlayList> findTop10ByOrderByRatingDesc();
	
	long count();
	
}
