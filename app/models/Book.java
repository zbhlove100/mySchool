package models;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import play.db.jpa.Model;

@Entity
@Table(name="book")
public class Book extends Model{
	public String name;
	
	public String type;
	
	public int price;
	
	public int oldprice;
	
	public String description;
	
	public String state;
	
	@ManyToMany(cascade=CascadeType.ALL,fetch=FetchType.LAZY)
	@JoinTable(name="book_user"
				,joinColumns={@JoinColumn(name="book_id")}
				,inverseJoinColumns={@JoinColumn(name="user_id")})
	public List<User> users;
	
	@ManyToOne
	public LessonSystem lesson_system;
}
