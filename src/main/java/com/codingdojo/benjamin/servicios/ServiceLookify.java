package com.codingdojo.benjamin.servicios;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.benjamin.modelos.PlayList;
import com.codingdojo.benjamin.repositorios.RepositorioLookify;

@Service
public class ServiceLookify {
	
	private final RepositorioLookify repositorio_lookify;
	
	public ServiceLookify(RepositorioLookify repositorio_lookify) {
		this.repositorio_lookify = repositorio_lookify;
	}

	public List<PlayList> find_playlist(){
		return repositorio_lookify.findAll();
		}
	public PlayList find_song_id(Long id) {
		
		Optional<PlayList> optionalSong = repositorio_lookify.findById(id);
		if(optionalSong.isPresent()) {
			return optionalSong.get();
		}
		else {
			return null;
		}
		
	}
	// Encontrar una cancion por artista en el search
    public List<PlayList> getSearch(String artist){
        return repositorio_lookify.findByArtist(artist);
    }
	public PlayList save(PlayList newPlaylist) {
		return repositorio_lookify.save(newPlaylist);
	}
	
	public List<PlayList> getTopTen(){
		return repositorio_lookify.findTop10ByOrderByRatingDesc();
	}
	
	public void delete(Long id) {
		repositorio_lookify.deleteById(id);
	}
	

}
