package models;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import play.db.jpa.Model;
@Entity
@Table(name="materials")
public class Materials  extends Model{

	public String materialsName;
	
	public String otherNames;
	
	public String discription;
	
	public String materialsPicture;
	
	public String materialsNutrition;
	
	@OneToOne(mappedBy="material")
	public FoodMaterials foodMaterials;
	
	@ManyToMany(cascade = {CascadeType.PERSIST,CascadeType.MERGE})
	@JoinTable(name="materials_tag",joinColumns={@JoinColumn(name="materials_id",referencedColumnName="id")}
							,inverseJoinColumns={@JoinColumn(name="tag_id",referencedColumnName="id")})
	public List<Tag> tags;
}
