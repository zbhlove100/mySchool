package controllers;

import java.lang.reflect.Constructor;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import models.CountLog;
import models.User;

import play.data.binding.Binder;
import play.db.Model;
import play.exceptions.TemplateNotFoundException;
import play.i18n.Messages;
import play.mvc.Before;
import play.mvc.Router;
import play.mvc.With;

public class BasicCrud extends CRUD {
	
	@Before
	public static void checkUser(){
		//for flash authorization
			if(request.cookies == null || request.cookies.get("PLAY_SESSION") == null){
				if(params.get("sessionId") != null){
					String ID_KEY = "___ID";
					session.put(ID_KEY, params.get("sessionId"));
					session.put("username",Security.connected());
				}
				//Logger.setUp("TRACE");
			}
			if(Security.isConnected()){
				if(Security.connected() != null){
					renderArgs.put("user",Security.connected());
				}
			}else{
				renderArgs.put("user","GUEST");
			}
			if(countUser()){
				CountLog countLog = new CountLog();
				//countLog.userName = renderArgs.get("user").toString();
				//countLog.ipaddress = request.remoteAddress;
				countLog.save();
			}
			
	}
	private static boolean countUser(){
		if(session.get("PLAY_SESSION") == null){
			session.put("PLAY_SESSION", session.getId());
			return true;
		}else{
			if(!session.getId().equals(session.get("PLAY_SESSION"))){
				return true;
			}
		}
		return false;
	}

	
    private static String allMessage(String message){
        
   	 Object msgs = renderArgs.get("message");
       
   	 String allmessages = "";
   	 
       if(msgs != null){
       	if(renderArgs.get("clear") != null){
       		message = null;
       	}
       	if(msgs instanceof String){
       		allmessages = String.format("%s<br>%s", msgs,(message==null? "":message)); 
       	}else if(msgs instanceof List){
       		List msglist = (List)msgs;
       		
       		if(message != null){
       			msglist.add(message);
       		}
       		for(Object msg:msglist){
       			allmessages = String.format("%s<br>%s", allmessages,msg);
       		}
       	}
        }else{
       	 allmessages = message;
        }    	
       return allmessages;
   }
   
   protected static Map jsonError(String message){
   	return jsonMessage("300",message);
   }   
   
   protected static Map jsonMessage(String message){
   	return jsonMessage("200",message);
   }
   
   protected static Map jsonMessage(String code,String message){
   	
       Map map = new HashMap();     
       map.put( "statusCode", code);
      
       String allmessages = allMessage(message);
                
       if(!"".equals(allmessages))
      	 map.put( "message", allmessages);       
       
       return map;
       //Gson gson = new Gson();
       //String json = gson.toJson(map);
       //return json;
   }
	public static void index() {
        if (getControllerClass() == CRUD.class) {
            forbidden();
        }
        try {
            render();
        } catch (TemplateNotFoundException e) {
        	render("CRUD/index.html");
        }
        
    }

    public static void list(int page, String search, String searchFields, String orderBy, String order) {
        ObjectType type = ObjectType.get(getControllerClass());
        notFoundIfNull(type);
        if (page < 1) {
            page = 1;
        }
        List<Model> objects = type.findPage(page, search, searchFields, orderBy, order, (String) request.args.get("where"));
        Long count = type.count(search, searchFields, (String) request.args.get("where"));
        Long totalCount = type.count(null, null, (String) request.args.get("where"));
        try {
            render(type, objects, count, totalCount, page, orderBy, order);
        } catch (TemplateNotFoundException e) {
            render("CRUD/list.html", type, objects, count, totalCount, page, orderBy, order);
        }
    }

    public static void show(String id) {
        ObjectType type = ObjectType.get(getControllerClass());
        notFoundIfNull(type);
        Model object = type.findById(id);
        notFoundIfNull(object);
        try {
            render(type, object);
        } catch (TemplateNotFoundException e) {
            render("CRUD/show.html", type, object);
        }
    }

    @SuppressWarnings("deprecation")
    public static void attachment(String id, String field) throws Exception {
        ObjectType type = ObjectType.get(getControllerClass());
        notFoundIfNull(type);
        Model object = type.findById(id);
        notFoundIfNull(object);
        Object att = object.getClass().getField(field).get(object);
        if(att instanceof Model.BinaryField) {
            Model.BinaryField attachment = (Model.BinaryField)att;
            if (attachment == null || !attachment.exists()) {
                notFound();
            }
            response.contentType = attachment.type();
            renderBinary(attachment.get(), attachment.length());
        }
        // DEPRECATED
        if(att instanceof play.db.jpa.FileAttachment) {
            play.db.jpa.FileAttachment attachment = (play.db.jpa.FileAttachment)att;
            if (attachment == null || !attachment.exists()) {
                notFound();
            }
            renderBinary(attachment.get(), attachment.filename);
        }
        notFound();
    }

    public static void save(String id) throws Exception {
        ObjectType type = ObjectType.get(getControllerClass());
        notFoundIfNull(type);
        Model object = type.findById(id);
        notFoundIfNull(object);
        Binder.bind(object, "object", params.all());
        validation.valid(object);
        if (validation.hasErrors()) {
            renderArgs.put("error", Messages.get("crud.hasErrors"));
            try {
                render(request.controller.replace(".", "/") + "/show.html", type, object);
            } catch (TemplateNotFoundException e) {
                render("CRUD/show.html", type, object);
            }
        }
        object._save();
        flash.success(Messages.get("crud.saved", type.modelName));
        if (params.get("_save") != null) {
            redirect(request.controller + ".list");
        }
        redirect(request.controller + ".show", object._key());
    }

    public static void blank() throws Exception {
        ObjectType type = ObjectType.get(getControllerClass());
        notFoundIfNull(type);
        Constructor<?> constructor = type.entityClass.getDeclaredConstructor();
        constructor.setAccessible(true);
        Model object = (Model) constructor.newInstance();
        try {
            render(type, object);
        } catch (TemplateNotFoundException e) {
            render("CRUD/blank.html", type, object);
        }
    }

    public static void create() throws Exception {
        ObjectType type = ObjectType.get(getControllerClass());
        notFoundIfNull(type);
        Constructor<?> constructor = type.entityClass.getDeclaredConstructor();
        constructor.setAccessible(true);
        Model object = (Model) constructor.newInstance();
        Binder.bind(object, "object", params.all());
        validation.valid(object);
        if (validation.hasErrors()) {
            renderArgs.put("error", Messages.get("crud.hasErrors"));
            try {
                render(request.controller.replace(".", "/") + "/blank.html", type, object);
            } catch (TemplateNotFoundException e) {
                render("CRUD/blank.html", type, object);
            }
        }
        object._save();
        flash.success(Messages.get("crud.created", type.modelName));
        if (params.get("_save") != null) {
            redirect(request.controller + ".list");
        }
        if (params.get("_saveAndAddAnother") != null) {
            redirect(request.controller + ".blank");
        }
        redirect(request.controller + ".show", object._key());
    }

    public static void delete(String id) {
        ObjectType type = ObjectType.get(getControllerClass());
        notFoundIfNull(type);
        Model object = type.findById(id);
        notFoundIfNull(object);
        try {
            object._delete();
        } catch (Exception e) {
            flash.error(Messages.get("crud.delete.error", type.modelName));
            redirect(request.controller + ".show", object._key());
        }
        flash.success(Messages.get("crud.deleted", type.modelName));
        redirect(request.controller + ".list");
    }
    
}
