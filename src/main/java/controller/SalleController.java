package controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import beans.Machine;
import beans.Salle;
import service.SalleService;

@WebServlet(name = "SalleController", urlPatterns = { "/SalleController" })
public class SalleController extends HttpServlet {
	private SalleService ss = new SalleService();

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("op") != null) {
			if (request.getParameter("op").equals("load")) {
				response.setContentType("application/json");
				List<Salle> salles = ss.findAll();
				Gson json = new Gson();
				response.getWriter().write(json.toJson(salles));
			}

			if (request.getParameter("op").equals("delete")) {
				int id = Integer.parseInt(request.getParameter("id"));
				ss.delete(ss.findById(id));
				response.setContentType("application/json");
				List<Salle> salles = ss.findAll();
				Gson json = new Gson();
				response.getWriter().write(json.toJson(salles));
			}
		} else if (request.getParameter("id") != null) {
			if (!request.getParameter("id").equals("")) {
				String code = request.getParameter("code");
				String type = request.getParameter("type");
				int id = Integer.parseInt(request.getParameter("id"));
				Gson json = new Gson();
				Salle s = ss.findById(id);
				Salle s1=ss.findByCode(code);
				response.setContentType("application/json");
				if(ss.findByCode(code)!=null && !s.getCode().equals(s1.getCode())){
					response.getWriter().write("true");
				}
				else{
					
					s.setCode(code);
					s.setType(type);
					ss.update(s);
					List<Salle> salles = ss.findAll();
					
					response.getWriter().write(json.toJson(salles));
				}
				
			}

		} else {
			Gson json = new Gson();
			
			String code = request.getParameter("code");
			String type = request.getParameter("type");
		if(ss.findByCode(code)!=null){
			response.setContentType("application/json");
			response.getWriter().write("true");
		}
		else {
			

			ss.create(new Salle(code, type));
			response.setContentType("application/json");
			List<Salle> salles = ss.findAll();
			response.getWriter().write(json.toJson(salles));
		}
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
