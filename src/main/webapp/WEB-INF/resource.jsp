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
    <title>quiz</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/system.css">
  </head>
  <body>
  	<div class="container-fluid">
	  	<ul class="nav nav-tabs">
		  <li role="presentation" class="active"><a href="#"><span class="glyphicon glyphicon-floppy-open"></span> <b>上传资源</b></a></li>
		</ul>
		
		<c:if test="${fileList != null}">
		<table class="table">
			<c:forEach items="${fileList}" var="file" varStatus="i">
			<tr>
				<td>
					<p>
						附件：${i.index+1}&#12288;
						${file.fileName}&#12288;
					</p>
				</td>
				<td>约 ${file.fileSize}</td>
				<td>
					<a href="${pageContext.request.contextPath}/file/download?file=${file.fileName}" target="myiframe" class="btn btn-sm btn-success">
						<span class="glyphicon glyphicon-download"></span> 下载
					</a>
				</td>
			</tr>
			</c:forEach>
		</table>
		</c:if>
		<form method="post" action="${pageContext.request.contextPath}/file/upload" enctype="multipart/form-data">
			<input type="file" required="required" class="form-control" name="myfile" id="exampleInputFile">
			<button type="submit" class="btn btn-block btn-success">
				<span class="glyphicon glyphicon-upload"></span> 上传附件
			</button>
		</form>
	</div>
  </body>
</html>