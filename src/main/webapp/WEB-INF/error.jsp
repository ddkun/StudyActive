<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>error</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/system.css">
  </head>
  <body>
  	<div class="container-fluid">
  		<div class="jumbotron">
		  <h1>Error <sub>I'am sorry</sub></h1>
		  <p>系统繁忙，请稍后再试！</p>
		  <p>The system is busy. Please try again later.</p>
		  <p><a class="btn btn-primary btn-lg" href="#" role="button" onclick="javascript:history.back(-1);">返回</a></p>
		</div>
	</div>
  </body>
</html>