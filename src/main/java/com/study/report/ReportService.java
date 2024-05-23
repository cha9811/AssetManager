package com.study.report;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReportService {

	@Autowired
	private ReportDAOImpl reportDAOImpl;

	public List<ReportVO> getAllReport() {
		List<ReportVO> test = reportDAOImpl.Allreport();
		return test;
	}

	// 특정 월 + 단위수
	public List<ReportVO> getReportsByMonth(LocalDate date, int gap) {
		List<ReportVO> test = reportDAOImpl.getPeriodicData(date, gap);
		return test;
	}

	// 특정 단어 검색
	public List<ReportVO> getReportsByText(String text){
		List<ReportVO> test = reportDAOImpl.getReportByWord(text);
		return test;
	}

	
	//에셋 업	데이트시 데이터 저장시키기
	//작성자, 제품명, 주석 필요
	// 1개 클릭시 생성헀던 데이터를 확인함
	// 해당 번호에 이뤄진걸 보여주기 위해 우선 UUID 또는 같은 중첩된 ID로 가져오기
	//
	public void makeReportsByAssetUpdate(ReportVO reportVO) {
		reportDAOImpl.insertReport(reportVO);
	}
	
	public void makeReportsByAssetInsert(ReportVO reportVO) {
		reportDAOImpl.insertReport(reportVO);
	}
	
	public List<ReportVO> getReportDetail(String id){
		List<ReportVO> reportList = reportDAOImpl.getReportDetail(id); 
		return reportList;
	}
	
	public List<ReportVO> getReportDetailByAssetName(String serial_number){
		List<ReportVO> reportList = reportDAOImpl.getReportDetail(serial_number); 
		return reportList;
	}
	
}
