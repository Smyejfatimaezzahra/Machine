package service;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.Machine;
import beans.Users;
import connexion.Connexion;
import dao.IDao;

public class UsersService implements IDao<Users> {

	@Override
	public boolean create(Users o) {
		 String sql = "insert into users values (null, ?, ?, ?,false)";
	        try {
	            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
	            ps.setString(1, o.getEmail());
	            ps.setString(2, o.getPassword());
	            ps.setString(3, o.getNom());

	            if (ps.executeUpdate() == 1) {
	                return true;
	            }
	        } catch (SQLException e) {
	            System.out.println("create : erreur sql : " + e.getMessage());

	        }
	        return false;
	}

	@Override
	public boolean delete(Users o) {
		  String sql = "delete from users where id  = ?";
	        try {
	            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
	            ps.setInt(1, o.getId());
	            if (ps.executeUpdate() == 1) {
	                return true;
	            }
	        } catch (SQLException e) {
	            System.out.println("delete : erreur sql : " + e.getMessage());

	        }
	        return false;
	}

	@Override
	public boolean update(Users o) {

        String sql = "update users set email  = ? ,password = ? , nom = ?  where id  = ?";
        try {
            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
            ps.setString(1, o.getEmail());
            ps.setString(2, o.getPassword());
            ps.setString(3, o.getNom());
            ps.setInt(4, o.getId());
            if (ps.executeUpdate() == 1) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("update : erreur sql : " + e.getMessage());

        }
        return false;
	}

	@Override
	public Users findById(int id) {
		Users m = null;
        String sql = "select * from users where id  = ?";
        try {
            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Users(rs.getInt("id"), rs.getString("email"), rs.getString("password"),
                        rs.getString("nom"),rs.getBoolean("role"));
            }

        } catch (SQLException e) {
            System.out.println("findById " + e.getMessage());
        }
        return null;
	}

	
	public List<Users> findAll(Users u) {
        List<Users> users = new ArrayList<Users>();

        String sql = "select * from users where id not like ? and role not like true";
        try {
            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
            ps.setInt(1, u.getId());
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
               users.add(new Users(rs.getInt("id"), rs.getString("email"), rs.getString("password"),
                       rs.getString("nom"),rs.getBoolean("role")));
            }

        } catch (SQLException e) {
            System.out.println("findAll " + e.getMessage());
        }
        return users;
	}
	public Users findByPassEmail() {
       

        String sql = "select * from users where password=? and email=?";
        try {
            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);;
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
              return new Users(rs.getInt("id"), rs.getString("email"), rs.getString("password"),
                       rs.getString("nom"),rs.getBoolean("role"));
            }

        } catch (SQLException e) {
            System.out.println("findByPassEmail " + e.getMessage());
        }
        return null;
	}
	public Users findByPass(String pass) {
	       

        String sql = "select * from users where password=? ";
        try {
            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
            ps.setString(1, pass);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
            	return new Users(rs.getInt("id"), rs.getString("email"), rs.getString("password"),
                        rs.getString("nom"),rs.getBoolean("role"));
                       
            }

        } catch (SQLException e) {
            System.out.println("findByPass " + e.getMessage());
        }
        return null;
	}

	public Users findByEmail(String email) {
	       

        String sql = "select * from users where  email=?";
       
        try {
            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
              return new Users(rs.getInt("id"), rs.getString("email"), rs.getString("password"),
                      rs.getString("nom"),rs.getBoolean("role"));
            }

        } catch (SQLException e) {
            System.out.println("findByEmail " + e.getMessage());
        }
        return null;
	}

public static String MD5(String s) {
    try {
        MessageDigest md = MessageDigest.getInstance("MD5");
        BigInteger bi = new BigInteger(1, md.digest(s.getBytes()));
        return bi.toString(16);
    } catch (NoSuchAlgorithmException ex) {
        ex.printStackTrace();
        return null;
    }
}

@Override
public List<Users> findAll() {
	// TODO Auto-generated method stub
	return null;
}

}