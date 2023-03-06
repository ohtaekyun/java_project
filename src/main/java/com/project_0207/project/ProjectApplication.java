package com.project_0207.project;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class ProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(ProjectApplication.class, args);
	}

}

// @RestController
// class Helloworld {
//         @GetMapping("/")
//         public String greet() {
//                 return "home";
//         }
// }