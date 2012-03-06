package controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;

import models.BaseModel;
import models.Teacher;

public class Teachers extends BasicCrud{
	private static int GLENGTH = 2; 
	public static void show(){
		Application.loadHead();
		int group = 1;
		Teacher showTeacher = Teacher.find("state !=?",BaseModel.DELETE).first(); 
		List<Teacher> listTeacher = Teacher.find("id !=? and state !=?", showTeacher.id,BaseModel.DELETE).fetch(group, GLENGTH);
		renderArgs.put("teacherGroup", group);
		renderArgs.put("teacherId", showTeacher.id);
		renderArgs.put("showTeacher", showTeacher);
		renderArgs.put("listTeacher", listTeacher);
		renderArgs.put("page", "teacher");
		render();
	}
	public static void teacherDetail(){
		long id = Long.parseLong(params.get("id",int.class).toString());
		int group = params.get("group", int.class);
		
		Teacher showTeacher = new Teacher();
		if(id==0){
			showTeacher = Teacher.find("state !=?",BaseModel.DELETE).first();
		}else{
			showTeacher = Teacher.findById(id);
		}
		group = group==0?1:group;
		long l = Teacher.count();
		if((l-group*GLENGTH)<0){
			group = group - 1;
		}
		List<Teacher> listTeacher = Teacher.find("id !=? and state !=?", showTeacher.id,BaseModel.DELETE).fetch(group, GLENGTH);
		renderArgs.put("teacherGroup", group);
		renderArgs.put("teacherId", showTeacher.id);
		renderArgs.put("showTeacher", showTeacher);
		renderArgs.put("listTeacher", listTeacher);
		render();
	}
	public static void changeGroup(long id ,int group){
		long l = Teacher.count();
		if((l-group*GLENGTH)<0){
			group = group - 1;
		}
		List<Teacher> listTeacher = Teacher.find("id !=? and state !=?", id,BaseModel.DELETE).fetch(group, GLENGTH);
		renderArgs.put("teacherGroup", group);
		renderArgs.put("teacherId", id);
		render(listTeacher);
	}
}
