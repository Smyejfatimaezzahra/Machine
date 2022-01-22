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
import service.MachineService;
import service.SalleService;
@WebServlet(name = "ListeMSDController",urlPatterns = {"/ListeMSDController"})
public class ListeMSDController extends HttpServlet {
	private SalleService ss = new SalleService();
	private MachineService ms = new MachineService();
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("op") != null) {
        	if (request.getParameter("op").equals("load")) {
                response.setContentType("application/json");
  
                List<Machine> machines = ms.findAll();
                Gson json = new Gson();
                response.getWriter().write(json.toJson(machines));
            }
        	
         
        } 
        
        else  {
            if (!request.getParameter("date1").equals("") && !request.getParameter("date2").equals("")) {
               
              Date dateD = new Date(request.getParameter("date1").replace("-", "/"));
              Date dateF = new Date(request.getParameter("date2").replace("-", "/"));
               
                response.setContentType("application/json");
                List<Machine> machines = ms.findMachineBetweenTwoDates(new java.sql.Date(dateD.getTime()), new java.sql.Date(dateF.getTime()));
                Gson json = new Gson();
               response.getWriter().write(json.toJson(machines));
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
