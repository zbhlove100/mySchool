package models;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
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
	
	@OneToMany(mappedBy="school",fetch=FetchType.LAZY)
	public List<Teacher> teachers;
	@OneToMany(mappedBy="school",fetch=FetchType.LAZY)
	public List<Lesson> lessons;
}
