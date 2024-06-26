package com.study.assetmanager;

import java.lang.reflect.Executable;
import java.util.List;

public interface AssetDAO {

		public List<AssetDTO> getAssetList() throws Exception;
		public AssetVO getAssetDetail(int i) throws Exception;
		public int createAsset(AssetVO vo) throws Exception;
		public int updateAsset(AssetVO vo) throws Exception;
		public List<AssetDTO> getSoftDeletedAssetList() throws Exception;		
		public int softDeleteAssetRollBack(int i) throws Exception;
		public int softDeleteAsset(int i) throws Exception;
		public int hardDeleteAsset(int i) throws Exception;
		public List<AssetDTO> getNewAssetList() throws Exception;
}