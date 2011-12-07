package models;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import play.data.validation.MaxSize;
import play.db.jpa.Model;
@Entity
@Table(name="food_message")
public class FoodMessage extends Model{

	@MaxSize(45)
	public String taste;

	public String cookType;
	
	public String makeType;
	
	public int personSum;
	
	public String hardLevel;
	
	public String takeTime;
	
	@OneToOne
	public Food food;
	
}
