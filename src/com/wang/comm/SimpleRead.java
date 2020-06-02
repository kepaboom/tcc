package com.wang.comm;

import java.io.*;
	import java.util.*;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;

import gnu.io.CommPortIdentifier;
import gnu.io.PortInUseException;
import gnu.io.SerialPort;
import gnu.io.SerialPortEvent;
import gnu.io.SerialPortEventListener;
import gnu.io.UnsupportedCommOperationException;

	 
	public class SimpleRead implements Runnable, SerialPortEventListener {
		   static int cnt=0;
		static  String s="";
		int flag=0;
		static String s1="";
	    static CommPortIdentifier portId;
	    static Enumeration portList;//枚举类
	    InputStream inputStream;
	    SerialPort serialPort;
	    Thread readThread;
	    private BlockingQueue<String> msgQueue = new LinkedBlockingQueue<String>();

	    public SimpleRead() {
	    	 portList = CommPortIdentifier.getPortIdentifiers();/*不带参数的getPortIdentifiers方法获得一个枚举对象，该对象又包含了系统中管理每个端口的CommPortIdentifier对象。注意这里的端口不仅仅是指串口，也包括并口。这个方法还可以带参数。getPortIdentifiers(CommPort)获得与已经被应用程序打开的端口相对应的CommPortIdentifier对象。 getPortIdentifier(String portName)获取指定端口名（比如“COM1”）的CommPortIdentifier对象。*/
//	    	 System.out.println(1);
	    	        while (portList.hasMoreElements()) {	           
	    	        	portId = (CommPortIdentifier) portList.nextElement();
	    	            if (portId.getPortType() == CommPortIdentifier.PORT_SERIAL)/*getPortType方法返回端口类型*/ {
	    	                 if (portId.getName().equals("COM1"))/* 找Windows下的第一个串口*/ {
//	    	                if (portId.getName().equals("COM1"))/*找Unix-like系统下的第一个串口*/ {
	    	                	 try {
//	    	         	        	System.out.println(2);
	    	         	            serialPort = (SerialPort) portId.open("SimpleReadApp", 2000);/* open方法打开通讯端口，获得一个CommPort对象。它使程序独占端口。如果端口正被其他应用程序占用，将使用 CommPortOwnershipListener事件机制，传递一个PORT_OWNERSHIP_REQUESTED事件。每个端口都关联一个 InputStream 何一个OutputStream。如果端口是用open方法打开的，那么任何的getInputStream都将返回相同的数据流对象，除非有close 被调用。有两个参数，第一个为应用程序名；第二个参数是在端口打开时阻塞等待的毫秒数。*/
	    	         	        } catch (PortInUseException e) {}
	    	                 try {
	    	                     inputStream = serialPort.getInputStream();/*获取端口的输入流对象*/
	    	         	        } catch (IOException e) {}
	    	         	    try { 	            
	    	         	    	serialPort.addEventListener(this);/*注册一个SerialPortEventListener事件来监听串口事件*/
	    	         	    } catch (TooManyListenersException e) {}
	    	         	 
	    	         	        serialPort.notifyOnDataAvailable(true);/*数据可用*/
	    	           	        try {
	    	         	            serialPort.setSerialPortParams(1200,
	    	         	                SerialPort.DATABITS_8,
	    	                         SerialPort.STOPBITS_1,
	    	                         SerialPort.PARITY_NONE);/*设置串口初始化参数，依次是波特率，数据位，停止位和校验*/
	    	         	        } catch (UnsupportedCommOperationException e) {}
	    	          
	    	         	        readThread = new Thread(this);
	    	         	        readThread.start();
	                    } 	         }
	    	        }
	       
	    }
 public String  gets(){
//	 System.out.println("simple"+s1);
	 return s1;
 }
 public int getflag() {
	 return flag;
 }
 public void sets() {
	this.s1=s;
 }
	    public void run() {
	    	  try {
	    		  	 Thread.sleep(200000);
	    		  } catch (InterruptedException e) {}
	        
	        
	    }
	 
	//串口事件
    public void serialEvent(SerialPortEvent event) {
	 
	        switch(event.getEventType()) {
	        case SerialPortEvent.BI:/*Break interrupt,通讯中断*/
	        case SerialPortEvent.OE:/*Overrun error，溢位错误*/	        
	        case SerialPortEvent.FE:/*Framing error，传帧错误*/ 	        
	        case SerialPortEvent.PE:/*Parity error，校验错误*/
	        case SerialPortEvent.CD:/*Carrier detect，载波检测*/
	        case SerialPortEvent.CTS:/*Clear to send，清除发送*/
	        case SerialPortEvent.DSR:/*Data set ready，数据设备就绪*/
	        case SerialPortEvent.RI:/*Ring indicator，响铃指示*/
        case SerialPortEvent.OUTPUT_BUFFER_EMPTY:/*Output buffer is empty，输出缓冲区清空*/
	            break;
	 
	        case SerialPortEvent.DATA_AVAILABLE:/*Data available at the serial port，端口有可用数据。读到缓冲数组，输出到终端*/
	            byte[] readBuffer = new byte[20];
	    
	            try {
	      
	                while (inputStream.available() > 0) {
	                    int numBytes = inputStream.read(readBuffer);
//	                    System.out.println("numbytes"+numBytes);
	                    if (numBytes > 0) {
	 
	                    	cnt+=numBytes;
//	                    	System.out.println(new String(readBuffer).trim());
	                    	s+=new String(readBuffer).trim();
//	                    	System.out.println("s"+s);
	                    	msgQueue.add(new String(readBuffer));
//	                    	System.out.println("msgQueue"+msgQueue.take());
	                    	
//	                    	System.out.println("cnt"+cnt);
	                    readBuffer = new byte[20];
	                    }
	                    if(cnt==6)
	                    {
	                    	flag=1;
	                    	cnt=0;
//	                    System.out.println(s);
	                    	sets();
	                    	
	                    	s="";
	                    	
	                    }
	                }
	              
	        
	            } catch (IOException e) {
					// TODO 自动生成的 catch 块
					e.printStackTrace();
				}
	            break;
        }
    }
	}