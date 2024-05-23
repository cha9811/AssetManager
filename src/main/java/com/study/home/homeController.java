package com.study.home;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.assetmanager.AssetDTO;
import com.study.assetmanager.AssetService;
import com.study.assetmanager.AssetVO;
import com.study.chatting.ChattingRoomService;
import com.study.chatting.ChattingRoomVO;
import com.study.member.MemberService;
import com.study.member.MemberVO;
import com.study.report.ReportService;
import com.study.report.ReportVO;

@Controller
public class homeController {

	@Autowired
	MemberService memberService;

	@Autowired
	AssetService assetservice;

	@Autowired
	ReportService reportService;

	@Autowired
	HomeService homeService;

	@Autowired
	ChattingRoomService chattingRoomService;

	
	@RequestMapping(value = "/home")
	public String home(Model model, Authentication authentication) throws Exception {
		// 전체 자산 수 출력
		List<AssetDTO> assetList = assetservice.AssetList();
		int listSize = assetList.size(); // 리스트의 크기(항목 수)를 저장
		model.addAttribute("listSize", listSize); // listSize를 모델에 추가
		// 신규 자산수 확인
		List<AssetDTO> newAssetList = assetservice.NewAssetList();
		int newAssetSize = newAssetList.size();
		model.addAttribute("newAssetSize", newAssetSize);

		// 전체 인원 숫자 확인
		int memberCount = memberService.memberCount();
		model.addAttribute("memberCount", memberCount); // listSize를 모델에 추가
		String username = authentication.getName();
//		memberIdw
		// 로그인 정보출력
		MemberVO memberInfo = memberService.findByUsername(username); // 사용자 정보 조회
		model.addAttribute("memberAttendance", memberInfo.getMember_attendance());

		LocalDate today = LocalDate.now(); // 오늘 날짜를 가져옴
		LocalDate date = today; // 1달 이전
		List<ReportVO> reportlist = reportService.getReportsByMonth(date, 0);
		int reportCount = reportlist.size();
		model.addAttribute("reportCount", reportCount);
//		String defaultGraphType = "bar";
		int member_id = memberInfo.getMember_id();
		List<ChattingRoomVO> roomlist = chattingRoomService.cahttingRoomupList(member_id);

		boolean messageAlert = false;
		for(ChattingRoomVO chattingroomlist : roomlist) {
			if(chattingroomlist.getUnreadCount()>0) {
				messageAlert = true;
				break;
			}
		}
		
		model.addAttribute("messageAlert", messageAlert);
		model.addAttribute("memberInfo", memberInfo);

		return "/home";
	}

	@GetMapping("/workStatus")
	public String workStatus(Model model) {
		// 데이터 조회 로직 (임시 데이터 예시)
		int newComers = 1; // 신규 입사자
		int annualLeave = 2; // 연차
		int sickLeave = 3; // 병가
		int present = 4; // 출근
		int businessTrip = 5; // 출장

		// 모델에 데이터 추가
		model.addAttribute("data1", newComers);
		model.addAttribute("data2", annualLeave);
		model.addAttribute("data3", sickLeave);
		model.addAttribute("data4", present);
		model.addAttribute("data5", businessTrip);

		return "workStatus"; // JSP 파일 이름
	}

//	@GetMapping("/graphData")
//	@ResponseBody
//	public Map<String, Object> getGraphData(@RequestParam String graphType) {
//		Map<String, Object> data = new HashMap<>();
//		switch (graphType) {
//		case "bar":
//			System.out.println("1");
//			break;
//		case "line":
//			// 선형 그래프 데이터 설정
//			System.out.println("2");
//			break;
//		case "circular":
//			// 직원 출근명표
//			 List<Map<String, Object>> attendanceCount = homeService.getMemberAttendanceCount();
//		     data.put("attendanceCount", attendanceCount);			break;
//		default:
//			// 기본 처리
//			break;
//		}
//		return data;
//	}
//	
//	// Spring Controller 내의 메소드
//	@RequestMapping(value = "/graphData", method = RequestMethod.GET)
//	@ResponseBody
//	public ResponseEntity<?> getMemberAttendanceGraphData(@RequestParam("graphType") String graphType) {
//	    try {
//	        int data = graphService.getAttendanceData(graphType); // DB에서 데이터 조회
//	        return new ResponseEntity<>(data, HttpStatus.OK);
//	    } catch (Exception e) {
//	        return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
//	    }
//	}
	
	 @GetMapping("/graphData")
	 public ResponseEntity<Map<Integer, Long>> getGraphData() {
	        Map<Integer, Long> data = memberService.countByAttendanceType();
	        System.out.println(data);
	        return ResponseEntity.ok(data);
	    }
	 

}
