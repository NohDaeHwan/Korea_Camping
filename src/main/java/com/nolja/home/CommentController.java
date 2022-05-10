package com.nolja.home;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nolja.home.dao.CommentDao;
import com.nolja.home.dto.User;

@Controller
public class CommentController {
	
	// 게시판 댓글 등록
	// @ResponseBody를 사용하면 view 파일을 탐색하는 것이 아니고 return 되는 값이 반환한다.
	@RequestMapping(value = "comment.do", method = RequestMethod.POST)
	@ResponseBody
	public String comment(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String comment = request.getParameter("comment");
		int boardId = Integer.parseInt(request.getParameter("boardId"));
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("User");
		
		if (user != null) {
			CommentDao commentDao = CommentDao.getCommentDao();
			commentDao.createComment(boardId, user.getId(), comment);
			return "{\"command\":\"로그인 성공\", \"userId\":\""+user.getUserId()+"\"}";
		} else {
			return "{\"command\":\"로그인 안됨\"}";
		}		
	}
}
