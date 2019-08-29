package com.project.movies.cinema;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CinemaController {

   @RequestMapping("/cinema")
   public String getMain() {
      
      return "cinema/cinemaM";
   }
   
   @RequestMapping("/cinema/write")
   public String getForm() {
      
      return "cinema/write";
   }
   
}