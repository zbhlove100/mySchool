package models;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.MapKey;
import javax.persistence.MapKeyColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.MapKeyManyToMany;

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
	
	public int rating;
	
	public String recommend;
	
	@OneToOne(mappedBy="food",fetch=FetchType.LAZY)
	public FoodViewlog foodViewlogs;
	
	@OneToMany(mappedBy="food",fetch=FetchType.LAZY)
	public  List<FoodMaterials> foodMaterials;
	
	@OneToMany(mappedBy="food",fetch=FetchType.LAZY)
	public List<FoodMethod> foodMethods;

	@OneToOne(mappedBy="food",fetch=FetchType.LAZY)
	public FoodMessage foodMessage;
	
	
}
