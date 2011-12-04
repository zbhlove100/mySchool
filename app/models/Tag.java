package models;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import play.db.jpa.Model;
@Entity
@Table(name="tag")
public class Tag extends Model{

	public String tagName;
	
	@ManyToMany(mappedBy="tags")
	public List<Materials> materials;
}
