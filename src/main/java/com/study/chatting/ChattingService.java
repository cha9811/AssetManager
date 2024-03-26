package com.study.chatting;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;

@Service
public class ChattingService {

	@Autowired
	ChattingDAOImpl chattingDAOImpl;

	public List<ChattingRoomVO> ChattingHomeList() throws Exception {
		List<ChattingRoomVO> allAssets = new ArrayList<ChattingRoomVO>();
		
		allAssets = chattingDAOImpl.getAssetList();
		return allAssets;
	}
//
//	public List<AssetVO> DeletedAssetList() throws Exception {
//		List<AssetVO> allAssets = new ArrayList<AssetVO>();
//		allAssets = assetDAOImpl.getSoftDeletedAssetList();
//		return allAssets;
//	}
//
//	public void AssetUpdate(AssetVO vo) throws Exception {
//		String acquisition_date = vo.getAsset_acquisition_date();
//		String disbursement_date = vo.getAsset_disbursement_date();
//		String return_date = vo.getAsset_return_date();
//
//		vo.setAsset_acquisition_date(dateCasting(acquisition_date));
//		vo.setAsset_disbursement_date(dateCasting(disbursement_date));
//		vo.setAsset_return_date(dateCasting(return_date));
//		assetDAOImpl.updateAsset(vo);
//	}
//
//	public void AssetInsert(AssetVO vo) throws Exception {
//		assetDAOImpl.createAsset(vo);
//
//	}
//
//	public String dateCasting(String goodday) {
//		try {
//			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
//			LocalDate date = LocalDate.parse(goodday, formatter);
//			String dateForDatabase = date.format(DateTimeFormatter.ISO_LOCAL_DATE);
//			return dateForDatabase;
//		} catch (DateTimeParseException e) {
//			return goodday;
//		}
//	}
//
//	public String dateDownCasting(String goodday) {
//		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
//		LocalDate date = LocalDate.parse(goodday, formatter);
//
//		String dateForDatabase = date.format(DateTimeFormatter.ISO_LOCAL_DATE);
//		return dateForDatabase;
//	}

}
