<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>歡迎光臨動物之家</title>
</head>
<body>
<jsp:include page="head.jsp"></jsp:include>
<c:if test="${not empty member }">
Hi, ${member.email }
</c:if>

<div id="banner">

    <!-- <div class="inner" id="word">

			<h1 >一頓飯，創造一段新關係。</h1>

			<p>最讓人安心見面的聚餐交友平台，已有161310次的聚會成功發起了！<p>
					
		</div> -->
  </div>

  
  <!-- Highlights -->
  <section style=" width:88% ;margin:auto">
    <div class="act">
      <h2>最新活動</h2>
    </div>

    <div class="act">
      <h2>為您推薦</h2>
    </div>

    <div class="act">
      <h2>活動分類</h2>
    </div>

    <div class="act">
      <h2>最新活動</h2>
    </div>

  </section>
</body>
</html>