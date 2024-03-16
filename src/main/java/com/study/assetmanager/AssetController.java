package com.study.assetmanager;

import java.text.DateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AssetController {

	@Autowired
	AssetService assetService;

	private static final Logger logger = LoggerFactory.getLogger(AssetController.class);

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
		List<AssetVO> allAssets = assetService.AssetList();
		model.addAttribute("allAssets", allAssets);
		return "/asset/assetList";
	}

	@PostMapping("/assetUpdate")
	public ResponseEntity<?> assetUpdate(@RequestBody List<AssetVO> assets) throws Exception {
		try {
			for (AssetVO asset : assets) {
				if (asset.getAsset_id() > 0) {
					assetService.AssetUpdate(asset);
				} else {
					assetService.AssetInsert(asset);
				}
			}
			logger.info("Assets updated successfully");
			return ResponseEntity.ok().body(Collections.singletonMap("message", "Assets updated successfully"));
		} catch (Exception e) {
			logger.error("Error updating assets: {}", e.getMessage());
			return ResponseEntity.badRequest().body("Error updating assets:");
		}
	}

	@RequestMapping("/deletedassetlist")
	public String deletedPage(Model model) throws Exception {
		List<AssetVO> allAssets = assetService.DeletedAssetList();
		model.addAttribute("allAssets", allAssets);
		return "/asset/assetDeleteList";
	}
	
	@RequestMapping("/assetDetail")
	public String assetDetailPage(Model model) throws Exception {
//		List<AssetVO> allAssets = assetService.DeletedAssetList();
//		model.addAttribute("allAssets", allAssets);
		return "/asset/assetDetail";
	}
	
}
//메모장 pom.xml 3.1.1에서 5.0.1로 바꿨음