package models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import play.db.jpa.Model;
@Entity
@Table(name="food_materials")
public class FoodMaterials extends Model{

	@ManyToOne
	@JoinColumn(name="food_materials_id")
	public Materials material;
	
	@ManyToOne
	@JoinColumn(name="food_id")
	public Food food;
	
	public String foodMaterialsType;
	
	public String foodMaterialsCount;
}
