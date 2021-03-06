<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#container {
	min-width: 310px;
	max-width: 800px;
	height: 400px;
	margin: 0 auto
}

#body{
width:1300px;
height:500px;
/* border:solid 1px grey; */
margin:auto;
margin-top:40px;
padding-top: 40px;
background-color: #F5F5F5;
}
#left{
	text-align:center;
   width: 20%; 
  float:left;
/*   background-color: grey; */
   background-color: #F5F5F5; 

}

#right{

padding-left:25%;
padding-right:5%;

}
</style>

<script src="http://code.highcharts.com/highcharts.js"></script>
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>

<script src="https://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css" />
<link rel="stylesheet"
	href="http://jqueryui.com/resources/demos/style.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="backstageHead.jsp"></jsp:include>
	<div id="body" >

<div id="left" >
<nav>
<button id="link1"  class="btn btn-info btn-lg" onclick="location.href='<c:url value="/backstageData1.jsp"></c:url>'">歷年發起的活動數量</button><br><br>
<button id="link2"  class="btn btn-info btn-lg" onclick="location.href='<c:url value="/backstageData2.jsp"></c:url>'">今年發起的活動數量 </button><br><br>
<button id="link3"  class="btn btn-info btn-lg" onclick="location.href='<c:url value="/backstageData3.jsp"></c:url>'">各類活動報名人數</button><br><br>
<button id="link4"  class="btn btn-info btn-lg" onclick="location.href='<c:url value="/backstageData4.jsp"></c:url>'">各類活動數量</button><br><br>

<%-- <li><a id="link1" href="<c:url value="/findMembers"></c:url>">管理網站會員</a> --%>
<%-- <li><a id="link2" href="<c:url value="/findUnreviewed"></c:url>">管理未審核的活動</a> --%>
<%-- <li><a id="link3" href="<c:url value="/findReports"></c:url>">管理待處理的檢舉</a> --%>

</nav>
</div>

<div id="container" style="max-width:800px;height:400px"></div>

</div>



</body>

<script type="text/javascript">
Highcharts.chart('container', {
	  chart: {
	    type: 'bar'
	  },
	  title: {
	    text: '各類型活動數量'
	  },
	  
	  
	  xAxis: {
	    categories: ['電影', '聚餐', '運動', '音樂', '娛樂'],
	    title: {
	      text: null
	    },
	  	labels: {
          style: {
              
              fontSize:'20px'
          }
	  	}
	  },
	  yAxis: {
	    min: 0,
	    title: {
	      text: '活動數量',
	      align: 'high'
	    },
	    labels: {
	      overflow: 'justify'
	      
	    }
	  },
	  tooltip: {
	    valueSuffix: ' millions'
	  },
	  plotOptions: {
	    bar: {
	      dataLabels: {
	        enabled: true
	      }
	    }
	  },
	  legend: {
	    layout: 'vertical',
	    align: 'right',
	    verticalAlign: 'top',
	    x: -40,
	    y: 80,
	    floating: true,
	    borderWidth: 1,
	    backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
	    shadow: true
	  },
	  credits: {
	    enabled: false
	  },
	  series: [{
	    name: '活動數量',
	    data: [107, 19, 60, 13, 19]
	  }]
	});


</script>
</html>