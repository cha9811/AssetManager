package com.study.assetmanager;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Description;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.study.report.ReportService;
import com.study.report.ReportVO;

@Service
public class AssetService {

	@Autowired
	AssetDAOImpl assetDAOImpl;

	@Autowired
	ReportService reportService;

	public List<AssetDTO> AssetList() throws Exception {
		List<AssetDTO> allAssets = new ArrayList<AssetDTO>();
		allAssets = assetDAOImpl.getAssetList();
		for (AssetDTO dto : allAssets) {

			System.out.println("dto 객체 "+dto.getAsset_acquisition_date());
			System.out.println("dto 객체 "+dto.getFormattedAssetAcquisitionDate());
		    dto.convertAndSetAssetAcquisitionDate();
		    dto.convertAndSetAssetReturnDate();
		    dto.convertAndSetAssetDisbursementDate();

//			dto.getFormattedDate(dto.getAssetAcquisitionDate());
//			dto.getFormattedDate(dto.getAssetReturnDate());
//			dto.getFormattedDate(dto.getAssetDisbursementDate());
//			
			System.out.println("변경후 dto 객체 "+dto.getAsset_acquisition_date());
			System.out.println("변경후 dto 객체 "+dto.getFormattedAssetAcquisitionDate());
		}
		return allAssets;
	}

	public List<AssetDTO> NewAssetList() throws Exception {
		List<AssetDTO> allAssets = new ArrayList<AssetDTO>();
		allAssets = assetDAOImpl.getNewAssetList();
		for (AssetDTO dto : allAssets) {
			dto.convertAndSetAssetAcquisitionDate();
//			dto.getFormattedAssetAcquisitionDate(dto.getAssetAcquisitionDate());

		}
		return allAssets;
	}

	public List<AssetDTO> DeletedAssetList() throws Exception {
		List<AssetDTO> allAssets = new ArrayList<AssetDTO>();
		allAssets = assetDAOImpl.getSoftDeletedAssetList();
		for (AssetDTO dto : allAssets) {
			dto.convertAndSetAssetAcquisitionDate();
//			dto.getFormattedAssetAcquisitionDate(dto.getAssetAcquisitionDate());
			dto.getFormattedAssetAcquisitionDate();

		}
		return allAssets;
	}

	@Description("자산 전체 업데이트 // 1 - 생성, 2 - 변동, 3 - 삭제")
	@Transactional
	public void AssetUpdate(AssetVO vo, Principal principal) throws Exception {
		Date acquisition_date = vo.getAsset_acquisition_date();
		Date disbursement_date = vo.getAsset_disbursement_date();
		Date return_date = vo.getAsset_return_date();

		vo.setAsset_acquisition_date(acquisition_date);
		vo.setAsset_disbursement_date(disbursement_date);
		vo.setAsset_return_date(return_date);
		assetDAOImpl.updateAsset(vo);

		ReportVO reportVO = new ReportVO();
		String asset_name = vo.getAsset_name();

		String username = principal.getName();
		boolean confirm_num = vo.isAsset_deleted();
		String status = "";
		String content = "";

		if (confirm_num == false) {
			status = "삭제 기록" + vo.getAsset_description();
			content = asset_name + "이" + vo.getAsset_use_department() + "팀의" + vo.getAsset_use_member_name()
					+ "님에게서 회수하었습니다.";

		}

		// 기존과 동일할경우
		if (confirm_num == true) {
			status = "새로운 변동사항" + vo.getAsset_description();
			if(vo.getAsset_disbursement_date() != null) {
			content = asset_name + "이(가)" + vo.getAsset_use_member_name()+"("+ vo.getAsset_use_department() 
				+ ")님에게 할당되었습니다.";
			}
		}

		if (vo.getAsset_id() < 1) {
			status = "새로운 자산 등록" + vo.getAsset_description();
			content = asset_name + "이(가) 새롭게 추가되었습니다.";

		}


		// 리포트 업데이트
		String report_title = status;
		reportVO.setReport_content(vo.getAsset_description());
		reportVO.setSerial_number(vo.getSerial_number());
		reportVO.setReport_title(report_title);
		reportVO.setMember_name(username);
		reportVO.setReport_level("1");
		reportVO.setReport_content(content);

		reportService.makeReportsByAssetUpdate(reportVO);

	}

