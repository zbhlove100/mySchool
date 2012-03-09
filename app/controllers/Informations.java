package controllers;

import java.util.List;

import models.BaseModel;
import models.Information;
import models.Lesson;

public class Informations extends BasicCrud{
	public static void list(){
		Application.loadHead();
		
		String informationType = params.get("informationType");
		int  pageNum = params.get("pageNum",int.class);
		//make the search condition
		
		StringBuffer where = new StringBuffer("state <> '"+BaseModel.DELETE+"'");
		
		if(informationType!=null&&!"".equals(informationType)){
			where.append("and type = '" +informationType+"'");
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
		
		List<Information> informations = Information.find(where.toString()).fetch(pageNum,BaseModel.PAGESIZE);
		
		renderArgs.put("informationType", informationType);
		renderArgs.put("informations", informations);
		renderArgs.put("page", "index");
		render();
	}
}
