import java.util.List;

import models.Food;
import models.FoodMaterials;
import models.Materials;

import org.junit.Test;

import com.sun.org.apache.bcel.internal.generic.FDIV;

import play.test.UnitTest;

public class BasicTest extends UnitTest {

    @Test
    public void aVeryImportantThingToTest() {
    	
        
    }
    @Test
    public void foodMaterialsManyToManyTest(){
    	Food food1 =new Food().save();
    	food1.foodName = "111";
    	food1.save();
        Materials materials1 = new Materials();
        Materials materials2 = new Materials();
        materials1.materialsName = "mater1";
        materials2.materialsName = "mater2";
        materials1.save();
        materials2.save();
        FoodMaterials fm1 = new FoodMaterials();
        FoodMaterials fm2 = new FoodMaterials();
        FoodMaterials fm3 = new FoodMaterials();
        fm1.food = food1;
        fm1.material = materials1;
        fm1.foodMaterialsCount = "1d";
        fm1.foodMaterialsType = "main";
        fm1.save();
        fm2.food = food1;
        fm2.material =materials2;
        fm2.foodMaterialsCount = "3d";
        fm2.foodMaterialsType = "main";
        fm2.save();
        Food food3 = Food.find("byFoodName", "111").first();
        List<Materials> mainMaterials = Materials.find("select B from FoodMaterials A ,Materials B where A.food.id=? and A.material.id = B.id and A.foodMaterialsType=?",
        		food1.id,"main").fetch();
        for(Materials m : mainMaterials){
        	assertEquals("mater1", m.materialsName);
        }
    }
}
