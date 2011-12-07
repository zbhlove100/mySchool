package models;

import java.util.List;

import play.db.jpa.Model;

public class FoodFavorite extends Model{

	public Food food;
	
	public List<User> uers;
}
