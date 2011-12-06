package models;

import java.util.List;
import java.util.Map;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.MapKey;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.MapKeyManyToMany;

import play.db.jpa.Model;
@Entity
@Table(name="materials")
public class Materials  extends Model{

	public String materialsName;
	
	public String otherNames;
	
	public String discription;
	
	public String materialsPicture;
	
	public String materialsNutrition;
	
	@OneToMany(mappedBy="material")
	public List<FoodMaterials> foodMaterials;
	
	@ManyToMany(cascade = {CascadeType.PERSIST,CascadeType.MERGE})
	@JoinTable(name="materials_tag",joinColumns={@JoinColumn(name="materials_id",referencedColumnName="id")}
							,inverseJoinColumns={@JoinColumn(name="tag_id",referencedColumnName="id")})
	public List<Tag> tags;
}
