package com.noname.myproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SimulatorController {
	
	@RequestMapping(value = "simulator/simulator_main", method = RequestMethod.GET)
	public String simulator_main() {
		return "/simulator/simulator_main";
	}
	

	@RequestMapping(value = "simulator/simulator_simulate", method = RequestMethod.GET)
	public String simulator_simulate(String topic, Model model) {
		model.addAttribute("topic", topic);
		return "/simulator/simulator_simulate";
	}
	
	@RequestMapping(value = "simulator/simulator_HTU", method = RequestMethod.GET)
	public String simulator_HTU() {
		return "/simulator/simulator_HTU";
	}
}
