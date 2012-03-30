package models;

import javax.persistence.Entity;
import javax.persistence.Table;

import play.db.jpa.Model;

@Entity
@Table(name="lesson_system")
public class LessonSystem extends Model{

	public String name;
	
	public String type;
	
	public String state;
	
	public String description;
}
