package beans;

public class Users {
	private int id;

	private String email;
	private String password;
	private String nom;
	private Boolean role;
	public Boolean getRole() {
		return role;
	}

	public Users(String email, String password) {
		super();
		this.email = email;
		this.password = password;
	}

	public void setRole(Boolean role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return  nom ;
	}

	public Users(int id, String email, String password, String nom,Boolean role) {
		super();
		this.role=role;
		this.id = id;
		this.email = email;
		this.password = password;
		this.nom = nom;
	}


	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public Users(String email, String password, String nom, Boolean role) {
		super();
		this.email = email;
		this.password = password;
		this.nom = nom;
		this.role=role;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

}
