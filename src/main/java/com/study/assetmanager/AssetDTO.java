package com.study.assetmanager;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.context.annotation.Description;

public class AssetDTO {

	private int asset_id;
	private String asset_category;
	private String asset_major_category;
	private String asset_middle_category;
	private String asset_sub_category;
	private String asset_name;
	private String serial_number;
	private String asset_mac_address;
	private String asset_number;
	private String asset_local;
	private String asset_use_department;
	private String asset_use_member_name;
	private String asset_LDAP;
	private String asset_price;
	private Date asset_acquisition_date;
	private Date asset_disbursement_date;
	private Date asset_return_date;
	private String asset_description;
	private boolean asset_deleted;

//	private Date assetAcquisitionDate;
//	private Date assetDisbursementDate;
//	private Date assetReturnDate;

	private String formattedAssetAcquisitionDate;
	private String formattedAssetDisbursementDate;
	private String formattedAssetReturnDate;

	public String getFormattedAssetDisbursementDate() {
		return formattedAssetDisbursementDate;
	}

	public void setFormattedAssetDisbursementDate(String formattedAssetDisbursementDate) {
		this.formattedAssetDisbursementDate = formattedAssetDisbursementDate;
	}

	public String getFormattedAssetReturnDate() {
		return formattedAssetReturnDate;
	}

	public void setFormattedAssetReturnDate(String formattedAssetReturnDate) {
		this.formattedAssetReturnDate = formattedAssetReturnDate;
	}

	public String getFormattedAssetAcquisitionDate() {
		return formattedAssetAcquisitionDate;
	}

	public void setFormattedAssetAcquisitionDate(String formattedAssetAcquisitionDate) {
		this.formattedAssetAcquisitionDate = formattedAssetAcquisitionDate;
	}

	public void convertAndSetAssetDisbursementDate() {
        formattedAssetDisbursementDate = getFormattedDate(asset_disbursement_date);

	}

	public void convertAndSetAssetAcquisitionDate() {
        formattedAssetAcquisitionDate = getFormattedDate(asset_acquisition_date);

	}

	public void convertAndSetAssetReturnDate() {
        formattedAssetReturnDate = getFormattedDate(asset_return_date);

	}

//	public Date getAssetAcquisitionDate() {
//		return assetAcquisitionDate;
//	}
//
//	public void setAssetAcquisitionDate(Date assetAcquisitionDate) {
//		this.assetAcquisitionDate = assetAcquisitionDate;
//	}
//
//	public Date getAssetDisbursementDate() {
//		return assetDisbursementDate;
//	}
//
//	public void setAssetDisbursementDate(Date assetDisbursementDate) {
//		this.assetDisbursementDate = assetDisbursementDate;
//	}
//
//	public Date getAssetReturnDate() {
//		return assetReturnDate;
//	}
//
//	public void setAssetReturnDate(Date assetReturnDate) {
//		this.assetReturnDate = assetReturnDate;
//	}

	public int getAsset_id() {
		return asset_id;
	}

	public void setAsset_id(int asset_id) {
		this.asset_id = asset_id;
	}

	public String getAsset_category() {
		return asset_category;
	}

	public void setAsset_category(String asset_category) {
		this.asset_category = asset_category;
	}

	public String getAsset_major_category() {
		return asset_major_category;
	}

	public void setAsset_major_category(String asset_major_category) {
		this.asset_major_category = asset_major_category;
	}

	public String getAsset_middle_category() {
		return asset_middle_category;
	}

	public void setAsset_middle_category(String asset_middle_category) {
		this.asset_middle_category = asset_middle_category;
	}

	public String getAsset_sub_category() {
		return asset_sub_category;
	}

	public void setAsset_sub_category(String asset_sub_category) {
		this.asset_sub_category = asset_sub_category;
	}

	public String getAsset_name() {
		return asset_name;
	}

	public void setAsset_name(String asset_name) {
		this.asset_name = asset_name;
	}

	public String getSerial_number() {
		return serial_number;
	}

	public void setSerial_number(String serial_number) {
		this.serial_number = serial_number;
	}

	public String getAsset_mac_address() {
		return asset_mac_address;
	}

	public void setAsset_mac_address(String asset_mac_address) {
		this.asset_mac_address = asset_mac_address;
	}

	public String getAsset_number() {
		return asset_number;
	}

	public void setAsset_number(String asset_number) {
		this.asset_number = asset_number;
	}

	public String getAsset_local() {
		return asset_local;
	}

	public void setAsset_local(String asset_local) {
		this.asset_local = asset_local;
	}

	public String getAsset_use_department() {
		return asset_use_department;
	}

	public void setAsset_use_department(String asset_use_department) {
		this.asset_use_department = asset_use_department;
	}

	public String getAsset_use_member_name() {
		return asset_use_member_name;
	}

	public void setAsset_use_member_name(String asset_use_member_name) {
		this.asset_use_member_name = asset_use_member_name;
	}

	public String getAsset_LDAP() {
		return asset_LDAP;
	}

	public void setAsset_LDAP(String asset_LDAP) {
		this.asset_LDAP = asset_LDAP;
	}

	public String getAsset_price() {
		return asset_price;
	}

	public void setAsset_price(String asset_price) {
		this.asset_price = asset_price;
	}

	public Date getAsset_acquisition_date() {
		return asset_acquisition_date;
	}

	public void setAsset_acquisition_date(Date asset_acquisition_date) {
		this.asset_acquisition_date = asset_acquisition_date;
	}

	public Date getAsset_disbursement_date() {
		return asset_disbursement_date;
	}

	public void setAsset_disbursement_date(Date asset_disbursement_date) {
		this.asset_disbursement_date = asset_disbursement_date;
	}

	public Date getAsset_return_date() {
		return asset_return_date;
	}

	public void setAsset_return_date(Date asset_return_date) {
		this.asset_return_date = asset_return_date;
	}

	public String getAsset_description() {
		return asset_description;
	}

	public void setAsset_description(String asset_description) {
		this.asset_description = asset_description;
	}

	public boolean isAsset_deleted() {
		return asset_deleted;
	}

	public void setAsset_deleted(boolean asset_deleted) {
		this.asset_deleted = asset_deleted;
	}

	@Override
	public String toString() {
		return "AssetVO [asset_id=" + asset_id + ", asset_category=" + asset_category + ", asset_major_category="
				+ asset_major_category + ", asset_middle_category=" + asset_middle_category + ", asset_sub_category="
				+ asset_sub_category + ", asset_name=" + asset_name + ", serial_number=" + serial_number
				+ ", asset_mac_address=" + asset_mac_address + ", asset_number=" + asset_number + ", asset_local="
				+ asset_local + ", asset_use_department=" + asset_use_department + ", asset_use_member_name="
				+ asset_use_member_name + ", asset_LDAP=" + asset_LDAP + ", asset_price=" + asset_price
				+ ", asset_acquisition_date=" + asset_acquisition_date + ", asset_disbursement_date="
				+ asset_disbursement_date + ", asset_return_date=" + asset_return_date + ", asset_description="
				+ asset_description + ", asset_deleted=" + asset_deleted + "]";
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null || getClass() != obj.getClass())
			return false;
		AssetDTO assetVO = (AssetDTO) obj;
		return asset_id == assetVO.asset_id;
	}

	@Description("날짜를 포맷된 문자열로 변환하는 메서드")
	public String getFormattedDate(Date date) {
		if (date != null) {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			return formatter.format(date);
		}
		return "";
	}

}
