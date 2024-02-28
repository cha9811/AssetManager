package com.study.assetmanager;

import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AssetDAOImpl implements AssetDAO{
	
	@Autowired
	SqlSessionTemplate AssetSST;
	
	@Override
	public List<AssetVO> getAssetList() throws Exception {
		return AssetSST.selectList("ASSET_MAPPER.GET_ASSET_LIST");
	}

	@Override
	public AssetVO getAssetDetail(int i) throws Exception {
		return AssetSST.selectOne("ASSET_MAPPER.GET_ASSET_ONE_BY_ID", i);
	}

	@Override
	public int createAsset(AssetVO vo) throws Exception {
		return AssetSST.insert("ASSET_MAPPER.CREATE_ASSET_ONE", vo);
	}

	@Override
	public int updateAsset(AssetVO vo) throws Exception {
		return AssetSST.update("ASSET_MAPPER.ASSET_INFO_UPDATE", vo);
	}
	
	@Override
	public List<AssetVO> getSoftDeleteAssetList() throws Exception {
		return AssetSST.selectList("ASSET_MAPPER.GET_ASSET_LIST_BY_SOFT_DELETE");
	}

	@Override
	public int softDeleteAssetRollBack(int i) throws Exception {
		return AssetSST.update("ASSET_MAPPER.UPDATE_ASSET_SOFT_DELETE_ROLLBACK", i);
	}

	@Override
	public int softDeleteAsset(int i) throws Exception {
		return AssetSST.update("ASSET_MAPPER.UPDATE_ASSET_SOFT_DELETE", i);
	}

	@Override
	public int hardDeleteAsset(int i) throws Exception {
		return AssetSST.delete("ASSET_MAPPER.DELETE_ASSET_ONE_HARD_DELETE", i);

	}

	
}
