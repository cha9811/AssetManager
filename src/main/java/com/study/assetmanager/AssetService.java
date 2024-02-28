package com.study.assetmanager;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AssetService {
	
	@Autowired
	AssetDAOImpl assetDAOImpl;
	
	public List<AssetVO> AssetList() throws Exception{ 
		List<AssetVO> allAssets = new ArrayList<AssetVO>();
		allAssets = assetDAOImpl.getAssetList();
		System.out.println(allAssets);
		return allAssets;
	}
}
