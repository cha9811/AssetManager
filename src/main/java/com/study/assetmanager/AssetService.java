package com.study.assetmanager;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;

@Service
public class AssetService {
	
	@Autowired
	AssetDAOImpl assetDAOImpl;
	
	public List<AssetVO> AssetList() throws Exception{ 
		List<AssetVO> allAssets = new ArrayList<AssetVO>();
		allAssets = assetDAOImpl.getAssetList();
		return allAssets;
	}
	
	public List<AssetVO> DeletedAssetList() throws Exception{ 
		List<AssetVO> allAssets = new ArrayList<AssetVO>();
		allAssets = assetDAOImpl.getSoftDeletedAssetList();
		return allAssets;
	}
	
	//1. 전체를 리스트로 가져온다
	//2. 반복한다???
	public List<AssetVO> AssetUpdateAll(@ModelAttribute AssetVO assetVO){
		List<AssetVO> allAssets = new ArrayList<AssetVO>();
//		allAssets = assetDAOImpl.updateAssetAll(allAssets);
		return allAssets;
	}
	
	public AssetVO AssetInsert() throws Exception{ 
//		List<AssetVO> allAssets = new ArrayList<AssetVO>();
		allAssets = assetDAOImpl.getAssetList();
		return allAssets;
	}
	
}
