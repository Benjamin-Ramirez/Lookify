package com.codingdojo.benjamin.controladores;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingdojo.benjamin.modelos.PlayList;
import com.codingdojo.benjamin.servicios.ServiceLookify;

@Controller
public class ControladorPlantillas {

	private final ServiceLookify serviceLookify;

	public ControladorPlantillas(ServiceLookify serviceLookify) {
		this.serviceLookify = serviceLookify;
	}
	
	@GetMapping("/")
	public String index() {
		return "index.jsp";
	}
	
	
	@GetMapping("/dashboard")
	public String dashboard(Model model) {
		
		List<PlayList> playlist = serviceLookify.find_playlist();
		model.addAttribute("playlist", playlist);
		return "dashboard.jsp";
	}
	
	
	@GetMapping("/songs/new")
	public String new_song(@ModelAttribute("playlist") PlayList playlist) {
		return "new.jsp";
	}
	
	
	@PostMapping("/songs/create")
	public String create_song(@Valid @ModelAttribute("playlist") PlayList playlist, BindingResult result) {
		
		if(result.hasErrors()) {
			return "new.jsp";
		}
		else {
			serviceLookify.save(playlist);
			return "redirect:/dashboard";
		}
	}
	
	
	@PostMapping("/search/")
	public String search(@RequestParam(value="search") String search) {
		if(search.isBlank()) {
			return "redirect:/dashboard";
		}
		else {
			return "redirect:/search/"+search;
		}
	}
	
	
	@GetMapping("/search/{artista}")
	public String artist(@PathVariable("artista") String artista, Model model) {
		
		List<PlayList> artist = serviceLookify.getSearch(artista);
		if(artist.isEmpty()) {
			return "redirect:/dashboard";
		}
		else {
			model.addAttribute("name", artista);
			model.addAttribute("artista", artist);
			return "showArtist.jsp";
		}
	}
	
	@PostMapping("/newSearch")
	public String newSearch(@RequestParam(value="newSearch") String artista, Model model) {
		List<PlayList> artist = serviceLookify.getSearch(artista);
		model.addAttribute("name", artista);
		model.addAttribute("artista", artist);
		return "redirect:/search/"+artista;
	}
	
	@GetMapping("/search/topTen")
	public String topTen(Model model) {
		
		List<PlayList> topTen = serviceLookify.getTopTen();
		model.addAttribute("topTen", topTen);
		
		return "topTen.jsp";
	}
	@GetMapping("/songs/{id}")
	public String datails(@PathVariable("id") Long id, Model model) {
		
		PlayList details = serviceLookify.find_song_id(id);
		model.addAttribute("detalles", details);
		
		return "details.jsp";
	}
	@DeleteMapping("/delete/{id}")
	public String delete(@PathVariable(value="id") Long id) {
		serviceLookify.delete(id);
		return "redirect:/dashboard";
	}
	
	
	
	
	
}
