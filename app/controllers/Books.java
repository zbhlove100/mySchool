package controllers;

import java.util.ArrayList;
import java.util.List;

import models.BaseModel;
import models.Book;
import models.Code;
import models.Lesson;
import models.LessonSystem;
import models.LessonTable;

public class Books extends BasicCrud{
	
	public static void list(){

		Application.loadHead();
		Long collection = params.get("collection",Long.class);
		int  pageNum = params.get("pageNum",int.class);
		//make the search condition
		StringBuffer where = new StringBuffer("state <> '"+BaseModel.DELETE+"'");
		
		if(collection!=null&&collection!=0l){
			where.append("and lesson_system.id = '" +collection+"'");
		}
		
		//get the page number
		int totalCount = (int) Book.count(where.toString());
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
		
		List<Book> books = Book.find(where.toString()).fetch(pageNum,BaseModel.PAGESIZE);
		
		List<LessonSystem> collections = LessonSystem.find("state != ?",BaseModel.DELETE).fetch();
		
		
		renderArgs.put("collection", collection);
		renderArgs.put("pageNum", pageNum);
		renderArgs.put("totalCount", totalCount);
		renderArgs.put("pageSize", BaseModel.PAGESIZE);
		
		renderArgs.put("collections", collections);
		renderArgs.put("lessons", books);
		renderArgs.put("page", "lesson");
		render();
	
	}
	public static void listDetail(){
		Long collection = params.get("collection",Long.class);
		int  pageNum = params.get("pageNum",int.class);
		//make the search condition
		StringBuffer where = new StringBuffer("state <> '"+BaseModel.DELETE+"'");
		
		if(collection!=null&&collection!=0l){
			where.append("and lesson_system.id = '" +collection+"'");
		}
		
		//get the page number
		int totalCount = (int) Book.count(where.toString());
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
		
		List<Book> books = Book.find(where.toString()).fetch(pageNum,BaseModel.PAGESIZE);
		
		List<LessonSystem> collections = LessonSystem.find("state != ?",BaseModel.DELETE).fetch();
		
		
		renderArgs.put("collection", collection);
		renderArgs.put("pageNum", pageNum);
		renderArgs.put("totalCount", totalCount);
		renderArgs.put("pageSize", BaseModel.PAGESIZE);
		
		renderArgs.put("collections", collections);
		renderArgs.put("lessons", books);
		renderArgs.put("page", "lesson");
		render();
	}
	public static void bookDetail(long id){
		Application.loadHead();
		Book book = Book.findById(id);
		renderArgs.put("lesson", book);
		render();
	}
}
