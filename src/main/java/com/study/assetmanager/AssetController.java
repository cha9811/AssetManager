package com.study.assetmanager;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;




@Controller
public class AssetController {

	@Autowired
	AssetService assetService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);		
		String formattedDate = dateFormat.format(date);		
		model.addAttribute("serverTime", formattedDate );		
		return "asset/assetmain";
	}

	@RequestMapping(value = "/assetmanager/", method = RequestMethod.GET)
	public String home2(Locale locale, Model model) {
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);		
		String formattedDate = dateFormat.format(date);		
		model.addAttribute("serverTime", formattedDate);		
		return "asset/assetmain";
	}
	
	@RequestMapping("/assetList")
	public String assetList(Model model) throws Exception {
		List<AssetVO> allAssets = assetService.AssetList();
		model.addAttribute("allAssets", allAssets);
		return "asset/assetList";
	}
	
	@RequestMapping("/assetlist")
    public String assetMainPage(Model model) throws Exception {
		System.out.println("나실행");
		List<AssetVO> allAssets = assetService.AssetList();
        model.addAttribute("allAssets", allAssets);
		return "/asset/assetList"; // 실제 경로는 "WEB-INF/views/asset/assetmain.jsp"
    }
}
