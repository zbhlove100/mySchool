package controllers;

import java.util.List;

import models.BaseModel;
import models.Code;
import models.Lesson;
import models.LessonTable;
import models.School;

public class Lessons extends BasicCrud{
	public static String TIME_TYPE = "lesson_time_type";
	public static String LESSON_TYPE = "lesson_type";
	public static String COLLECTION = "collection";
	
	public static void list(){
		Application.loadHead();
		String timeType = params.get("timeType");
		String lessonType = params.get("lessonType");
		String collection = params.get("collection");
		String subCollection = params.get("subCollection");
		int  school = params.get("school",int.class);
		int  pageNum = params.get("pageNum",int.class);
		//make the search condition
		StringBuffer where = new StringBuffer("state <> '"+BaseModel.DELETE+"'");
		
		if(timeType!=null&&!"".equals(timeType)){
			where.append("and lessonTimeType = '" +timeType+"'");
		}
		if(lessonType!=null&&!"".equals(lessonType)){
			where.append("and lessonType = '" +lessonType+"'");
		}
		if(collection!=null&&!"".equals(collection)){
			where.append("and collection = '" +collection+"'");
		}
		if(subCollection!=null&&!"".equals(subCollection)){
			where.append("and subCollection = '" +subCollection+"'");
		}
		if(school!=0){
			where.append("and school.id = " +school);
		}	
		
		//get the page number
		int totalCount = (int) Lesson.count(where.toString());
		int maxPage = totalCount%BaseModel.PAGESIZE==0?totalCount/BaseModel.PAGESIZE:totalCount/BaseModel.PAGESIZE+1;
		pageNum = pageNum==0?1:pageNum;
		String pageAction = params.get("pageAction");
		if("first".equals(pageAction)){
			pageNum = 1;
		}else if("pre".equals(pageAction)){
			pageNum -= 1;
		}else if("next".equals(pageAction)){
			pageNum = (pageNum+1)>maxPage?pageNum:pageNum+1;
		}else if("last".equals(pageAction)){
			pageNum = maxPage;
		}
		
		List<Lesson> lessons = Lesson.find(where.toString()).fetch(pageNum,BaseModel.PAGESIZE);
		
		List<Code> timeTypes = Code.find("codeName = ? and state != ?",TIME_TYPE,BaseModel.DELETE).fetch();
		List<Code> lessonTypes = Code.find("codeName = ? and state != ?",LESSON_TYPE,BaseModel.DELETE).fetch();
		List<Code> collections = Code.find("codeName = ? and state != ?",COLLECTION,BaseModel.DELETE).fetch();
		List<School> schools = School.find("state !=?", BaseModel.DELETE).fetch();
		
		
		renderArgs.put("timeType", timeType);
		renderArgs.put("lessonType", lessonType);
		renderArgs.put("collection", collection);
		renderArgs.put("subCollection", subCollection);
		renderArgs.put("school", school);
		renderArgs.put("pageNum", pageNum);
		renderArgs.put("totalCount", totalCount);
		renderArgs.put("pageSize", BaseModel.PAGESIZE);
		
		renderArgs.put("timeTypes", timeTypes);
		renderArgs.put("lessonTypes", lessonTypes);
		renderArgs.put("collections", collections);
		renderArgs.put("schools", schools);
		renderArgs.put("lessons", lessons);
		renderArgs.put("page", "lesson");
		render();
	}
	public static void listDetail(){
		String timeType = params.get("timeType");
		String lessonType = params.get("lessonType");
		String collection = params.get("collection");
		String subCollection = params.get("subCollection");
		int  school = params.get("school",int.class);
		int  pageNum = params.get("pageNum",int.class);
		//make the search condition
		StringBuffer where = new StringBuffer("state <> '"+BaseModel.DELETE+"'");
		
		if(timeType!=null&&!"".equals(timeType)){
			where.append("and lessonTimeType = '" +timeType+"'");
		}
		if(lessonType!=null&&!"".equals(lessonType)){
			where.append("and lessonType = '" +lessonType+"'");
		}
		if(collection!=null&&!"".equals(collection)){
			where.append("and collection = '" +collection+"'");
		}
		if(subCollection!=null&&!"".equals(subCollection)){
			where.append("and subCollection = '" +subCollection+"'");
		}
		if(school!=0){
			where.append("and school.id = " +school);
		}	
		
		//get the page number
		int totalCount = (int) Lesson.count(where.toString());
		int maxPage = totalCount%BaseModel.PAGESIZE==0?totalCount/BaseModel.PAGESIZE:totalCount/BaseModel.PAGESIZE+1;
		pageNum = pageNum==0?1:pageNum;
		String pageAction = params.get("pageAction");
		if("first".equals(pageAction)){
			pageNum = 1;
		}else if("pre".equals(pageAction)){
			pageNum -= 1;
		}else if("next".equals(pageAction)){
			pageNum = (pageNum+1)>maxPage?pageNum:pageNum+1;
		}else if("last".equals(pageAction)){
			pageNum = maxPage;
		}
		
		List<Lesson> lessons = Lesson.find(where.toString()).fetch(pageNum,BaseModel.PAGESIZE);
		
		List<Code> timeTypes = Code.find("codeName = ? and state != ?",TIME_TYPE,BaseModel.DELETE).fetch();
		List<Code> lessonTypes = Code.find("codeName = ? and state != ?",LESSON_TYPE,BaseModel.DELETE).fetch();
		List<Code> collections = Code.find("codeName = ? and state != ?",COLLECTION,BaseModel.DELETE).fetch();
		List<School> schools = School.find("state !=?", BaseModel.DELETE).fetch();
		
		
		renderArgs.put("timeType", timeType);
		renderArgs.put("lessonType", lessonType);
		renderArgs.put("collection", collection);
		renderArgs.put("subCollection", subCollection);
		renderArgs.put("school", school);
		renderArgs.put("pageNum", pageNum);
		renderArgs.put("totalCount", totalCount);
		renderArgs.put("pageSize", BaseModel.PAGESIZE);
		
		renderArgs.put("timeTypes", timeTypes);
		renderArgs.put("lessonTypes", lessonTypes);
		renderArgs.put("collections", collections);
		renderArgs.put("schools", schools);
		renderArgs.put("lessons", lessons);
		renderArgs.put("page", "lesson");
		render();
	}
	public static void classDetail(long id){
		Application.loadHead();
		Lesson lesson = Lesson.findById(id);
		List<LessonTable> lessonTables = lesson.lessonTables;
		renderArgs.put("lesson", lesson);
		renderArgs.put("lessonTables",lessonTables);
		
		render();
	}
}
