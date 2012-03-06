package models;

import javax.persistence.Entity;
import javax.persistence.Table;

import play.db.jpa.Model;
@Entity
@Table(name="code_table")
public class Code extends Model{

	public String codeName;
	
	public String codeValue;
	
	public String discription;
	
	public int parentCode;
}
