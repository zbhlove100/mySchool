package models;

import javax.persistence.Entity;
import javax.persistence.Table;

import play.db.jpa.Model;
@Entity
@Table(name="class_level")
public class ClassLevel extends Model{
	public String name;
	
	public String discription;
	
	public int level;
}
