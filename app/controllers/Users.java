package controllers;

public class Users  extends BasicCrud{
	
	public static void loginPage(){
		render();
	}
	public static void login(String email,String password){
		boolean remeber = params.get("rememberUsername",boolean.class);
		try {
			Secure.authenticate(email, password,remeber);
		} catch (Throwable e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
