package com.study.assetmanager;

import java.lang.reflect.Executable;
import java.util.List;

public interface AssetDAO {

		public List<AssetVO> getAssetList() throws Exception;
		public AssetVO getAssetDetail(int i) throws Exception;
		public int createAsset() throws Exception;
		public int deleteAsset() throws Exception;
		public int updateAsset() throws Exception;
}
