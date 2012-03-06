package models;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import play.db.jpa.Model;
@Entity
@Table(name="lesson")
public class Lesson extends Model{

	public String name;
	
	public String lessonTimeType;
	
	public String lessonType;
	
	public String collection;
	
	public String subCollection;
	
	public String level;
	
	public String state;
	
	public int times;
	
	public String startTime;
	
	public String endTime;
	
	public String discription;
	
	public int studentNum;
	@ManyToOne
	public Teacher teacher;
	
	@ManyToOne
	public School school;
}
