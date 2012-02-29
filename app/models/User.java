package models;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
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

	public static User connect(String email, String password) {
		// TODO Auto-generated method stub
		return User.find("email=? and password=?", email,password).first();
	}
	
}
