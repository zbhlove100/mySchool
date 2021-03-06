package models;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import play.db.jpa.Model;

@Entity
@Table(name="teacher")
public class Teacher extends Model{

	public String name;
	
	public int age;
	
	public String graduateSchool;
	
	public String img;
	
	public String bigImg;
	
	public String x150_img;
	
	public Date createdAt;
	
	public Date removedAt;
	
	@OneToOne(mappedBy="teacher")
	public TeacherDetail teacherDetail;
	
	@OneToMany(mappedBy="teacher",fetch=FetchType.LAZY)
 	public List<Lesson> lessons;
	
	@ManyToOne
	public School school;
	
	@OneToMany(mappedBy="teacher",fetch=FetchType.LAZY)
	public List<Tag> tags;
}
