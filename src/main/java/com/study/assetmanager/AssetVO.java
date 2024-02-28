package com.study.assetmanager;


public class AssetVO {
	
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
	private String asset_acquisition_date;
	private String asset_disbursement_date;
	private String asset_return_date;
	private String asset_description;
	private boolean asset_deleted;
	
	
	
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



	public String getAsset_acquisition_date() {
		return asset_acquisition_date;
	}



	public void setAsset_acquisition_date(String asset_acquisition_date) {
		this.asset_acquisition_date = asset_acquisition_date;
	}



	public String getAsset_disbursement_date() {
		return asset_disbursement_date;
	}



	public void setAsset_disbursement_date(String asset_disbursement_date) {
		this.asset_disbursement_date = asset_disbursement_date;
	}



	public String getAsset_return_date() {
		return asset_return_date;
	}



	public void setAsset_return_date(String asset_return_date) {
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
	
	
	
	
}
