package models;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

import play.db.jpa.Model;
@Entity
@Table(name="news")
public class news extends Model{
	public String title;
	
	public String content;
	
	public String type;
	
	public String state;
	
	public Date createdAt;
	
	public Date removedAt;
}
