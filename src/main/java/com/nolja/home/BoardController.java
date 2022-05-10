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

import com.nolja.home.dao.BoardDao;
import com.nolja.home.dao.CommentDao;
import com.nolja.home.dto.Board;
import com.nolja.home.dto.Comment;
import com.nolja.home.dto.User;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	// 게시판 리스트 화면
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String board(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		BoardDao boardDao = BoardDao.getBoardDao();
		ArrayList<Board> boards = boardDao.getBoardList();
		
		model.addAttribute("boardLists", boards);
		return "board/boardList";	
	}
	
	// 게시판 세부정보 화면
	@RequestMapping(value = "/detail/{boardId}", method = RequestMethod.GET)
	public String detail(Locale locale, Model model, @PathVariable int boardId) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		CommentDao commentDao = CommentDao.getCommentDao();
		ArrayList<Comment> comments = commentDao.getBoardComment(boardId);
				
		BoardDao boardDao = BoardDao.getBoardDao();
		Board board = boardDao.searchBoard(boardId);
		boardDao.viewCount(boardId);

		model.addAttribute("board", board);
		model.addAttribute("comments", comments);
		return "board/boardDetail";
	}
	
	// 게시판 글쓰기 화면
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String create(Locale locale, Model model, HttpServletRequest request) {
		logger.info("Welcome home! The client locale is {}.", locale);		

		return "board/boardCreate";
	}
	
	// 게시판 글쓰기
	@RequestMapping(value = "/create_board", method = RequestMethod.POST)
	public String create_board(Locale locale, Model model, HttpServletRequest request) {
		logger.info("Welcome home! The client locale is {}.", locale);
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("User");

		BoardDao boardDao = BoardDao.getBoardDao();
		int result = boardDao.createBoard(user.getId(), title, content);
		if (result == 1) {
			return "redirect:/board/list";
		} else {
			return "redirect:/board/create";
		}	
	}
	
	// 게시판 수정 화면
	@RequestMapping(value = "/modify/{boardId}", method = RequestMethod.GET)
	public String modify(Locale locale, Model model, HttpServletRequest request, @PathVariable int boardId) {
		logger.info("Welcome home! The client locale is {}.", locale);	
		
		BoardDao boardDao = BoardDao.getBoardDao();
		Board board = boardDao.searchBoard(boardId);

		model.addAttribute("board", board);
		return "board/boardModify";
	}
	
	// 게시판 수정
	@RequestMapping(value = "/modify_board/{boardId}", method = RequestMethod.POST)
	public String modify_board(Locale locale, Model model, HttpServletRequest request, @PathVariable int boardId) {
		logger.info("Welcome home! The client locale is {}.", locale);
		String title = request.getParameter("title");
		String content = request.getParameter("content");

		BoardDao boardDao = BoardDao.getBoardDao();             
		int result = boardDao.modifyBoard(boardId, title, content);
		
		CommentDao commentDao = CommentDao.getCommentDao();
		commentDao.deleteBoardComment(boardId);
		
		if (result == 1) {
			return "redirect:/board/detail/"+boardId;                            
		} else {
			return "redirect:/board/modify/"+boardId;
		}	
	}
	
	// 게시판 삭제
	@RequestMapping(value = "/delete/{boardId}", method = RequestMethod.GET)
	public String delete_board(Locale locale, Model model, HttpServletRequest request, @PathVariable int boardId) {
		logger.info("Welcome home! The client locale is {}.", locale);

		BoardDao boardDao = BoardDao.getBoardDao();             
		int result = boardDao.deleteBoard(boardId);
		if (result == 1) {
			return "redirect:/board/list";                            
		} else {
			return "redirect:/board/detail/"+boardId;
		}	
	}
}
