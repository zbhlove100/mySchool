package models;

import java.util.List;

import javax.persistence.Entity;
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
	
	@OneToOne(mappedBy="user")
	public UserLog userLog;
	
	@OneToMany
	public List<Food> saveFoods;
}
