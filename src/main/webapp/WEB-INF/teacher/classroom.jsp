<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>classroom</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/system.css">
 	<style type="text/css">
 		img{
 			width: 150px;
 			padding: 10px;
 		}
 		body{
 			text-align: center;
 		}
 	</style>
  </head>
  <body>
  	<div class="container-fluid">
	  	<ul class="nav nav-tabs">
		  <li role="presentation" class="active"><a href="#"><span class="glyphicon glyphicon-th-list"></span> <b>今日课堂</b> <span class="badge">${TeacherSubjectCount}</span></a></li>
		</ul>
		<table class="table">
			<tr>
				<c:forEach items="${TeachersubjectList}" var="s" varStatus="i">
				<td>
					<img src="${pageContext.request.contextPath}/static/Image/${s.class_image}.JPG">
					<p>
						《${s.class_name}》<br>
						状态：
						<c:if test="${s.status==0}">
							未开课<br>
							<a href="${pageContext.request.contextPath}/subject/openSubject?cid=${s.cid}" target="myiframe">开课</a>
						</c:if>
						<c:if test="${s.status==2}">
							已结课<br>
							<a href="${pageContext.request.contextPath}/subject/openSubject?cid=${s.cid}" target="myiframe">重新开课</a>
						</c:if>
						<c:if test="${s.status==1}">
							已开课<br/>
							<a href="${pageContext.request.contextPath}/classInfo/GOClass?classId=${s.cid}" target="myiframe">继续</a>
						</c:if>
					</p>
				</td>
				<c:if test="${i.count%4==0}"><tr></tr></c:if>
				</c:forEach>
		</table>
	</div>
  </body>
</html>