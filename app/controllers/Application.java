package controllers;

import play.*;
import play.mvc.*;

import java.util.*;

import models.*;

public class Application extends BasicCrud {

    public static void index() {
    	loadHead();
    	List<ClassLevel> classLevels = ClassLevel.findAll();
    	List<Information> mainNews = Information.find("type =? and state !=? order by createdAt DESC", BaseModel.MAIN,BaseModel.DELETE).fetch(8);
    	Information firstNews = Information.find("type =? and state !=? order by createdAt DESC", "first",BaseModel.DELETE).first();
    	List<List> saleMessages = new ArrayList<List>();
    	for(int i=1;i<5;i++){
    		List<Information> tsaleMessages = Information.find("type =? and state !=? order by createdAt DESC", "sale",BaseModel.DELETE).fetch(i,2);
    		saleMessages.add(tsaleMessages);
    	}
    	
    	renderArgs.put("classLevels", classLevels);
    	renderArgs.put("mainNews",mainNews);
    	renderArgs.put("firstNews",firstNews);
    	renderArgs.put("saleMessages", saleMessages);
    	renderArgs.put("page", "index");
        render();
    }
    
    public static Map loadHead(){
    	List<Teacher> teachers = Teacher.find("state", "main").fetch();
    	System.err.println(teachers.size());
    	Teacher bigTeacher = Teacher.find("state", "big").first();
    	long visitTimes = CountLog.count();
    	renderArgs.put("bigTeacher", bigTeacher);
    	renderArgs.put("teachers",teachers);
    	renderArgs.put("visitTimes",visitTimes);
    	return new HashMap();
    }
}