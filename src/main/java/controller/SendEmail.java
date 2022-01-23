
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import beans.Users;

@WebServlet(name = "SendEmail", urlPatterns = { "/SendEmail" })
public class SendEmail extends HttpServlet {
	String email;
     static int count=0;
     int code=0;
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		MimeBodyPart textPart = new MimeBodyPart();
		
		 if(count==0) code=(int)Math.floor(Math.random()*(400000)+200000);
	
		 if(request.getParameter("op")==null) {
		String nom = "";
		String password = "";
		email = request.getParameter("email");
		System.out.println(email);
		Properties props = new Properties();
		props.put("mail.smtp.auth", true);
		props.put("mail.smtp.starttls.enable", true);
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(nom, password);
			}
		});
		try {
            count++;
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(email));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(nom));
			
			Multipart multipart = new MimeMultipart();
			
			textPart.setText(String.valueOf(code));
			multipart.addBodyPart(textPart);
			message.setSubject("Object");
			
            message.setContent(multipart);

			Transport.send(message);
			
			System.out.println("Done");
			response.sendRedirect("");

		} catch (MessagingException e) {
			
			throw new RuntimeException(e);
		}}
      if(request.getParameter("op")!=null) {
    	  System.out.println(code);
    	  response.setContentType("application/json");
    	  if(Integer.parseInt(request.getParameter("code"))==code) {
    		  response.getWriter().write("true");
    		  count=0;
    	  }
    	  else  response.getWriter().write("false");
      }
	}

}
