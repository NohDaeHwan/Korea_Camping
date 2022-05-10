package com.nolja.home.config;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Pattern;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UrlConfig implements Filter {

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;
		
		// 한글 설정
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String rex = "^[0-9]*$";
		// 로그인 확인
		HttpSession session = request.getSession();
		if (request.getRequestURI().equals("/home/board/create_board") || request.getRequestURI().equals("/home/mypage/main") ||
				request.getRequestURI().equals("/home/board/create") || Pattern.matches(rex, request.getRequestURI())) {
			if (session.getAttribute("User") != null) {
				chain.doFilter(request, response);
			} else {
				PrintWriter out = response.getWriter();
				out.print("<script>");
				out.print("alert('로그인을 해주세요');");
				out.print("window.location.href = '/home/login'");
				out.print("</script>");
				out.flush();
			}
		} else {
			chain.doFilter(request, response);
		}
	}
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {}

	@Override
	public void destroy() {}
}
