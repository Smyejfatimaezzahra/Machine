package controller;

import java.io.IOException;
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
@WebServlet(name = "ListeMSController",urlPatterns = {"/ListeMSController"})
public class ListeMSController extends HttpServlet{
	private SalleService ss = new SalleService();
	private MachineService ms = new MachineService();
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("op") != null) {
        	if (request.getParameter("op").equals("load")) {
                response.setContentType("application/json");
                List<Salle> salles = ss.findAll();
                List<Machine> machines = ms.findAll();
                Gson json = new Gson();
                String bothList="["+json.toJson(salles)+","+json.toJson(machines)+"]";
                response.getWriter().write(bothList);
            }
        	
         
        } else  {
            if (!request.getParameter("salle").equals("")) {
                
                int id = Integer.parseInt(request.getParameter("salle"));
                Salle s = ss.findById(id);
                response.setContentType("application/json");
                List<Machine> machines = ms.findMachineBySalle(s);
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
