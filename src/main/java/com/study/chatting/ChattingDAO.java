package com.study.chatting;

import java.lang.reflect.Executable;
import java.util.List;

public interface ChattingDAO {

		public List<ChattingVO> getChattingList();
		
		public int createChatting();
		public int delteChatting();
		public int updateChatting();
		public int makeChattingRoom();
		public int deleteChattingRoom();
		public int updateChattingRoom();
		
//		public List<AssetVO> getAssetList() throws Exception;
//		public AssetVO getAssetDetail(int i) throws Exception;
//		public int createAsset(AssetVO vo) throws Exception;
//		public int updateAsset(AssetVO vo) throws Exception;
//		public List<AssetVO> getSoftDeletedAssetList() throws Exception;		
//		public int softDeleteAssetRollBack(int i) throws Exception;
//		public int softDeleteAsset(int i) throws Exception;
//		public int hardDeleteAsset(int i) throws Exception;
//		public int updateAssetAll(List<AssetVO> vo) throws Exception;
}