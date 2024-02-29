package com.study.assetmanager;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
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
		model.addAttribute("serverTime", formattedDate);
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

	@RequestMapping("/assetlist")
	public String assetMainPage(Model model) throws Exception {
		System.out.println("나실행");
		List<AssetVO> allAssets = assetService.AssetList();
		model.addAttribute("allAssets", allAssets);
		return "/asset/assetList"; // 실제 경로는 "WEB-INF/views/asset/assetmain.jsp"
	}

	@RequestMapping("/assetUpdate")
//	public String assetUpdate(HttpServletRequest request ,@ModelAttribute AssetVO assetVO) throws Exception {
		public ResponseEntity<?> assetUpdate(@RequestBody List<AssetVO> assets) {
		for (AssetVO asset : assets) {
		    if ((Integer)asset.getAsset_id() == null) {
		    	assetService.
		    }
		    // 추가적인 데이터 검증 로직...
		}
		return ResponseEntity.ok().build();
//		assetService.AssetUpdateAll(assetVO);
		
//		return "/asset/assetList";
	}

	@RequestMapping("/deletedassetlist")
	public String deletedPage(Model model) throws Exception {
		List<AssetVO> allAssets = assetService.DeletedAssetList();
		model.addAttribute("allAssets", allAssets);
		return "/asset/assetDeleteList";
	}
}
//메모장 pom.xml 3.1.1에서 5.0.1로 바꿨음