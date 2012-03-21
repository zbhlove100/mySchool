package models;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import play.db.jpa.Model;
@Entity
@Table(name="information_log")
public class InformationLog extends Model{
	
	public String date;
	
	public int count;
	
	@ManyToOne
	public Information information;
}
