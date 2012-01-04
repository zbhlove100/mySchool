package models;

import javax.persistence.Entity;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import play.db.jpa.Model;
@Entity
@Table(name = "user_log")
public class UserLog extends Model{
	public int loginTimes;
	
	@OneToOne
	public User user;
}
