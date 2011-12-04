package models;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import play.db.jpa.Model;
@Entity
@Table(name="food_method")
public class FoodMethod extends Model{

	public int step;
	
	public String methodPicture;
	
	public String methodDetail;
	
	public String methodTip;
	
	public String ispoint;
	
	public String taketime;
	
	@ManyToOne
	public Food food;
}
