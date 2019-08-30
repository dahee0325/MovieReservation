package com.project.reserve.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.project.reserve.domain.CinemaData;
import com.project.reserve.domain.ListData;
import com.project.reserve.domain.MovieTimeData;
import com.project.reserve.domain.ReserveCheck;
import com.project.reserve.domain.ReserveData;
import com.project.reserve.service.ReserveService;

@RestController
public class ReserveController {

	@Autowired
	private ReserveService reserveService;
	
	@CrossOrigin
	@GetMapping("/cinemaList")
	public ResponseEntity<List<CinemaData>> getCinemaList() {
		
		List<CinemaData> list = reserveService.getCinemaList();
		
		ResponseEntity<List<CinemaData>> entity = new ResponseEntity<List<CinemaData>>(list, HttpStatus.OK);
		
		return entity;
	}
	
	@CrossOrigin
	@GetMapping("/dateList")
	public ResponseEntity<List<ListData>> getDateList() {
		
		List<ListData> list = reserveService.getDatemaList();
		
		ResponseEntity<List<ListData>> entity = new ResponseEntity<List<ListData>>(list, HttpStatus.OK);
		
		return entity;
	}
	
	
	@CrossOrigin
	@GetMapping("/bycinemaList/{cidx}")
	public ResponseEntity<List<ListData>> getByCinemaList(@PathVariable("cidx") int cidx) {
		
		List<ListData> list = reserveService.getByCinemaList(cidx);
		
		ResponseEntity<List<ListData>> entity = new ResponseEntity<List<ListData>>(list, HttpStatus.OK);

		
		return entity;
	}
	
	@CrossOrigin
	@GetMapping("/selectTimeList")
	public ResponseEntity<List<MovieTimeData>> getSelectTimeList(@RequestParam("cidx") int cidx, @RequestParam("tDate") int tDate) {
		
		List<MovieTimeData> list = reserveService.getSelectTimeList(cidx, tDate);
		ResponseEntity<List<MovieTimeData>> entity = new ResponseEntity<List<MovieTimeData>>(list, HttpStatus.OK);
		
		return entity;
	}
	
	@CrossOrigin
	@GetMapping("/getTicket")
	public ResponseEntity<Integer> getTicketNum(@RequestParam("cidx") int cidx, @RequestParam("tDate") int tDate, @RequestParam("tTime") String tTime) {
		
		int TicketNum = reserveService.getTicketNum(cidx, tDate, tTime);
		
		return new ResponseEntity<Integer>(TicketNum, HttpStatus.OK);
	}
	
	@CrossOrigin
	@GetMapping("/seat")
	public ResponseEntity<ReserveCheck> getSeatPrint(@RequestParam("cidx") int cidx, @RequestParam("tidx") int tidx) {
		
		ReserveCheck rc = reserveService.getSeatPrint(cidx, tidx);
		ResponseEntity<ReserveCheck> entity = new ResponseEntity<ReserveCheck>(rc, HttpStatus.OK);
		
		return entity;
	}
	
	
	@CrossOrigin
	@PostMapping("/reserve")
	public ResponseEntity<Integer> reserve(@RequestParam("idx") int idx ,@RequestParam("sidx") int sidx, @RequestParam("tidx") int tidx) {

		int reserveResult = reserveService.reserve(idx, sidx, tidx);
		
		return new ResponseEntity<Integer>(reserveResult, HttpStatus.OK);
	}
	
	@CrossOrigin
	@GetMapping("/reserveInfo/{idx}")
	public ResponseEntity<List<ReserveData>> getReserveInfo(@PathVariable("idx") int idx) {
		
		List<ReserveData> list = reserveService.getReserveInfo(idx);
		ResponseEntity<List<ReserveData>> entity = new ResponseEntity<List<ReserveData>>(list, HttpStatus.OK);
		
		return entity;
		
	}
	
	@CrossOrigin
	@DeleteMapping("/reserveDel/{ridx}")
	public ResponseEntity<Integer> reserveDel(@PathVariable("ridx") int ridx) {

		int reserveResult = reserveService.reserveDel(ridx);
		
		return new ResponseEntity<Integer>(reserveResult, HttpStatus.OK);
	}
	
	
}
