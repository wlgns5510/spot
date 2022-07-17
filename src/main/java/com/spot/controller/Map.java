package com.spot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spot.vo.MapVo;


@Controller
public class Map {
	
	@RequestMapping(value="/", method= {RequestMethod.GET, RequestMethod.POST})
	public String main() {
		return "/main";
	}
	
	@ResponseBody
	@RequestMapping(value="/now", method= {RequestMethod.GET, RequestMethod.POST})
	public int now(@RequestBody MapVo mVo) {
		System.out.println(mVo);
		return 1;
	}
}
