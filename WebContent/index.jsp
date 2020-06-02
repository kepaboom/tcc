<%@include file="/common/sub_header.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="UTF-8">
		<title>后台管理</title>
<!-- 	<link rel="stylesheet" href="./css/main.css" type="text/css"> -->
	</head>
	<body>
		<jsp:include page="/top.jsp"></jsp:include>
		<div class="container clearfix">

			<jsp:include page="/left.jsp"></jsp:include>
			<!--/工具栏-->
			<div class="main-wrap">
				<div class="crumb-wrap">
					<div class="crumb-list">
						<i class="icon-font">&#xe06b;</i><span>欢迎使用管理系统。</span>
					</div>
				</div>

				<div class="result-wrap">
					<div class="result-title">
						<h1>
							任务分工
						</h1>
					</div>
					<div class="result-content">
						<ul class="sys-info-list">
							<li>
								<label class="res-lab">
									张馨月
								</label>
								<span class="res-info">java web后端，功能设计，串口通信</span>
							</li>
							<li>
								<label class="res-lab">
									杨君
								</label>
								<span class="res-info">仿真电路，数据库设计</span>
							</li>

							<li>
								<label class="res-lab">
									唐莉
								</label>
								<span class="res-info">web前端</span>
							</li>

							<li>
								<label class="res-lab">
									开发工具
								</label>
								<span class="res-info">eclipse+tomcat+mysql</span>
							</li>
							
						</ul>
					</div>
				</div>

			</div>
			<!--/main-->
		</div>
	</body>
</html>