package com.project.movies.cinema;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/cinema")
public class CinemaController {

   @RequestMapping
   public String getMain() {
      
      return "cinema/cinemaM";
   }
   
   @RequestMapping("/write")
   public String getForm() {
      
      return "cinema/write";
   }
   
   @RequestMapping("/list")
   public String getList() {
      
      return "cinema/cinemaList";
   }
   
}