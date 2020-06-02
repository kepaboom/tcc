<%@ page contentType="text/html;charset=utf-8" language="java" import="com.jspsmart.upload.*,com.baidu.ai.aip.*" pageEncoding="UTF-8"%>

<%@page import="java.net.URLEncoder"%>
<%@page import="net.sf.json.JSONObject"%>
<%@ page import="java.util.*"%>
<%@ page import="com.wang.comm.*"%>
<%
String path = request.getContextPath();
%>
<%
    
    String newFile1Name=null;
    String file_name=null;
    String jishen1=null;
    String jishen2=null;
    String s1=null;
	SmartUpload mySmartUpload = new SmartUpload();

	//初始化上传
	mySmartUpload.initialize(pageContext);

	//只允许上载此类文件
	try 
	{
		//mySmartUpload.setAllowedFilesList("jpg,Jpg,JPG,GIF,gif,Gif,png");
		mySmartUpload.upload();
	} 
	catch (Exception e)
    {
		//out.println("<script language=javascript>alert('上传格式错误！');   history.back(-1);</script>");
		//return;
	}
	
	try 
	{
		   com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(0);
		   if (myFile.isMissing())
		   {
			  out.println("<script language=javascript>alert('必须选择图片！');   history.back(-1);</script>");
			  return;

		   } 
		   else 
		   {
			   int file_size = myFile.getSize(); //取得文件的大小 (单位是b) 
			   file_name=myFile.getFileName();
			   System.out.println("文件大小："+file_size+"文件名称："+file_name);
			   //if (file_size > 10*1024*1024)
			   //{
				  //out.println("<script language=javascript>alert('上传图片大小应控制在10K~1M之间！');   history.back(-1);</script>");
				  //return;
			   //}
               //else
               //{
            	   //车牌识别
                   newFile1Name=new Date().getTime()+file_name.substring(file_name.indexOf("."));
	               System.out.println("新文件名称："+newFile1Name);
				
				   String saveurl = request.getSession().getServletContext().getRealPath("upload");
				
				   saveurl = saveurl+"/"+newFile1Name;
				   myFile.saveAs(saveurl, mySmartUpload.SAVE_PHYSICAL);
				   String url = "https://aip.baidubce.com/rest/2.0/ocr/v1/license_plate";
				   byte[] imgData = FileUtil.readFileByBytes(saveurl);
		            String imgStr = Base64Util.encode(imgData);
		            String imgParam = URLEncoder.encode(imgStr, "UTF-8");

		            String param = "image=" + imgParam;

		          
		            String accessToken = "24.cc4347440aeb686a33d1fb79f6b23db4.2592000.1593245884.282335-20110513";

		            String result = HttpUtil.post(url, accessToken, param);
		            System.out.println(result);
		            JSONObject object=JSONObject.fromObject(result);
		            jishen1=(String)object.getJSONObject("words_result").get("number");
		            jishen2=(String)object.getJSONObject("words_result").get("color");
		            System.out.println(jishen1);
		            System.out.println(jishen2);
		           //串口通信
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
			s1=re.gets();
			break;
			}
		else {
			System.out.println(re.getflag());	
		}
		}
              // }
			} 
	  } 
	  catch (Exception e)
	  {
	    e.toString();
	  }
%>

<script language="javascript">
    document.write("上传成功");
	window.parent.document.getElementById("fujian").value="/upload/<%= newFile1Name%>";
	window.parent.document.getElementById("hao").value="<%= jishen1%>";
	window.parent.document.getElementById("leixing").value="<%= jishen2%>";
	window.parent.document.getElementById("ka").value="<%= s1%>";
	window.parent.document.getElementById("fujianYuanshiming").value="<%= file_name%>";
</script>
