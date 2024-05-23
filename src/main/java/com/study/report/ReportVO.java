package com.study.report;

import java.util.Date;

public class ReportVO {

	private int report_id;
	private Date report_record_time;
	private String report_content;
	private String report_title;
	private String report_level;
	private String member_name;
	private String serial_number;
	private String asset_description;
	
	public String getAsset_description() {
		return asset_description;
	}
	public void setAsset_description(String asset_description) {
		this.asset_description = asset_description;
	}
	public String getSerial_number() {
		return serial_number;
	}
	public void setSerial_number(String serial_number) {
		this.serial_number = serial_number;
	}
	public int getReport_index_num() {
		return report_index_num;
	}
	public void setReport_index_num(int report_index_num) {
		this.report_index_num = report_index_num;
	}
	private int report_index_num;
	
	
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	private int asset_id;
	
	public String getReport_level() {
		return report_level;
	}
	public void setReport_level(String report_level) {
		this.report_level = report_level;
	}
	public int getReport_id() {
		return report_id;
	}
	public void setReport_id(int report_id) {
		this.report_id = report_id;
	}
	public Date getReport_record_time() {
		return report_record_time;
	}
	public void setReport_record_time(Date report_record_time) {
		this.report_record_time = report_record_time;
	}
	public String getReport_content() {
		return report_content;
	}
	public void setReport_content(String report_content) {
		this.report_content = report_content;
	}
	public String getReport_title() {
		return report_title;
	}
	public void setReport_title(String report_title) {
		this.report_title = report_title;
	}
	
	public int getAsset_id() {
		return asset_id;
	}
	public void setAsset_id(int asset_id) {
		this.asset_id = asset_id;
	}
	@Override
	public String toString() {
		return "ReportVO [report_id=" + report_id + ", report_record_time=" + report_record_time + ", report_content="
				+ report_content + ", report_title=" + report_title + ", report_level=" + report_level
				+ ", member_name=" + member_name + ", serial_number=" + serial_number + ", report_index_num="
				+ report_index_num + ", asset_id=" + asset_id + "]";
	}
	
	
	
}
