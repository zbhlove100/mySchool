package controllers;

import play.*;
import play.mvc.*;

import java.util.*;

import models.*;

public class Application extends BasicCrud {

    public static void index() {
    	List<Teacher> teachers = Teacher.find("state", "main").fetch();
    	System.err.println(teachers.size());
    	Teacher bigTeacher = Teacher.find("state", "big").first();
    	renderArgs.put("bigTeacher", bigTeacher);
    	renderArgs.put("teachers",teachers);
        render();
    }
}