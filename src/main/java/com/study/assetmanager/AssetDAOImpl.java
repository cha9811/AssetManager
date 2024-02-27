package com.study.assetmanager;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class AssetDAOImpl implements AssetDAO{
	
	@Autowired
	SqlSessionTemplate AssetSST;

	@Override
	public List<AssetVO> getAssetList() throws Exception {
		return AssetSST.selectList("AssetSST.GET_ASSET_LIST");
	}

	@Override
	public AssetVO getAssetDetail(int i) throws Exception {
		return AssetSST.selectOne("AssetSST.GET_ASSET_ONE", i);
	}

	@Override
	public int createAsset(AssetVO vo) throws Exception {
		return AssetSST.insert("AssetSST.GET_ASSET_ONE", vo);
	}

	@Override
	public int deleteAsset() throws Exception {
		return 0;
	}

	@Override
	public int updateAsset() throws Exception {
		return 0;
	}

	
}
