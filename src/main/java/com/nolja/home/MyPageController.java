package com.nolja.home;

import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nolja.home.dao.CampDao;
import com.nolja.home.dto.Camp;
import com.nolja.home.dto.User;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	// MyPage 화면
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String mypage(Locale locale, Model model, HttpServletRequest request) {
		logger.info("Welcome home! The client locale is {}.", locale);	
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("User");
		
		String steam = user.getUserSteaming();
		String[] steaming = steam.split(" ");
		
		CampDao listDao = CampDao.getListDao();
		ArrayList<Camp> campLists = listDao.campSteam(steaming);
		
		model.addAttribute("campLists", campLists);
		
		return "user/mypage";
	}	
	
}
