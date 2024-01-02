package com.tjoeun.ilsan.member.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tjoeun.ilsan.member.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@GetMapping(value = "/member/joinView")
	public String joinView() {
		return "/member/joinView";
	}
	
	@PostMapping(value = "/member/join")
	public String loginView(@RequestParam Map map) {
		memberService.join(map);
		return "/member/loginView";
	}
	
	@GetMapping(value = "/member/loginView")
	public String loginView() {
		return "/member/loginView";
	}

	@PostMapping(value = "/member/login")
	public String login(@RequestParam Map map, HttpSession session) {
		Map memberInfoMap = memberService.login(map);
		if( null == memberInfoMap) {
			return "redirect:/member/loginView";
		} else {
			session.setAttribute("userId", memberInfoMap.get("id")); // 세션에 아이디를 넣어 보냄
			return "member/loginSuccess";
		}
		
	}
}

