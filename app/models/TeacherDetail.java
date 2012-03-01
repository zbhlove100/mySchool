package models;

import javax.persistence.Entity;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import play.db.jpa.Model;

@Entity
@Table(name="teacher_detail")
public class TeacherDetail extends Model{
	public String classType;
	
	public String enName;
	
	public String sex;
	
	public String education;
	
	public String bloodtype;
	
	public String birthday;
	
	public int height;
	
	public String interest;
	
	public String favoriteColor;
	
	public String favoritePlace;
	
	public String favoriteSport;
	
	public String favoriteAnimal;
	
	public String teacherWord;
	
	public String adoreMan;
	
	public String sammary;
	
	public String tel;
	
	public String email;
	
	public String qq;
	
	public String weibo;
	
	public String address;
	
	public String household;
	
	@OneToOne
	Teacher teacher;
}
