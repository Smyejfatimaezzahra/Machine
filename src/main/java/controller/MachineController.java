package controller;

/*
 
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import beans.Machine;
import beans.Salle;

import com.google.gson.*;
import java.io.IOException;

import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.MachineService;
import service.SalleService;


@WebServlet(name = "MachineController",urlPatterns = {"/MachineController"})
public class MachineController extends HttpServlet {

    /**
	 * 
	 */
	private SalleService ss = new SalleService();
	private MachineService ms = new MachineService();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an IO error occurs
     */
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
        	
        	if (request.getParameter("op").equals("refresh")) {
                response.setContentType("application/json");
                List<Machine> machines = ms.findAll();
                Gson json = new Gson();
               
                response.getWriter().write(json.toJson(machines));
            }
        	
            if (request.getParameter("op").equals("delete")) {
                int id = Integer.parseInt(request.getParameter("id"));
                ms.delete(ms.findById(id));
                response.setContentType("application/json");
                List<Machine> machines = ms.findAll();
                Gson json = new Gson();
               response.getWriter().write(json.toJson(machines));
            } 
        } else if (request.getParameter("id") != null) {
            if (!request.getParameter("id").equals("")) {
                String reference = request.getParameter("reference");
                String marque= request.getParameter("marque");
                double prix = Double.parseDouble(request.getParameter("prix"));
                Date dateAchat = new Date(request.getParameter("dateAchat").replace("-", "/"));
                int id = Integer.parseInt(request.getParameter("id"));
                response.setContentType("application/json");
                Machine m = ms.findById(id);
                Machine m1=ms.findMachineByReference(reference);
           	 Gson json = new Gson();
               if( m1!=null && !m1.getReference().equals(m.getReference()) ) {
            	   System.out.print(m1.getReference());
            	   System.out.print(m.getReference());
               	response.getWriter().write("true");
               }
               else {
            	   
            	   m.setReference(reference);
                   m.setPrix(prix);
                   m.setMarque(marque);
                   m.setDateAchat(dateAchat);
                   m.setSalle(ss.findById(Integer.parseInt(request.getParameter("salle"))));
                   System.out.print("test"+m);
                   ms.update(m);
                   List<Machine> machines = ms.findAll();
                  
                  response.getWriter().write(json.toJson(machines));
               }
                
            }
        } 
        else {
        	
        	String reference = request.getParameter("reference");
        	String marque= request.getParameter("marque");
        	double prix = Double.parseDouble(request.getParameter("prix"));
            Date dateAchat = new Date(request.getParameter("dateAchat").replace("-", "/"));
            Salle s=  ss.findById(Integer.parseInt(request.getParameter("salle")));
        	response.setContentType("application/json");
        	 Gson json = new Gson();
            if( ms.findMachineByReference(reference)!=null) {
            	response.getWriter().write("true");
            }
            else {
            	ms.create(new Machine(reference, dateAchat, prix,s,marque));
            	 List<Machine> machines = ms.findAll();
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

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
