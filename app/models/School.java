package models;

import javax.persistence.Entity;
import javax.persistence.Table;

import play.db.jpa.Model;
@Entity
@Table(name="school")
public class School extends Model{
	public String name;
	
	public String address;
	
	public String tel;
	
	public String img;
	
	public String discription;
}
