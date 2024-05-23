package com.study.report;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReportDAOImpl implements ReportDAO {

	@Autowired
	SqlSessionTemplate reportSST;

	@Override
	public List<ReportVO> Allreport() {
		return reportSST.selectList("REPORT.GET_REPORT_LIST");
	}

	@Override
	public List<ReportVO> getPeriodicData(LocalDate currentDate, int monthsGap) {
	    Map<String, Object> params = new HashMap<>();
	    monthsGap = monthsGap * -1;
	    LocalDate startDate = currentDate.minusMonths(1); // 현재 날짜로부터 한 달 전으로 설정
	    LocalDate endDate = currentDate; // endDate를 현재 날짜로 설정

	    params.put("startDate", startDate);
	    params.put("endDate", endDate); // 계산된 endDate도 파라미터에 추가
	    System.out.println(params);
	    return reportSST.selectList("REPORT.GET_REPORT_LIST_BY_DATE", params);
	}
	
	@Override
	public List<ReportVO> getReportByWord(String text){
		return reportSST.selectList("REPORT.GET_REPORT_LIST");
	}
	
	@Override
	public int insertReport(ReportVO reportvo){
		System.out.println("리포트 삽입 : "+reportvo);
		return reportSST.insert("REPORT.INSERT_REPORT",reportvo);
	}
	
	@Override
	public List<ReportVO> getReportDesc(int id){
		return reportSST.selectList("REPORT.GET_REPORT_LIST_BY_ID");
	}

	@Override
	public List<ReportVO> getReportDetail(String id) {
		return reportSST.selectList("REPORT.GET_REPORT_DETAIL_BY_ID",id);
	}

	@Override
	public List<ReportVO> getReportDetailByAssetName(String asset_name) {
		return reportSST.selectList("REPORT.GET_REPORT_DETAIL_BY_ASSET_NAME",asset_name);
	}
	

}
