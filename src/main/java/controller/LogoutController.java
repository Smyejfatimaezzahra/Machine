package controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import beans.Machine;
import beans.Salle;
import service.SalleService;

@WebServlet(name = "LogoutController", urlPatterns = { "/LogoutController" })
public class LogoutController extends HttpServlet {
	private SalleService ss = new SalleService();

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if(request.getParameter("op").equals("deco")) {
			HttpSession session = request.getSession();
			response.setContentType("application/json");
	         session.invalidate();
	         response.getWriter().write("true");
		}
		 

	}
	 @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        processRequest(request, response);
	    }

	    @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        processRequest(request, response);
	    }
}
