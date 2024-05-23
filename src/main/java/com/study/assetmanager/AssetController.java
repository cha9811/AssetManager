package com.study.assetmanager;

import java.security.Principal;
import java.text.DateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.study.report.ReportService;

@Controller
public class AssetController {

	@Autowired
	AssetService assetService;

	@Autowired
	ReportService reportService;

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
		List<AssetDTO> allAssets = assetService.AssetList();
        model.addAttribute("allAssets", allAssets);
        return "/asset/assetList";
        
    }

	@RequestMapping("/newAssetlist")
	public String assetNewPage(Model model) throws Exception {
		List<AssetDTO> allAssets = assetService.NewAssetList();
		model.addAttribute("allAssets", allAssets);
		return "/asset/assetList";
	}

	// jackson 라이브러리 사용

	// @RequestBody가 json을 못받아와서 415에러가 나타났다.
	@PostMapping("/assetUpdate")
	public ResponseEntity<?> assetUpdate(@RequestBody List<AssetVO> assets, Principal principal) throws Exception {
		try {
			for (AssetVO asset : assets) {
				int indexNmber = asset.getAsset_id();
				System.out.println("데이터: "+asset);
				if (indexNmber > 0) {
					AssetVO savedAsset = assetService.getAssetByID(indexNmber);
					System.out.println("데이터가져오기");
					System.out.println("savedAsset : "+savedAsset);
					System.out.println("asset : "+asset);
					if (assetService.areAssetsEqual(savedAsset, asset)) {
						
						System.out.println("데이터 동일함");
						continue;
					}
					
					assetService.AssetUpdate(asset, principal);
					System.out.println("데이터업데이트");
				} else if (asset.isAsset_deleted() == true) {
					assetService.AssetInsert(asset, principal);
					System.out.println("데이터 삽입");
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
		List<AssetDTO> allAssets = assetService.DeletedAssetList();
		model.addAttribute("allAssets", allAssets);
		return "/asset/assetDeleteList";
	}

	@RequestMapping("/assetDetail")
	public String assetDetailPage(Model model) throws Exception {
		return "/asset/assetDetail";
	}

	// 근 7일간 신규 에셋 페이지
	@RequestMapping("/new_asset")
	public String assetDetailPage2(Model model) throws Exception {
		return "/asset/assetDetail";
	}

	@MessageMapping("/editCell")
	@SendTo("/topic/editCellEvent")
	public EditEvent broadcastEditEvent(EditEvent editEvent, Principal principal) {
		// 여기에서 editEvent를 필요에 따라 가공할 수 있습니다.
        editEvent.setUsername(principal.getName()); // getUsername 대신 getName() 메서드를 사용할 수도 있습니다.
		return editEvent;
	}
	
	
}

//메모장 pom.xml 3.1.1에서 5.0.1로 바꿨음