	public void AssetInsert(AssetVO vo, Principal principal) throws Exception {

		String asset_name = vo.getAsset_name();
		String report_title = "새로운 자산 등록";
		String content = asset_name + "이 새롭게 추가되었습니다.";
		String username = principal.getName();

		ReportVO reportVO = new ReportVO();

		reportVO.setReport_content(vo.getAsset_description());

		if (vo.getAsset_use_member_name() == null || vo.getAsset_acquisition_date() == null) {
			reportVO.setReport_level("1");

		}
		if (vo.getAsset_use_member_name() != null && vo.getAsset_acquisition_date() != null) {
			reportVO.setReport_level("2");

		}
		reportVO.setReport_title(report_title);
		reportVO.setMember_name(username);
		reportVO.setSerial_number(vo.getSerial_number());
		reportVO.setReport_content(content);
		reportService.makeReportsByAssetUpdate(reportVO);
		assetDAOImpl.createAsset(vo);
	}

	public AssetVO getAssetByID(int id) throws Exception {
		AssetVO savedAssetVO = assetDAOImpl.getAssetDetail(id);
		return savedAssetVO;
	}

	public SimpleDateFormat Casting_DATE_to_SimpleDateFormat(String goodday) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf;
	}

	public String dateDownCasting(String goodday) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
		LocalDate date = LocalDate.parse(goodday, formatter);

		String dateForDatabase = date.format(DateTimeFormatter.ISO_LOCAL_DATE);
		return dateForDatabase;
	}

	public boolean areAssetsEqual(AssetVO asset1, AssetVO asset2) {
		if (asset1 == asset2)
			return true;
		if (asset1 == null || asset2 == null)
			return false;
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String date1 = asset1.getAsset_acquisition_date() != null
				? dateFormat.format(asset1.getAsset_acquisition_date())
				: null;
		String date2 = asset2.getAsset_acquisition_date() != null
				? dateFormat.format(asset2.getAsset_acquisition_date())
				: null;

		return asset1.getAsset_id() == asset2.getAsset_id()
				&& Objects.equals(asset1.getAsset_category(), asset2.getAsset_category())
				&& Objects.equals(asset1.getAsset_major_category(), asset2.getAsset_major_category())
				&& Objects.equals(asset1.getAsset_middle_category(), asset2.getAsset_middle_category())
				&& Objects.equals(asset1.getAsset_sub_category(), asset2.getAsset_sub_category())
				&& Objects.equals(asset1.getAsset_name(), asset2.getAsset_name())
				&& Objects.equals(asset1.getSerial_number(), asset2.getSerial_number())
				&& Objects.equals(asset1.getAsset_mac_address(), asset2.getAsset_mac_address())
				&& Objects.equals(asset1.getAsset_number(), asset2.getAsset_number())
				&& Objects.equals(asset1.getAsset_local(), asset2.getAsset_local())
				&& Objects.equals(asset1.getAsset_use_department(), asset2.getAsset_use_department())
				&& Objects.equals(asset1.getAsset_use_member_name(), asset2.getAsset_use_member_name())
				&& Objects.equals(asset1.getAsset_LDAP(), asset2.getAsset_LDAP())
				&& Objects.equals(asset1.getAsset_price(), asset2.getAsset_price()) && Objects.equals(date1, date2) // 날짜만
				&& Objects.equals(asset1.getAsset_disbursement_date(), asset2.getAsset_disbursement_date())
				&& Objects.equals(asset1.getAsset_return_date(), asset2.getAsset_return_date())
				&& Objects.equals(asset1.getAsset_description(), asset2.getAsset_description())
				&& asset1.isAsset_deleted() == asset2.isAsset_deleted();

	}
}