package com.study.home;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.study.assetmanager.AssetService;
import com.study.assetmanager.AssetVO;
import com.study.member.MemberService;

@Controller
public class homeController {

	@Autowired
	MemberService memberService;
	
	@Autowired
	AssetService assetservice;
	

	
	@RequestMapping(value = "/home")
	public String home(Model model) throws Exception {
		List<AssetVO> assetList = assetservice.AssetList();
		int listSize = assetList.size(); // 리스트의 크기(항목 수)를 저장
	    model.addAttribute("listSize", listSize); // listSize를 모델에 추가
	    int memberCount = memberService.memberCount();
	    model.addAttribute("memberCount", memberCount); // listSize를 모델에 추가
	   
		return "/home";
	}

	
	
}
