package controllers;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import models.spec.BaseModel;
import models.spec.Where;
import play.Logger;
import play.Play;
import play.data.binding.Binder;
import play.data.validation.MaxSize;
import play.data.validation.Password;
import play.data.validation.Required;
import play.db.jpa.Model;
import play.db.jpa.GenericModel.JPAQuery;
import play.exceptions.TemplateNotFoundException;
import play.i18n.Messages;
import play.mvc.Before;
import play.mvc.Controller;
import play.mvc.Router;
import play.utils.Java;

//modified by liubs
public abstract class CLOUDPICRUD extends Application{

    @Before
    public static void addType() throws Exception {
        ObjectType type = ObjectType.get(getControllerClass());
        renderArgs.put("type", type);
    }
    
    //for debug info
    protected static void showReqinfo(){
        StringBuffer  reqinfo = new StringBuffer();
        Map<String, String[]> map = params.all();
        for (String key : map.keySet()) {
            String[] values = map.get(key);
            reqinfo.append(key+"=");
            for (int i = 0; i < values.length; i++) {
            	reqinfo.append(values[i]);//StringUtils.trimToEmpty(values[i]);             
              }
            reqinfo.append("&");            
        }        
       Logger.info("Request %s",reqinfo);    	
    }
    
    protected static String getParam(String key){
    	return getParam(key,null);
    }
    
