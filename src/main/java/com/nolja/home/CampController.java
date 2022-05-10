package com.nolja.home;

import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nolja.home.dao.CampDao;
import com.nolja.home.dto.Camp;
import com.nolja.home.dto.User;

@Controller
@RequestMapping("camp")
public class CampController {

	private static final Logger logger = LoggerFactory.getLogger(CampController.class);
	
	// 캠핑장 카테고리 화면
	@RequestMapping(value = "/categori", method = RequestMethod.GET)
	public String categori(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		return "camp/campCategori";
	}
	
	// 캠핑장 리스트 화면
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Locale locale, Model model, HttpServletRequest request) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		int page = Integer.parseInt(request.getParameter("page"));
		String query = request.getParameter("query");  // 캠핑장 이름
		String doo = request.getParameter("doo");  // 캠핑징 도 
		String si = request.getParameter("si");  // 캠핑장 시
		String thema = request.getParameter("thema");  // 캠핑장 테마
		String elec = request.getParameter("elec");  // 전기시설
		String internet = request.getParameter("internet");  // 무선인터넷
		String wood = request.getParameter("wood");  // 장작
		String water = request.getParameter("water");  // 온수
		String pool = request.getParameter("pool");  // 수영장
		String playground = request.getParameter("playground");  // 놀이터
		String walk = request.getParameter("walk");  // 산책로
		String ground = request.getParameter("ground");  // 운동장
		String workout = request.getParameter("workout");  // 운동시설
		String mart = request.getParameter("mart");  // 마트.편의점
		String tram = request.getParameter("tram");  // 트렘폴린
					
		if (query == null) query = "";
		if (doo == null) doo = "";
		if (si == null) si = "";
		if (thema == null) thema = "";
		
		CampDao listDao = CampDao.getListDao();
		// 캠핑장 검색
		ArrayList<Camp> result = listDao.CampList(page, query, doo, thema, elec, internet, wood, water, pool, playground, walk, ground, workout, mart, tram);
	
		// 캠핑장 수
		int listCount = listDao.CampCount(query, doo, thema, elec, internet, wood, water, pool, playground, walk, ground, workout, mart, tram);
				
		// 캠핑장 페이지 수
		int lastPage = (int) Math.ceil(listCount / 6.0);	
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("User");
		
		if (user != null) {
			String steam = user.getUserSteaming();
			String[] steaming = steam.split(" ");
			model.addAttribute("userSteaming", steaming);
		}
		
		model.addAttribute("campLists", result);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("listCount", listCount);
		
		return "camp/campList";
	}
	
	// 캠핑장 세부정보 화면
	@RequestMapping(value = "/detail/{contentId}", method = RequestMethod.GET)
	public String detail(Locale locale, Model model, @PathVariable String contentId) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		CampDao listDao = CampDao.getListDao();
		Camp result = listDao.campDetail(contentId);
		if (result.getSbrsCl() != null) {
			String[] arr = result.getSbrsCl().split(",");			
			model.addAttribute("sbrsCl", arr);
		}
		model.addAttribute("campList", result);
		
		return "camp/campDetail";
	}

}
