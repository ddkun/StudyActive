<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>quiz</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/system.css">
  </head>
  <body>
  	<div class="container-fluid">
	  	<ul class="nav nav-tabs">
		  <li role="presentation" class="active"><a href="#"><span class="glyphicon glyphicon-edit"></span> <b>课堂提问</b> <span class="badge">2</span></a></li>
		</ul>
		<table class="table">
			<tr>
				<td><b>问题编号</b></td>
				<td><b>提问人</b></td>
				<td><b>提问时间</b></td>
				<td><b>操作</b></td>
			</tr>
			<tr>
				<td>问题1</td>
				<td>张三</td>
				<td><a href="#">一年四季中，昼夜温差最大的季节？</a></td>
				<td><a href=""><span class="glyphicon glyphicon-trash"></span></a></td>
			</tr>
		</table>
		<a href="#" class="btn btn-block btn-success">
			<span class="glyphicon glyphicon-plus"></span> 进行提问
		</a>
	</div>
  </body>
</html>