package com.wang.comm;

public class Ceshi {

	public static String s1=null;
	
	public static void main(String[] args) {
		// TODO 自动生成的方法存根
		
	SimpleRead re=new SimpleRead();
	while(true) {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		if(re.getflag()==1) {
System.out.println("re"+re.gets());
break;
}
		else {
			System.out.println(re.getflag());	
		}
		}
	}

}
