package controller;

import java.io.IOException;
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
import beans.Users;
import service.MachineService;
import service.SalleService;
import service.UsersService;
@WebServlet(name = "UsersController",urlPatterns = {"/UsersController"})
public class UsersController extends HttpServlet{
	UsersService us=new UsersService();
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		HttpSession session = request.getSession();
            Gson json = new Gson();
            if(request.getParameter("op")!=null) {
            	if (request.getParameter("op").equals("load")) {
                	response.setContentType("application/json");
                	if(session.getAttribute("user")!=null) {
   
                		Users u =(Users) session.getAttribute("user");
   
                		List<Users>users = us.findAll(u);
        				response.getWriter().write(json.toJson(users));
                	}
    				
                }
            	if (request.getParameter("op").equals("recu")) {
            		String email=request.getParameter("email");
        			String password= us.MD5(request.getParameter("password"));
        			Users u= us.findByEmail(email);
        			u.setPassword(password);
        			us.update(u);
                	
                }
                if (request.getParameter("op").equals("connexion")) {
        			Users u=us.findByEmail(request.getParameter("email"));
       
        			if(u!=null) {
        				if(u.getPassword().equals(UsersService.MD5(request.getParameter("password")))) {
        					response.setContentType("application/json");
        				
        	                session.setAttribute("user", u);
        	                session.setAttribute("nom", u.getNom());
        	                session.setAttribute("role", u.getRole());
        	               
        	                String both="["+true+","+json.toJson(u)+"]";
        					response.getWriter().write(both);
        				}
        				else response.getWriter().write("falseP");
        			}
        			else response.getWriter().write("falseE");
        		}
                if (request.getParameter("op").equals("delete")) {
                	System.out.println(request.getParameter("id"));
    				int id = Integer.parseInt(request.getParameter("id"));
    				us.delete(us.findById(id));
    				response.setContentType("application/json");
    				if(session.getAttribute("user")!=null) {   
                		Users user =(Users) session.getAttribute("user");
                		List<Users>users = us.findAll(user);
        				response.getWriter().write(json.toJson(users));
                	}
    			}
        	if (request.getParameter("op").equals("create")) {
        			String email=request.getParameter("email");
        			String password= us.MD5(request.getParameter("password"));
        			String nom=request.getParameter("nom");
        			System.out.println("fkf");
        			response.setContentType("application/json");
        			if(us.findByEmail(email)!=null) {
        				response.getWriter().write("true");
        				
        			}
        			else{
        				
        				us.create(new Users(email,password,nom,false));
        				if(session.getAttribute("user")!=null) {   
                    		Users u =(Users) session.getAttribute("user");
                    		List<Users>users = us.findAll(u);
            				response.getWriter().write(json.toJson(users));
                    	}
        				
        			}
    				
        		}
        	
        	
            }
            
    		
            else  if (request.getParameter("id")!= null ) {
              int id = Integer.parseInt(request.getParameter("id"));
        		System.out.println(request.getParameter("id"));
        		String email=request.getParameter("email");
    			String password= us.MD5(request.getParameter("password"));
    			String nom=request.getParameter("nom");
    			Users u=us.findById(id);
    			response.setContentType("application/json");
    			if(us.findByEmail(email)!=null && !us.findByEmail(email).getEmail().equals(u.getEmail()) ) {
    				response.getWriter().write("true");
    				
    			}
    			else{
    				u.setEmail(email);
    				u.setNom(nom);
        			u.setPassword(password);
        			us.update(u);
        			if(session.getAttribute("user")!=null) {   
                		Users user =(Users) session.getAttribute("user");
                		List<Users>users = us.findAll(user);
        				response.getWriter().write(json.toJson(users));
                	}
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
