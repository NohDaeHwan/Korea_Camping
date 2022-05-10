package com.nolja.home;

import java.io.BufferedReader;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nolja.home.command.UserCommandIm;
import com.nolja.home.dao.CampDao;
import com.nolja.home.dao.UserDao;
import com.nolja.home.dto.User;

@Controller
public class UserController {
	
	@Autowired
	private UserCommandIm commandIm;
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
		
	// 로그인 화면
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginDisplay() {
		logger.info("Welcome Nolegaza! Login Display");	
		return "login";
	}
	
	// 회원가입 화면
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerDisplay() {
		logger.info("Welcome Nolegaza! Join Display");	
		return "register";
	}
	
	// User 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Model model, HttpServletRequest request) {
		logger.info("Welcome Nolegaza! Login");

		model.addAttribute("request", request);
		String mv = commandIm.userLogin(model);
		
		return mv;
	}
	
	// User 회원가입
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(Model model, HttpServletRequest request) {
		logger.info("Welcome Nolegaza! Join");	

		model.addAttribute("request", request);
		String mv = commandIm.userJoin(model);
		
		return mv;
	}
	
	// UserId 중복체크
	// @ResponseBody를 사용하면 view 파일을 탐색하는 것이 아니고 return 되는 값이 반환한다.
	@RequestMapping(value = "test.do", method = RequestMethod.POST)
	@ResponseBody
	public String index(HttpServletRequest req, HttpServletResponse res) {
		try {
			BufferedReader br =  req.getReader();
			String userId = br.readLine();
			UserDao userDao = UserDao.getUserDao();
			int result = userDao.userIdCheck(userId);
			if (result == 1) { 
				return "{\"data\":\"이미 등록되어 있는 아이디 입니다.\"}";
			}
		} catch (IOException e) {
			e.printStackTrace();
		}		
		// json 타입의 String 문자를 리턴한다.
		return "{\"data\":\"사용가능한 아이디입니다.\"}";
	}
	
	// User 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		logger.info("Welcome Nolegaza! Logout");	
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/";
	}
	
	// User 로그인 확인
	@RequestMapping(value = "loginCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public String loginCheck(HttpServletRequest request) {
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("User");
			if (user != null) { 
				return "{\"command\":\"로그인 성공\"}";
			} else {
				return "{\"command\":\"로그인 안됨\"}";
			}
	}
	
	// 좋아요 추가
	@RequestMapping(value = "steamingAdd.do", method = RequestMethod.POST)
	@ResponseBody
	public String steamingAdd(HttpServletRequest request) {
			String boardId = request.getParameter("boardId");
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("User");
			
			UserDao userDao = UserDao.getUserDao();
			int result = userDao.steamingAdd(user, boardId);
			
			if (result == 1) { 
				CampDao listDao = CampDao.getListDao();
				listDao.steamingAdd(boardId);
				User user2 = userDao.userSearch(user.getUserId(), user.getUserPassword());
				session.setAttribute("User", user2);
				int steaming = listDao.steamingSearch(boardId);
				return "{\"command\": " + steaming + "}";
			} else {
				return "{\"command\":\"관리자 문의\"}";
			}
	}
	
	// 좋아요 삭제
	@RequestMapping(value = "steamingDelete.do", method = RequestMethod.POST)
	@ResponseBody
	public String steamingDelete(HttpServletRequest request) {
			String boardId = request.getParameter("boardId");
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("User");
			
			UserDao userDao = UserDao.getUserDao();
			int result = userDao.steamingDelete(user, boardId);
			
			if (result == 1) { 
				CampDao listDao = CampDao.getListDao();
				listDao.steamingDelete(boardId);
				User user2 = userDao.userSearch(user.getUserId(), user.getUserPassword());
				session.setAttribute("User", user2);
				int steaming = listDao.steamingSearch(boardId);
				return "{\"command\": "+ steaming +"}";
			} else {
				return "{\"command\":\"관리자 문의\"}";
			}
	}
	
}
