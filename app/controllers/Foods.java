package controllers;

import java.util.List;

import models.Food;
import models.FoodViewlog;
import models.Materials;

public class Foods extends BasicCrud{
		
		private static String FAVORATE= "fav";
		private static String COOKED= "cook";
		
		public static void index(){
			List<Food> foods = Food.find("order by createdAt desc").fetch(5);
			render(foods);
		}
		public static void show(Long id){
			
			Food food = Food.findById(id);
			if(food.foodViewlogs==null){
				FoodViewlog foodViewlog = new FoodViewlog();
				foodViewlog.food = food;
				foodViewlog.save();
				food.foodViewlogs = foodViewlog;
			}
			food.foodViewlogs.viewTimes++;
			food.foodViewlogs.save();
			List<Materials> mainMaterials = Materials.find("select B from FoodMaterials A ,Materials B where A.food.id=? and A.material.id = B.id and A.foodMaterialsType=?",
	        		id,"main").fetch();
			List<Materials> auxMaterials =  Materials.find("select B from FoodMaterials A ,Materials B where A.food.id=? and A.material.id = B.id and A.foodMaterialsType=?",
					id,"auxiliary").fetch();
			List<Materials> seaMaterials =  Materials.find("select B from FoodMaterials A ,Materials B where A.food.id=? and A.material.id = B.id and A.foodMaterialsType=?",
					id,"seasoning").fetch();
			
			
			renderArgs.put("mainMaterials", mainMaterials);
			renderArgs.put("auxMaterials", auxMaterials);
			renderArgs.put("seaMaterials", seaMaterials);
			
			render(food);
		}
		public static void favor(String ac,Long id){
			
			System.err.println("================="+id);
			Food food = Food.findById(id);
			if(FAVORATE.equals(ac)){
				food.foodViewlogs.favoriteTimes ++;
			}else if(COOKED.equals(ac)){
				food.foodViewlogs.cookTimes ++;
			}
			food.foodViewlogs.save();
			show(id);
		}
	    public static void rating() {
	        render();
	    	//renderJSON(jsonMessage(""));
	    }
	    public static void ratePage(Long id) {
	    	renderArgs.put("id", id);
	        render();
	    	//renderJSON(jsonMessage(""));
	    }
	    public static void rate(Long id,int score){
	    	//Long id = params.get("id",long.class);
	    	//int score = params.get("score",int.class);
	    	/*Food food = Food.findById(id);
	    	food.rating = score;
	    	food.save();*/
	    	renderJSON(jsonMessage(score+"fen"));
	    }
}
