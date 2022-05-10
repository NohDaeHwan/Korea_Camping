package com.nolja.home.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.nolja.home.dao.UserDao;
import com.nolja.home.dto.User;

@Service
public class UserCommandIm implements UserCommand {

	@Autowired
	private UserDao userDao;
	
	@Override
	public String userLogin(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String userId = request.getParameter("userId"); 
		String userPassword = request.getParameter("userPassword");
		
		User user = userDao.userLogin(userId, userPassword);
		if (user != null) {
			HttpSession session = request.getSession();
			session.setAttribute("User", user);
			return "redirect:/";
		} else {
			model.addAttribute("fail", "fail");
			return "login";
		}
	}
	
	@Override
	public String userJoin(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String userId = request.getParameter("userId"); 
		String userPassword = request.getParameter("userPassword"); 
		String userEmail = request.getParameter("userEmail"); 
		String userAddress = request.getParameter("userAddress");
		
		int result = userDao.userRegister(userId, userPassword, userEmail, userAddress);
		if (result == 1) {
			return "redirect:/login";
		} else {
			return "redirect:/join";
		}
	}

}
