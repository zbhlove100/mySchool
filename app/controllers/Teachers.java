package controllers;

import java.util.List;

import models.Teacher;

public class Teachers extends BasicCrud{

	public static void teacherDetail(String id){
		Application.loadHead();
		Teacher showTeacher = new Teacher();
		if(id==null){
			showTeacher = Teacher.find("state !=?","Delete").first();
		}else{
			showTeacher = Teacher.findById(id);
		}
		List<Teacher> listTeacher = Teacher.find("id !=?", showTeacher.id).fetch(1, 2);
		renderArgs.put("showTeacher", showTeacher);
		renderArgs.put("listTeacher", listTeacher);
		render();
	}
}
