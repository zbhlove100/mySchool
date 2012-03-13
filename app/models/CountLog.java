package models;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

import play.data.validation.Required;
import play.db.jpa.Model;
@Entity
@Table(name="count_log")
public class CountLog extends Model{
	public String userName;
	
	public String ipaddress;
	
    @Required
	public Date createdAt;
}
