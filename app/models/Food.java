package models;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import play.data.validation.MaxSize;
import play.data.validation.Required;
import play.db.jpa.Model;
@Entity
@Table(name="food")
public class Food extends Model implements Serializable{
	@Required
	@MaxSize(255)
	public String foodName;
	
	public String owner;
	
	public String discription;
	
	public Date createdAt;
	
	public Date removedAt;
	
	public String state;
	
	public String mainPicture;
	
	public String dayType;
	
	@OneToOne(mappedBy="food")
	public FoodViewlog foodViewlogs;
	
	@OneToMany(mappedBy="food")
	public  List<FoodMaterials> foodMaterials;
	
	@OneToMany(mappedBy="food")
	public List<FoodMethod> foodMethods;

	
	
	public Food(Long id,String foodName) {
		this.id = id;
		this.foodName = foodName;
	}



	public Food(Long id,String foodName,  String discription,
			Date createdAt, Date removedAt, String state, String mainPicture,
			String dayType, FoodViewlog foodViewlogs,
			List<FoodMaterials> foodMaterials, List<FoodMethod> foodMethods) {
		this.id = id;
		this.foodName = foodName;
		this.discription = discription;
		this.createdAt = createdAt;
		this.removedAt = removedAt;
		this.state = state;
		this.mainPicture = mainPicture;
		this.dayType = dayType;
	}
	
}
