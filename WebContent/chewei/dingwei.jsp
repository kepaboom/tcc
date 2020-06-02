<%@include file="/common/sub_header.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<script type="text/javascript" src="//api.map.baidu.com/api?v=2.0&ak=xQbsRSGItwOqiUEhTYw4KiDLB63WTHmG"></script>
		</head>
	<style type="text/css">
		#allmap {width: 100%;height: 650px;margin:0 auto;font-family:"微软雅黑";}
	</style>
	<body>
		<jsp:include page="/top.jsp"></jsp:include>
		<div class="container clearfix">
			<jsp:include page="/left.jsp"></jsp:include>
			<!--/sidebar -->
			<div class="main-wrap">
				<div id="allmap"></div>
			</div>
		</div>
		</body>
		</html>
		<script type="text/javascript">
	// 百度地图API功能
	var map = new BMap.Map("allmap");
	var point = new BMap.Point(116.331398,39.897445);
	map.centerAndZoom(point,12);

	var geolocation = new BMap.Geolocation();
	geolocation.getCurrentPosition(function(r){
		if(this.getStatus() == BMAP_STATUS_SUCCESS){
			var mk = new BMap.Marker(r.point);
			map.addOverlay(mk);
			map.panTo(r.point);
			alert('您的位置：'+r.point.lng+','+r.point.lat);
			var walking = new BMap.WalkingRoute(map, {renderOptions:{map: map, autoViewport: true}});
			walking.search("德阳市人民医院","德阳一中");
		}
		else {
			alert('failed'+this.getStatus());
		}        
	},{enableHighAccuracy: true})
	
</script>