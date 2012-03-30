package controllers;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.persistence.Query;

import play.db.jpa.JPA;

import models.BaseModel;
import models.Code;
import models.Information;
import models.InformationLog;

public class Informations extends BasicCrud{
	public static String INFORMATION_TYPE = "information_type";
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
		int totalCount = (int) Information.count(where.toString());
		int maxPage = totalCount%BaseModel.INFORMATIONPAGESIZE==0?totalCount/BaseModel.INFORMATIONPAGESIZE:totalCount/BaseModel.INFORMATIONPAGESIZE+1;
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
		
		List<Information> informations = Information.find(where.toString()).fetch(pageNum,BaseModel.INFORMATIONPAGESIZE);
		
		renderArgs.put("informationType", informationType);
		renderArgs.put("informations", informations);
		renderArgs.put("page", "index");
		
		renderArgs.put("pageNum", pageNum);
		renderArgs.put("totalCount", totalCount);
		renderArgs.put("pageSize", BaseModel.INFORMATIONPAGESIZE);
		getHotInformation();
		render();
	}
	public static void listDetail(){
		String informationType = params.get("informationType");
		int  pageNum = params.get("pageNum",int.class);
		//make the search condition
		
		StringBuffer where = new StringBuffer("state <> '"+BaseModel.DELETE+"'");
		
		if(informationType!=null&&!"".equals(informationType)){
			where.append("and type = '" +informationType+"'");
		}
		
		//get the page number
		int totalCount = (int) Information.count(where.toString());
		int maxPage = totalCount%BaseModel.INFORMATIONPAGESIZE==0?totalCount/BaseModel.INFORMATIONPAGESIZE:totalCount/BaseModel.INFORMATIONPAGESIZE+1;
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
		
		List<Information> informations = Information.find(where.toString()).fetch(pageNum,BaseModel.INFORMATIONPAGESIZE);

		List<Code> informationTypes = Code.find("codeName = ? and state != ?",INFORMATION_TYPE,BaseModel.DELETE).fetch();
		
		renderArgs.put("informationType", informationType);
		renderArgs.put("informations", informations);
		renderArgs.put("informationTypes", informationTypes);
		renderArgs.put("pageNum", pageNum);
		renderArgs.put("totalCount", totalCount);
		renderArgs.put("pageSize", BaseModel.INFORMATIONPAGESIZE);
		getHotInformation();
		render();
	}
	public static void detail(long id){
		Application.loadHead();
		Information information = Information.findById(id);
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
		String currentDate = df.format(new Date());
		InformationLog log = InformationLog.find("date = ? and information =?", currentDate,information).first();
		if(log == null){
			log = new InformationLog();
			log.date = currentDate;
			log.information = information;
		}
		log.count ++;
		log.save();
		getHotInformation();
		renderArgs.put("information", information);
		
		render();
	}
	public static String getHotInformation(){
		Query query = JPA.em().createNativeQuery("select A.id,A.title,B.num from information A, \n" +
				"(select X.information_id as id,sum(X.count) num from information_log X group by X.information_id desc limit 6) B \n" +
				"where A.id = B.id");
		List results = query.getResultList();
		List<Information> hotInformations = new ArrayList<Information>();
		for(Iterator iterator = results.iterator(); iterator.hasNext(); ){
			Object[] rows = (Object[]) iterator.next();
			Information informationT = Information.findById(Long.parseLong(rows[0].toString()));
			hotInformations.add(informationT);
		}
		renderArgs.put("hotInformations", hotInformations);
		return null;
	}
}
