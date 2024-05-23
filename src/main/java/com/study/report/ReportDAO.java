package com.study.report;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

public interface ReportDAO {


	public List<ReportVO> Allreport();
	public List<ReportVO> getReportByWord(String text);
	public List<ReportVO> getPeriodicData(LocalDate startDate, int gap);
	public List<ReportVO> getReportDesc(int id);
	public List<ReportVO> getReportDetail(String id);
	public int insertReport(ReportVO reportvo);
	public List<ReportVO> getReportDetailByAssetName(String asset_name);

}
