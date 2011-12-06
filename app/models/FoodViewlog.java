package models;

import javax.persistence.Entity;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import play.db.jpa.Model;

@Entity
@Table(name="food_viewlog")
public class FoodViewlog extends Model {

	@OneToOne
	public Food food;
	
	public int viewTimes;
	
	public int favoriteTimes;
	
	public int cookTimes;
	
	public int commentTimes;

	public FoodViewlog() {
		super();
		this.viewTimes = 0;
		this.favoriteTimes = 0;
		this.cookTimes = 0;
		this.commentTimes = 0;
	}
	
	
}
