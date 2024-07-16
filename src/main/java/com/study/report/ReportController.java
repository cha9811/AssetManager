package com.study.report;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ReportController {

	@Autowired
	ReportService reportService;

	@RequestMapping(value = "/reportPage")
	public String reportPage(Model model) {
	    LocalDate today = LocalDate.now(); // 오늘 날짜를 가져옴
        LocalDate tomorrow = today.plusDays(1); // 내일 날짜를 가져옴

	    LocalDate date = tomorrow; // 1달 이전
		LocalDate date2 = tomorrow.minusMonths(1); // 1달 전
		LocalDate date3 = tomorrow.minusMonths(2); // 2달 전
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy MM");
        String dateString = date.format(formatter); // 포맷팅된 날짜 문자열
		model.addAttribute("dateString", dateString);

		List<ReportVO> reportList = reportService.getReportsByMonth(date, 0);
		List<ReportVO> reportList2 = reportService.getReportsByMonth(date2, 1);
		List<ReportVO> reportList3 = reportService.getReportsByMonth(date3, 2);
		model.addAttribute("reportList", reportList);
		model.addAttribute("reportList2", reportList2);
		model.addAttribute("reportList3", reportList3);
		System.out.println("초기상태");
		return "/report/reportPage";
	}


	@RequestMapping(value = "reportDetail/{id}")
	public String reportDetailPage(@PathVariable String id, Model model) {
		System.out.println(id);
		List<ReportVO> reportlist = reportService.getReportDetail(id);
		model.addAttribute("reportlist", reportlist);
		
		return "report/reportDetailPage";
	}

	@RequestMapping(value = "aeestReportDetail/{serial_number}")
	 public ResponseEntity<List<ReportVO>> reportDetailByAssetPage(@PathVariable("serial_number") String serialNumber) {
        List<ReportVO> reportlist = reportService.getReportDetailByAssetName(serialNumber);
        System.out.println("실행됨");
        System.out.println(reportlist);
        return ResponseEntity.ok(reportlist); // JSON 형식으로 반환
    }
	
	@PostMapping("/api/reports")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> fetchReports(@RequestBody Map<String, String> payload) {
		String baseDate = payload.get("baseDate");
		
		LocalDate date = LocalDate.parse(baseDate);
		LocalDate date2 = date.minusMonths(1); // 1달 전
		LocalDate date3 = date.minusMonths(2); // 2달 전
		
		List<ReportVO> reportList = reportService.getReportsByMonth(date, 1);
		List<ReportVO> reportList2 = reportService.getReportsByMonth(date2, 1);
		List<ReportVO> reportList3 = reportService.getReportsByMonth(date3, 1);

		Map<String, Object> response = new HashMap<>();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy MM");
        String dateString = date.format(formatter); // 포맷팅된 날짜 문자열    
		    List<Object> reports = new ArrayList<>();
		    reports.add(reportList);
		    reports.add(reportList2);
		    reports.add(reportList3);
	
		    response.put("reports", reports);
		    response.put("dateString", dateString);
		
		    System.out.println("햄버거 : "+reportList);
			
		System.out.println("reportList : "+reportList);
		return ResponseEntity.ok(response);
	}	
}
