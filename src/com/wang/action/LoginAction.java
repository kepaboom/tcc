package com.wang.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wang.db.DBManager;
 
public class LoginAction extends HttpServlet {
 
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		this.doPost(request, response);
		out.close();
	}

	 
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		response.setCharacterEncoding("GBK"); 
		PrintWriter out = response.getWriter();
		String username = request.getParameter("username");
		String userpwd = request.getParameter("userpwd");
		String type = request.getParameter("type");

		DBManager dbm = new DBManager();
		
		
		request.getSession().setAttribute("fei", dbm.getSF());
//		System.out.println(type);
//		System.out.println(username);
//		System.out.println(userpwd);
		if (type.equals("用户")) {
			int uid = dbm.loginYH(username, userpwd);
			if (uid > 0) {
				request.getSession().setAttribute("user", username);
				request.getSession().setAttribute("uid", uid+"");
				request.getSession().setAttribute("type", "用户");
				response.sendRedirect("index.jsp");

			} else {
				
				out.println("<script>alert('用户名或密码有误！');window.location.href='login.jsp'</script>");
			}

		} else if (type.equals("管理员")) {
			boolean login = dbm.login(username, userpwd);
			if (login) {

				request.getSession().setAttribute("user", username);
				request.getSession().setAttribute("type", "管理员");
				response.sendRedirect("index.jsp");

			} else {
				out.println("<script>alert('用户名或密码有误！');window.location.href='login.jsp'</script>");
			}
		} else {
			out.println("<script>alert('用户名或密码有误！');window.location.href='login.jsp'</script>");
		}

		out.flush();
		out.close();
	}
 

}
