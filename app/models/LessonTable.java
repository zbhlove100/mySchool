package models;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import play.db.jpa.Model;
@Entity
@Table(name="lesson_table")
public class LessonTable extends Model{
	public String name;
	
	public String lessonDate;
	
	public String state;
	
	@ManyToOne
	public Lesson lesson;
}
