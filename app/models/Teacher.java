package models;

import javax.persistence.Entity;
import javax.persistence.Table;

import play.db.jpa.Model;

@Entity
@Table(name="teacher")
public class Teacher extends Model{

	public String name;
	
	public int age;
	
	public String graduateSchool;
	
	public String img;
}
