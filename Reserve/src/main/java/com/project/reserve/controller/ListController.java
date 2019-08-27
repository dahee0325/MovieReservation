package com.project.reserve.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.project.reserve.domain.ListData;
import com.project.reserve.service.ListViewService;

@RestController
public class ListController {

	@Autowired
	private ListViewService listService;
	
	@CrossOrigin
	@GetMapping("/cinemaList")
	public ResponseEntity<List<ListData>> getCinemaList() {
		
		List<ListData> list = listService.getCinemaList();
		
		ResponseEntity<List<ListData>> entity = new ResponseEntity<List<ListData>>(list, HttpStatus.OK);
		
		return entity;
	}
	
	@CrossOrigin
	@GetMapping("/dateList")
	public ResponseEntity<List<ListData>> getDateList() {
		
		List<ListData> list = listService.getDatemaList();
		
		ResponseEntity<List<ListData>> entity = new ResponseEntity<List<ListData>>(list, HttpStatus.OK);
		
		return entity;
	}
	
	
	@CrossOrigin
	@GetMapping("/bycinemaList/{cidx}")
	public ResponseEntity<List<ListData>> getByCinemaList(@PathVariable("cidx") int cidx) {
		
		List<ListData> list = listService.getByCinemaList(cidx);
		
		ResponseEntity<List<ListData>> entity = new ResponseEntity<List<ListData>>(list, HttpStatus.OK);

		
		return entity;
	}
	
	@CrossOrigin
	@GetMapping("/selectTimeList")
	public ResponseEntity<List<ListData>> getSelectTimeList(@RequestParam("cidx") int cidx, @RequestParam("cDate") int cDate) {
		
		List<ListData> list = listService.getSelectTimeList(cidx, cDate);
		ResponseEntity<List<ListData>> entity = new ResponseEntity<List<ListData>>(list, HttpStatus.OK);
		
		return entity;
	}
	
	@CrossOrigin
	@GetMapping("/getTicket")
	public int getTicketNum(@RequestParam("cidx") int cidx, @RequestParam("cDate") int cDate, @RequestParam("cTime") String cTime) {
		
		int TicketNum = listService.getTicketNum(cidx, cDate, cTime);
		
		return TicketNum;
	}
	
	@CrossOrigin
	@GetMapping("/seat/{tidx}")
	public int getSeatPrint(@PathVariable("tidx") int tidx) {
		
		int TicketNum = listService.getSeatPrint(tidx);
		
		return TicketNum;
	}
	
}
