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
import beans.Users;
import service.MachineService;
import service.SalleService;
import service.UsersService;
@WebServlet(name = "UserController",urlPatterns = {"/UserController"})
public class UserController extends HttpServlet{
	UsersService us=new UsersService();
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            System.out.println("dnbdjd");
            Gson json = new Gson();
    		System.out.println("djdj");
    		if (request.getParameter("op").equals("connexion")) {
    			Users u=us.findByEmail(request.getParameter("email"));
    			System.out.println(u);
    			if(u!=null) {
    				if(u.getPassword().equals(UsersService.MD5(request.getParameter("password")))) {
    					response.setContentType("application/json");
    				//	HttpSession session = request.getSession();
    	               // session.setAttribute("user", u);
    	               
    					response.getWriter().write(json.toJson(true));
    				}
    				else response.getWriter().write(json.toJson("falseP"));
    			}
    			else response.getWriter().write(json.toJson("falseE"));
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
