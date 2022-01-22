package beans;

import java.util.Date;

public class Machine {

    private int id;
    private String reference;
    private Date dateAchat;
    private double prix;
    private Salle salle;
    private String marque;
    private int count;
    

	public String getMarque() {
		return marque;
	}
	public void setMarque(String marque) {
		this.marque = marque;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public Machine(int id, String reference, Date dateAchat, double prix, Salle salle,String marque) {
		super();
		this.id = id;
		this.reference = reference;
		this.dateAchat = dateAchat;
		this.prix = prix;
		this.salle = salle;
		this.marque=marque;
	}
	public Salle getSalle() {
		return salle;
	}
	public void setSalle(Salle salle) {
		this.salle = salle;
	}
	public Machine( String reference, Date dateAchat, double prix, Salle salle,String marque) {
	
		this.reference = reference;
		this.dateAchat = dateAchat;
		this.prix = prix;
		this.salle = salle;
		this.marque=marque;
	}
	public Machine(int id, String reference, Date dateAchat, double prix, Salle salle,int count) {
		this.id=id;
		this.count=count;
		this.reference = reference;
		this.dateAchat = dateAchat;
		this.prix = prix;
		this.salle = salle;
	}

   
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getReference() {
        return reference;
    }

    public void setReference(String reference) {
        this.reference = reference;
    }

    public Date getDateAchat() {
        return dateAchat;
    }

    public void setDateAchat(Date dateAchat) {
        this.dateAchat = dateAchat;
    }

    public double getPrix() {
        return prix;
    }

    public void setPrix(double prix) {
        this.prix = prix;
    }

    @Override
    public String toString() {
        return this.id + " " + this.reference;
    }

}
