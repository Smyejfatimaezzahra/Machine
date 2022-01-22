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
@WebServlet(name = "DashboardController",urlPatterns = {"/DashboardController"})
public class DashboardController  extends  HttpServlet{
	private SalleService ss = new SalleService();
	private MachineService ms = new MachineService();
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		if(request.getParameter("op")!=null) {
			if (request.getParameter("op").equals("load")) {
				response.setContentType("application/json");
				List<Machine> machines=ms.findNombreMachineSalle();
				List<Machine> cmachines=ms.CountMachine();
				List<Salle> salles=ss.CountSalle();
				List<Integer> depenses=ms.DepenseByMountAndYear();
				int som=ms.Depense();
	                Gson json = new Gson();
	                String data="["+json.toJson(salles)+","+json.toJson(machines)+","+json.toJson(cmachines)+","+json.toJson(som)+","+json.toJson(depenses)+"]";
	                
	               response.getWriter().write(data);
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
