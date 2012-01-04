package controllers;

public class Users  extends BasicCrud{
	
	public static void loginPage(){
		render();
	}
	public static void login(String username,String passwd){
		if(username.equals(passwd)){
			renderJSON(jsonMessage("login"));
		}
	}
}
