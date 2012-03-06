package models;

import java.util.ArrayList;
import java.util.List;

import play.db.jpa.Model;

public class BaseModel extends Model {
	
	 public static String ACTIVE = "Active";
	 public static String PROCESSING = "Processing";	 
	 public static String PENDING = "Pending";
	 public static String FREEZE = "Freeze";
	 public static String DELETE = "Delete";
	 public static int PAGESIZE = 10;
	 
	 public static List<String> getBaseStates(){
		 List<String> ss = new ArrayList<String>();
		 ss.add(ACTIVE);
		 ss.add(PROCESSING);
		 ss.add(PENDING);
		 ss.add(FREEZE);
		 return ss;
	 }

}
