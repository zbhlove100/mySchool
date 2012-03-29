package models;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import play.db.jpa.Model;

@Entity
@Table(name="user")
public class User extends Model {
	public String userName;
	
	public String password;
	
	public String email;
	
	public int age;
	
	public String location;
	
	@OneToOne(mappedBy="user",fetch=FetchType.LAZY)
	public UserLog userLog;

	@OneToMany(mappedBy="user",fetch=FetchType.LAZY)
	public List<Information> informations;
	
	@ManyToMany(cascade=CascadeType.ALL,fetch=FetchType.LAZY)
	@JoinTable(name="book_user"
				,joinColumns={@JoinColumn(name="user_id")}
				,inverseJoinColumns={@JoinColumn(name="book_id")})
	public List<Book> book;
	
	public static User connect(String email, String password) {
		// TODO Auto-generated method stub
		return User.find("email=? and password=?", email,password).first();
	}
	
}
