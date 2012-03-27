package models;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import play.db.jpa.Model;
@Entity
@Table(name="tags")
public class Tag extends Model{
	public String name;
	
	@ManyToOne
	public Information information;
	
	@ManyToOne
	public Teacher teacher;
	
	@ManyToOne
	public Lesson lesson;
}