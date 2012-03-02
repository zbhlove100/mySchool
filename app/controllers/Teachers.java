package controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;

import models.Teacher;

public class Teachers extends BasicCrud{
	private static int GLENGTH = 2; 
	public static void teacherDetail(long id,int group){
		Application.loadHead();
		Teacher showTeacher = new Teacher();
		if(id==0){
			showTeacher = Teacher.find("state !=?","Delete").first();
		}else{
			showTeacher = Teacher.findById(id);
		}
		group = group==0?1:group;
		long l = Teacher.count();
		if((l-group*GLENGTH)<0){
			group = group - 1;
		}
		List<Teacher> listTeacher = Teacher.find("id !=?", showTeacher.id).fetch(group, GLENGTH);
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
		List<Teacher> listTeacher = Teacher.find("id !=?", id).fetch(group, GLENGTH);
		renderArgs.put("teacherGroup", group);
		renderArgs.put("teacherId", id);
		render(listTeacher);
	}
}
