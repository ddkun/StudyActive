<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		  <li role="presentation" class="active">
		  	  <a href="#"><span class="glyphicon glyphicon-th-list"></span> <b>我的课堂</b> <span class="badge">${SubjectCount}</span></a>
		  </li>
		  <li role="presentation">
		  	<!-- <a href="#"><span class="glyphicon glyphicon-plus"></span> 添加课堂</a> -->
		  </li>
		</ul>
		<table class="table">
			<tr>
				<c:forEach items="${subjectList}" var="s" varStatus="i">
				<c:if test="${s.studentid==username.account}">
				<td>
					<img src="${pageContext.request.contextPath}/static/Image/${s.class_image}.JPG">
					<p>
						《${s.class_name}》<br>
						状态：
						<c:if test="${s.status==0}">
							未开课
						</c:if>
						<c:if test="${s.status==1}">
							已开课<br>
							<a href="${pageContext.request.contextPath}/classInfo/getClassInfo?classId=${s.cid}" target="myiframe">进入课堂</a>
						</c:if>
						<c:if test="${s.status==2}">
							已结课
						</c:if>
					</p>
				</td>
				<c:if test="${i.count%4==0}"><tr></tr></c:if>
				</c:if>
				</c:forEach>
				<c:if test="${f:length(subjectList)<=0}"><p><br/>当前用户暂无课程，请联系教务进行处理</p></c:if> 
			</tr>
		</table>
		<!-- <nav>
		  <ul class="pager">
		    <li><a href="#"><span aria-hidden="true">&larr;</span>上一页</a></li>
		    <li><a href="#">下一页<span aria-hidden="true">&rarr;</span></a></li>
		  </ul>
		</nav> -->
	</div>
  </body>
</html>