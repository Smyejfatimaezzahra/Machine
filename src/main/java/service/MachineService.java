package service;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.Machine;
import beans.Salle;
import connexion.Connexion;
import dao.IDao;

public class MachineService implements IDao<Machine> {
		SalleService ss=new SalleService();
    @Override
    public boolean create(Machine o) {
        String sql = "insert into machine values (null, ?, ?, ?,?,?)";
        try {
            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
            ps.setString(1, o.getReference());
            ps.setDate(2, new Date(o.getDateAchat().getTime()));
            ps.setDouble(3, o.getPrix());
            ps.setDouble(4, o.getSalle().getId());
            ps.setString(5, o.getMarque());
            if (ps.executeUpdate() == 1) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("create : erreur sql : " + e.getMessage());

        }
        return false;
    }

    @Override
    public boolean delete(Machine o) {
        String sql = "delete from machine where id  = ?";
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
    public boolean update(Machine o) {

        String sql = "update machine set reference  = ? ,dateAchat = ? , prix = ? ,idSalle=?,marque=? where id  = ?";
        try {
            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
            ps.setString(1, o.getReference());
            ps.setDate(2, new Date(o.getDateAchat().getTime()));
            ps.setDouble(3, o.getPrix());
            ps.setInt(4, o.getSalle().getId());
            ps.setInt(6, o.getId());
            ps.setString(5, o.getReference());
            if (ps.executeUpdate() == 1) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("update : erreur sql : " + e.getMessage());

        }
        return false;
    }

    @Override
    public Machine findById(int id) {
        Machine m = null;
        String sql = "select * from machine where id  = ?";
        try {
            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Machine(rs.getInt("id"), rs.getString("reference"), rs.getDate("dateAchat"),
                        rs.getDouble("prix"),ss.findById(rs.getInt("idSalle")), rs.getString("marque"));
            }

        } catch (SQLException e) {
            System.out.println("findById " + e.getMessage());
        }
        return null;
    }

    @Override
    public List<Machine> findAll() {
        List<Machine> machines = new ArrayList<Machine>();

        String sql = "select * from machine";
        try {
            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);;
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                machines.add(new Machine(rs.getInt("id"), rs.getString("reference"), rs.getDate("dateAchat"),
                        rs.getDouble("prix"),ss.findById(rs.getInt("idSalle")), rs.getString("marque")));
            }

        } catch (SQLException e) {
            System.out.println("findAll " + e.getMessage());
        }
        return machines;
    }
    
    public Machine findMachineByReference(String ref) {
       

        String sql = "select * from machine where reference =  ?";
        try {
            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);;
            ps.setString(1, ref);
            ResultSet rs = ps.executeQuery();
           if (rs.next()) {
               return new Machine(rs.getInt("id"), rs.getString("reference"), rs.getDate("dateAchat"),
                        rs.getDouble("prix"),ss.findById(rs.getInt("idSalle")), rs.getString("marque"));
            }

        } catch (SQLException e) {
            System.out.println("findAll " + e.getMessage());
        }
        return null;
    }
    
    public List<String> findReference() {
        List<String> references = new ArrayList<String>();
        String sql = "select distinct(reference) as ref from machine";
        try {
            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);;
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                references.add(rs.getString("ref"));
            }
        } catch (SQLException e) {
            System.out.println("findReference " + e.getMessage());
        }
        return references;
    }
    public List<Machine> findMachineBySalle(Salle s) {
        List<Machine> machines = new ArrayList<Machine>();

        String sql = "select * from machine where idSalle =  ?";
        try {
            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);;
            ps.setInt(1, s.getId());
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                machines.add(new Machine(rs.getInt("id"), rs.getString("reference"), rs.getDate("dateAchat"),
                        rs.getDouble("prix"),ss.findById(rs.getInt("idSalle")), rs.getString("marque")));
            }

        } catch (SQLException e) {
            System.out.println("findAll " + e.getMessage());
        }
        return machines;
    }
    public List<Machine> findMachineBetweenTwoDates(Date d1,Date d2) {
        List<Machine> machines = new ArrayList<Machine>();

        String sql = "select * from machine where dateAchat between ? and ?";
        try {
            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
            ps.setDate(1, new Date(d1.getTime()));
            ps.setDate(2, new Date(d2.getTime()));
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                machines.add(new Machine(rs.getInt("id"), rs.getString("reference"), rs.getDate("dateAchat"),
                        rs.getDouble("prix"),ss.findById(rs.getInt("idSalle")), rs.getString("marque")));
            }

        } catch (SQLException e) {
            System.out.println("findAll " + e.getMessage());
        }
        return machines;
    }
    public List<Machine> findNombreMachineSalle() {
        List<Machine> machines = new ArrayList<Machine>();

        String sql = "select m.*,count(*) as nombreMachine from machine m,salle s where s.id=m.idSalle group by s.id";
        try {
            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
       
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                machines.add(new Machine(rs.getInt("id"), rs.getString("reference"), rs.getDate("dateAchat"),
                        rs.getDouble("prix"),ss.findById(rs.getInt("idSalle")) ,  rs.getInt("nombreMachine")));
            }

        } catch (SQLException e) {
            System.out.println("findAll " + e.getMessage());
        }
        return machines;
    }
    
    public List<Machine> CountMachine() {
		  List<Machine> machines = new ArrayList<Machine>();

	        String sql = "select *,count(*) as count from machine";
	        try {
	            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);;
	            ResultSet rs = ps.executeQuery();
	            while (rs.next()) {
	                machines.add(new Machine(rs.getInt("id"), rs.getString("reference"), rs.getDate("dateAchat"),
	                        rs.getDouble("prix"),ss.findById(rs.getInt("idSalle")) ,  rs.getInt("count"))
	                       );
	            }

	        } catch (SQLException e) {
	            System.out.println("findAll " + e.getMessage());
	        }
	        return machines;
	}

    public int Depense() {
		 
           int som=0;
	        String sql = "select SUM(prix) as sum from machine ";
	        try {
	            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);;
	            ResultSet rs = ps.executeQuery();
	            if (rs.next()) {
	                som=rs.getInt("sum");
	            }

	        } catch (SQLException e) {
	            System.out.println("findAll " + e.getMessage());
	        }
	        return som;
	}

    
    public List<Integer> DepenseByMountAndYear() {
		 
      List<Integer> depenses= new ArrayList<Integer>();
	        String sql = "select  MONTH(dateAchat)  ,SUM(prix) as sum from machine where YEAR(dateAchat) like YEAR(CURRENT_TIMESTAMP)  group by MONTH(dateAchat) ";
	        try {
	            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);;
	            ResultSet rs = ps.executeQuery();
	            while (rs.next()) {
	               depenses.add(rs.getInt("sum"));
	            }

	        } catch (SQLException e) {
	            System.out.println("findAll " + e.getMessage());
	        }
	        return depenses;
	}

}
