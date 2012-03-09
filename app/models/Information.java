package models;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import play.db.jpa.Model;
@Entity
@Table(name="information")
public class Information extends Model{
	public String title;
	
	public String content;
	
	public String type;
	
	public String state;
	
	public Date createdAt;
	
	public Date removedAt;
	
	@OneToMany(mappedBy="information",fetch=FetchType.LAZY)
	public List<Tags> tags;
}