    protected static String getParam(String key,String defaultval){
    	String val = params.get(key);
    	if("".equals(val) || val == null){
    		return defaultval;
    	}
    	return val;
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
    
    protected static Map forwardJson(String tabId,String url){
    	return forwardJson( tabId, url, null);
    }
    
    protected static Map forwardJson(String tabId,String url,String message){
        Map map = new HashMap();     
        map.put( "statusCode", "200");    
        
        String selfnavTabId = params.get("navTabId");
         if( selfnavTabId!= null){
        	 if(!"".equals(selfnavTabId))
        		 map.put("navTabId",  selfnavTabId);
         }else{
        	 map.put( "navTabId", tabId);
         }
        map.put( "forwardUrl", url); 
        
        String allmessages = allMessage(message);
           
        if(!"".equals(allmessages))
          	 map.put( "message", allmessages);           
        
        return map;
        
        //Gson gson = new Gson();
        //String json = gson.toJson(map);
        //return json;        
    }
    protected static Map forwardJson_error(String tabId,String url,String message){
        Map map = new HashMap();     
        map.put( "statusCode", "300");    
        
        String selfnavTabId = params.get("navTabId");
         if( selfnavTabId!= null){
        	 if(!"".equals(selfnavTabId))
        		 map.put("navTabId",  selfnavTabId);
         }else{
        	 map.put( "navTabId", tabId);
         }
        map.put( "forwardUrl", url); 
        
        String allmessages = allMessage(message);
           
        if(!"".equals(allmessages))
          	 map.put( "message", allmessages);           
        
        return map;
        
        //Gson gson = new Gson();
        //String json = gson.toJson(map);
        //return json;        
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
    
    protected static void _list(int pageNum, String search, String searchFields, String orderField, String order,String where, Object ...fieldvals) {
    	__list(null, pageNum, search, searchFields, orderField, order, where, fieldvals);
    }
    
    /*
     * added by zwz.
     * 
     * entityclass must not be null.
     * 
     * used to query "entityclass" specified class, but render according to current controler.
     * 
     */
    protected static void __list_zwz(Class entityclass,String where, Object ...fieldvals) {
   	 
    	ObjectType render_type = null, query_type=null;
    	int pageNum = Integer.parseInt(params.get("pageNum")==null?"1":params.get("pageNum"));
        String search = params.get("search");
        String searchFields = params.get("searchFields");
        String orderField = params.get("orderField");
        String order = params.get("order");
    	 
        render_type = ObjectType.get(getControllerClass());
        query_type = ObjectType.get(getControllerClass(),entityclass);
        
        //System.out.println("render_type:"+render_type.modelName);
       //System.out.println("query_type:"+query_type.modelName);
    	 
        notFoundIfNull(render_type);
        notFoundIfNull(query_type);
        
         
        if("".equals(where)){
        	 where = null;
        	 fieldvals = null;
         }
        if(fieldvals != null && fieldvals.length ==0){
        	fieldvals = null;
         }
        if (BaseModel.class.isAssignableFrom(entityclass)){       	
        	 where = String.format("%s state != '%s'",(where==null? "":"("+where+") and"),BaseModel.DELETE);
         }
        List<Model> objects = query_type.findPage(pageNum, search, searchFields, orderField, order, where, fieldvals);
        Long totalCount = query_type.count(search, searchFields, where, fieldvals);
        int numPerPage = getPageSize();
        try {
            render(render_type, objects, totalCount, numPerPage, pageNum, orderField, order, params);
        } catch (TemplateNotFoundException e) {
            render("CRUD/list.html", render_type, objects, totalCount,numPerPage, pageNum, orderField, order);
        }    	
    }
    
    private static void __list(Class entityclass,int pageNum, String search, String searchFields, String orderField, String order,String where, Object ...fieldvals) {
    	 
    	ObjectType type = null;
    	 
    	 if(entityclass != null)
    		 type = ObjectType.get(getControllerClass(),entityclass);
    	 else{
    		 type = ObjectType.get(getControllerClass());
    	 }
        notFoundIfNull(type);
         
        if(entityclass == null)
        	entityclass = type.getEntityClassForController(getControllerClass());
         
        if("".equals(where)){
        	 where = null;
        	 fieldvals = null;
         }
        if(fieldvals != null && fieldvals.length ==0){
        	fieldvals = null;
         }
        if (BaseModel.class.isAssignableFrom(entityclass)){
        	 where = String.format("%s state != '%s'",(where==null? "":"("+where+") and"),BaseModel.DELETE);
         }
        List<Model> objects = type.findPage(pageNum, search, searchFields, orderField, order, where, fieldvals);
        Long totalCount = type.count(search, searchFields, where, fieldvals);
        int numPerPage = getPageSize();
        try {
            render(type, objects, totalCount, numPerPage, pageNum, orderField, order, params);
        } catch (TemplateNotFoundException e) {
            render("CRUD/list.html", type, objects, totalCount,numPerPage, pageNum, orderField, order);
        }    	
    }
    
    protected static void __list(String where, Object ...fields) {
    	__list(null, where, fields);
    }
    
    protected static void __list(Class entityclass, String where, Object ...fields) {
    	
        int pageNum = Integer.parseInt(params.get("pageNum")==null?"1":params.get("pageNum"));
        String search = params.get("search");
        String searchFields = params.get("searchFields");
        String orderField = params.get("orderField");
        String order = params.get("order");
        
        __list(entityclass, pageNum,search,searchFields,orderField,order,where,fields);
    }
    
    protected static void _list(Where where) {
    	
    	_list(null,where);
         
    }
    protected static void _list(Class entityclass, Where where) {
    	
    	if(where != null){
    		__list(where.where(),where.params().toArray());
    	}else{
    		__list(null);
    	}
    }
    
    public static void list() {
    	_list(null);
    }
    
   public static void edit(String id) {
	   _show(id,"edit");
    }
   
   public static void show(String id){
	   _show(id,"show");
   }
  
   protected static void _show(Model object,String template){
       notFoundIfNull(object);
       try {
    	    String type = object.getClass().getSimpleName().toLowerCase();
       	 String pathtemp = String.format("%ss/%s.html", type,template);
           render(pathtemp, object);
       } catch (TemplateNotFoundException e) {
       	 Logger.error("Raise Exception:%s",e);
          render("CRUD/show.html", object);
       }
       
   }   
   
   protected static void _show(String id,String template) {
        ObjectType type = ObjectType.get(getControllerClass());
        notFoundIfNull(type);
        Model object = type.findById(id);
         
         _show(object,template);
    }
   	
   
   private static void _save(Model object, ObjectType type) throws Exception {
       validation.valid(object);
       if (validation.hasErrors()) {
    	  
			Logger.debug("Validation error: %s is %s", validation.errors().get(0).getKey(), validation.errors().get(0));

			if (request.format.equals("json")) {
				renderJSON(jsonError(Messages.get("crud.hasErrors")));
			} else {
				renderArgs.put("error", Messages.get("crud.hasErrors"));
				try {
					render(request.controller.replace(".", "/") + "/show.html",
							type, object);
				} catch (TemplateNotFoundException e) {
					render("CRUD/show.html", type, object);
				}
			}
       }
       
       object._save();
       if(request.format.equals("json")){  
  	     	 String typename = type.name.toLowerCase();
  	     	 renderJSON(forwardJson(typename,String.format("/%s/list",typename),Messages.get("crud.saved", type.modelName)));
       }else{        
	        flash.success(Messages.get("crud.saved", type.modelName));
	        if (params.get("_save") != null) {
	            redirect(request.controller + ".list");
	         }
	        redirect(request.controller + ".show", object._key());
        }    	   
    }
    protected static void _save(Model object) throws Exception {
    	 
    	 ObjectType type = ObjectType.get(getControllerClass());
    	 _save(object,type);
    }
    
    protected static void _save(String id) throws Exception {
        ObjectType type = ObjectType.get(getControllerClass());
        notFoundIfNull(type);
        Model object = type.findById(id);
        notFoundIfNull(object);
        Binder.bind(object, "object", params.all());
        _save(object,type);    	
    }
    
    public static void save(String id) throws Exception {
    	_save(id);
    }
    
    private static void _blank(Model object, ObjectType type) throws Exception {
        try {
            render(type, object);
        } catch (TemplateNotFoundException e) {
            render("CRUD/blank.html", type, object);
        }
    }
    protected static void _blank(Model object) throws Exception {
    	ObjectType type = ObjectType.get(getControllerClass());
    	_blank(object,type);
    }    
    
    protected static void _blank() throws Exception{
		ObjectType type = ObjectType.get(getControllerClass());
		notFoundIfNull(type);
		Constructor<?> constructor = type.entityClass.getDeclaredConstructor();
		constructor.setAccessible(true);
		Model object = (Model) constructor.newInstance();
		_blank(object, type);
    }
    
    public static void blank() throws Exception {
    	_blank();
    }

    private static void _create(Model object,ObjectType type) throws Exception{
    	
		validation.valid(object);
		if (validation.hasErrors()) {
			
			Logger.debug("Validation error: %s is %s",validation.errors().get(0).getKey(), validation.errors().get(0));
			if (request.format.equals("json")) {
				renderJSON(jsonError(Messages.get("crud.hasErrors")));
			} else {
				renderArgs.put("error", Messages.get("crud.hasErrors"));
				try {
					render(request.controller.replace(".", "/") + "/blank.html",
							type, object);
				} catch (TemplateNotFoundException e) {
					render("CRUD/blank.html", type, object);
				}
			}
		}
		object._save();

		if (request.format.equals("json")) {
			// renderJSON("{\"statusCode\":\"200\",  \"navTabId\":\"globalsettings\",\"forwardUrl\":\"/settings/list\"}");
			String typename = type.name.toLowerCase();
			renderJSON(forwardJson(typename,
					String.format("/%s/list", typename),
					Messages.get("crud.created", type.modelName)));
		} else {

			flash.success(Messages.get("crud.created", type.modelName));
			if (params.get("_save") != null) {
				redirect(request.controller + ".list");
			}
			if (params.get("_saveAndAddAnother") != null) {
				redirect(request.controller + ".blank");
			}
			redirect(request.controller + ".show", object._key());
		}  	
    }
    
    protected static void _create(Model object) throws Exception{
    	ObjectType type = ObjectType.get(getControllerClass());
    	_create(object,type);
    }
    
    protected static void _create() throws Exception {

    	ObjectType type = ObjectType.get(getControllerClass());
        notFoundIfNull(type);
        Constructor<?> constructor = type.entityClass.getDeclaredConstructor();
        constructor.setAccessible(true);
        Model object = (Model) constructor.newInstance();
        Binder.bind(object, "object", params.all());
        _create(object,type);
        
    }
    
    public static void create() throws Exception {
    	_create();
    }
    
    protected static Field getField(Class entityclass, String fieldname){
    	Field field = null;
		try{
			field = entityclass.getDeclaredField(fieldname);
		}catch(Exception e){
			Logger.info("Fail to get field %s", fieldname);
		}    	
		return field;
    }
    protected static void setField(Field field, Object object, Object value){
		try{
			field.set(object, value);
		}catch(Exception e){
			Logger.info("Fail to set field %s", field);
		}    	
    }
    protected static void _delete(Model object) {
       notFoundIfNull(object);    	
    	List objects  = new ArrayList();
    	objects.add(object);
    	_delete(objects);
    }
    protected static void _delete(List<? extends Model>objects) {
    	ObjectType type = ObjectType.get(getControllerClass());
    	_delete(objects,type);
    }
    
    protected static void _delete(List<? extends Model>objects, ObjectType type ) {
       
    	Class entityclass = type.getEntityClassForController(getControllerClass());
        
        boolean islogicdelete = false;        
        if (BaseModel.class.isAssignableFrom(entityclass)){
        	islogicdelete = true;
         } 
        
        for(Model object:objects){
			if (islogicdelete) {
				Field statefield = getField(entityclass,"state");
				if (statefield != null) {
					setField(statefield,object, BaseModel.DELETE);
					Field rdfield = getField(entityclass,"removedAt");
					if (rdfield != null)
						setField(rdfield,object, new Date(java.lang.System.currentTimeMillis()));
					object._save();
				}
	
			} else {
				object._delete();
			}       
        }
       if(request.format.equals("json")){  
 	    	  String typename = type.name.toLowerCase();
 	    	  renderJSON(forwardJson(typename,String.format("/%s/list",typename),Messages.get("crud.deleted", type.modelName)));
       }else{
          flash.success(Messages.get("crud.deleted", type.modelName));
          redirect(request.controller + ".list");        	
       }        
    }
    
    public static void delete(String id) {
    	
        ObjectType type = ObjectType.get(getControllerClass());
        notFoundIfNull(type);
        Model object = type.findById(id);
        
        _delete(object);
    }
    
    public static void deletes(String ids) {
    	
    	  ObjectType type = ObjectType.get(getControllerClass());
	     notFoundIfNull(type);
	     
	     String where = String.format("id in (%s)", ids);
		 
		 List<Model> objects = type.find(where);
		      
		 _delete(objects,type);
		     
    }
    
    protected static ObjectType createObjectType(Class<? extends Model> entityClass) {
        return new ObjectType(entityClass);
    }

    // ~~~~~~~~~~~~~
    @Retention(RetentionPolicy.RUNTIME)
    @Target(ElementType.TYPE)
    public @interface For {
        Class<? extends Model> value();
    }
    
    @Retention(RetentionPolicy.RUNTIME)
    @Target(ElementType.FIELD)
    public @interface Exclude {}

    @Retention(RetentionPolicy.RUNTIME)
    @Target(ElementType.FIELD)
    public @interface Hidden {}

    static int getPageSize() {
    	String pagesize = params.get("numPerPage");
    	if( pagesize != null && !pagesize.equals("")){
    		session.put("pagesize",pagesize);
    	}else{
    		pagesize = session.get("pagesize");
    	}
    	try{
    		return Integer.parseInt(pagesize);
    	}catch(Exception e){
    		return Integer.parseInt(Play.configuration.getProperty("crud.pageSize", "20"));
    	}
    }

    public static class ObjectType implements Comparable<ObjectType> {

        public Class<? extends Controller> controllerClass;
        public Class<? extends Model> entityClass;
        public String name;
        public String modelName;
        public String controllerName;
        public String keyName;

        public ObjectType(Class<? extends Model> modelClass) {
            this.modelName = modelClass.getSimpleName();
            this.entityClass = modelClass;
            
            this.keyName = Model.Manager.factoryFor(entityClass).keyName();
        }

        @SuppressWarnings("unchecked")
        public ObjectType(String modelClass) throws ClassNotFoundException {
            this((Class<? extends Model>) Play.classloader.loadClass(modelClass));
        }

        public static ObjectType forClass(String modelClass) throws ClassNotFoundException {
            return new ObjectType(modelClass);
        }
       
        public static ObjectType get(Class<? extends Controller> controllerClass,Class<? extends Model> entityClass) {
            //Class<? extends Model> entityClass = getEntityClassForController(controllerClass);
          if (entityClass == null || !Model.class.isAssignableFrom(entityClass)) {
                return null;
           }
          ObjectType type;
          try {
                type = (ObjectType) Java.invokeStaticOrParent(controllerClass, "createObjectType", entityClass);
            } catch (Exception e) {
                Logger.error(e, "Couldn't create an ObjectType. Use default one.");
                type = new ObjectType(entityClass);
            }
          
          type.name = controllerClass.getSimpleName().replace("$", "");
          type.controllerName = controllerClass.getSimpleName().toLowerCase().replace("$", "");
          type.controllerClass = controllerClass;
          
          return type;           
        }
        
        public static ObjectType get(Class<? extends Controller> controllerClass) {
            Class<? extends Model> entityClass = getEntityClassForController(controllerClass);
            return get(controllerClass,entityClass);
         }

        @SuppressWarnings("unchecked")
        public static Class<? extends Model> getEntityClassForController(Class<? extends Controller> controllerClass) {
            if (controllerClass.isAnnotationPresent(For.class)) {
                return ((For) (controllerClass.getAnnotation(For.class))).value();
            }
            for(Type it : controllerClass.getGenericInterfaces()) {
                if(it instanceof ParameterizedType) {
                    ParameterizedType type = (ParameterizedType)it;
                    if (((Class<?>)type.getRawType()).getSimpleName().equals("CRUDWrapper")) {
                        return (Class<? extends Model>)type.getActualTypeArguments()[0];
                    }
                }
            }
            String name = controllerClass.getSimpleName().replace("$", "");
            name = "models." + name.substring(0, name.length() - 1);
            try {
                return (Class<? extends Model>) Play.classloader.loadClass(name);
            } catch (ClassNotFoundException e) {
                return null;
            }
        }

        public Object getListAction() {
            return Router.reverse(controllerClass.getName().replace("$", "") + ".list");
        }

        public Object getBlankAction() {
            return Router.reverse(controllerClass.getName().replace("$", "") + ".blank");
        }

        public Long count(String search, String searchFields, String where, Object... fieldvals) {
           //return Model.Manager.factoryFor(entityClass).count(searchFields == null ? new ArrayList<String>() : Arrays.asList(searchFields.split("[ ]")), search, where);
        	StringBuffer allwhere = new StringBuffer();
        	
        	List<Object> allparams = new ArrayList();
        	
        	if(search != null && searchFields != null && !"".equals(searchFields) && !"".equals(search)){
        		
        		allwhere.append("(");
            	String [] sfs = searchFields.split(",");
            	for(String sf: sfs){
            		if(!"".equals(sf)){
            			allwhere.append(String.format("%s like ? or ",sf));
            			allparams.add(search+"%%");
            		}
            	}
            	allwhere.setLength(allwhere.length()-3);
            	allwhere.append(") ");
        	}
        	if( where != null && !"".equals(where)){
        		if(allwhere.length() > 0)
        			allwhere.append(" and ");        		
        		allwhere.append(where);
        		if(fieldvals != null){
        			Collections.addAll(allparams, fieldvals);
        		}
        	}
        	
           try{
           	 Method m = entityClass.getMethod("count", String.class, Object[].class);
           	 return (Long)m.invoke(null, allwhere.toString(), allparams.toArray());
           }catch(Exception e){
           	 e.printStackTrace();
             }
           
        	return 0l;
        	
        }

        @SuppressWarnings("unchecked")
        public List<Model> findPage(int page, String search, String searchFields, String orderBy, String order, String where, Object... fieldvals) {
        	
        	StringBuffer allwhere = new StringBuffer();
        	
           if (page < 1) {
        	   page = 1;
            }
           
        	List<Object> allparams = new ArrayList();
        	
        	if(search != null && searchFields != null && !"".equals(searchFields) && !"".equals(search)){
        		
        		allwhere.append("(");
            	String [] sfs = searchFields.split(",");
            	for(String sf: sfs){
               	if(!"".equals(sf)){
            			allwhere.append(String.format("%s like ? or ",sf));
            			allparams.add(search+"%%");
            		}
            	}
            	allwhere.setLength(allwhere.length()-3);
            	allwhere.append(") ");
        	}
        	
        	if( where != null && !"".equals(where)){
        		if(allwhere.length() > 0)
        			allwhere.append(" and ");
        		allwhere.append(where);
        		if(fieldvals != null){
        			Collections.addAll(allparams, fieldvals);
        		}
        	}
          
        	if ("".equals(orderBy) || orderBy == null) {
                orderBy = "id";
            }
           
            if (order == null || (!order.equals("ASC") && !order.equals("DESC"))) {
                order = "ASC";
            }
          
           //allwhere.append(" order by ? "+order);
           //allparams.add(orderBy);
          
           allwhere.append(" order by "+orderBy+" "+order);
           //allparams.add(orderBy);
           
           try{
        	     Method m = entityClass.getMethod("find", String.class, Object[].class);
        	     JPAQuery query = (JPAQuery)m.invoke(null, allwhere.toString(), allparams.toArray());
           	 return query.fetch(page, getPageSize());
           	 
           }catch(Exception e){
           	 e.printStackTrace();
             }             
             
           return new ArrayList<Model>();
           
        	//return play.db.Model.Manager.factoryFor(entityClass).fetch((page - 1) * getPageSize(), getPageSize(), orderBy, order, searchFields == null ? new ArrayList<String>() : Arrays.asList(searchFields.split("[ ]")), search, where);
        }

        public Model findById(String id) {
            if (id == null) return null;
            try{
            	 Method m = entityClass.getMethod("findById", Object.class);
            	 return (Model)m.invoke(null, Long.parseLong(id));
            }catch(Exception e){
            	 e.printStackTrace();
              }
            return null;
            //return Model.Manager.factoryFor(entityClass).findById(id);
        }
       
        public List<Model> find(String querystr, Object ...params) {
            try{
       	     Method m = entityClass.getMethod("find", String.class, Object[].class);
       	     JPAQuery query = (JPAQuery)m.invoke(null, querystr, params);
       	     return query.fetch();
          	 
            }catch(Exception e){
          	 	e.printStackTrace();
             }
           return new ArrayList<Model>();
        }
        
        public List<ObjectField> getFields() {
            List<ObjectField> fields = new ArrayList<ObjectField>();
            List<ObjectField> hiddenFields = new ArrayList<ObjectField>();
            for (Model.Property f : Model.Manager.factoryFor(entityClass).listProperties()) {
                ObjectField of = new ObjectField(f);                
                if (of.type != null) {
                    if (of.type.equals("hidden")) {
                        hiddenFields.add(of);
                    } else {
                        fields.add(of);
                    }
                }
            }

            hiddenFields.addAll(fields);
            return hiddenFields;
        }

        public ObjectField getField(String name) {
            for (ObjectField field : getFields()) {
                if (field.name.equals(name)) {
                    return field;
                }
            }
            return null;
        }

        public int compareTo(ObjectType other) {
            return modelName.compareTo(other.modelName);
        }

        @Override
        public String toString() {
            return modelName;
        }

        public static class ObjectField {

            private Model.Property property;
            public String type = "unknown";
            public String name;
            public boolean multiple;
            public boolean required;

            @SuppressWarnings("deprecation")
            public ObjectField(Model.Property property) {
                Field field = property.field;
                this.property = property;
                if (CharSequence.class.isAssignableFrom(field.getType())) {
                    type = "text";
                    if (field.isAnnotationPresent(MaxSize.class)) {
                        int maxSize = field.getAnnotation(MaxSize.class).value();
                        if (maxSize > 100) {
                            type = "longtext";
                        }
                    }
                    if (field.isAnnotationPresent(Password.class)) {
                        type = "password";
                    }
                }
                if (Number.class.isAssignableFrom(field.getType()) || field.getType().equals(double.class) || field.getType().equals(int.class) || field.getType().equals(long.class)) {
                    type = "number";
                }
                if (Boolean.class.isAssignableFrom(field.getType()) || field.getType().equals(boolean.class)) {
                    type = "boolean";
                }
                if (Date.class.isAssignableFrom(field.getType())) {
                    type = "date";
                }
                if (property.isRelation) {
                    type = "relation";
                }
                if (property.isMultiple) {
                    multiple = true;
                }
                if(Model.BinaryField.class.isAssignableFrom(field.getType()) || /** DEPRECATED **/ play.db.jpa.FileAttachment.class.isAssignableFrom(field.getType())) {
                    type = "binary";
                }
                if (field.getType().isEnum()) {
                    type = "enum";
                }
                if (property.isGenerated) {
                    type = null;                   
                }
                if (field.isAnnotationPresent(Required.class)) {
                    required = true;
                }
                if (field.isAnnotationPresent(Hidden.class)) {
                    type = "hidden";
                }
                if (field.isAnnotationPresent(Exclude.class)) {
                    type = null;
                }
                if (java.lang.reflect.Modifier.isFinal(field.getModifiers())) {
                    type = null;
                }
                name = field.getName();
            }

            public List<Object> getChoices() {
                return property.choices.list();
            }
        }
    }
}
