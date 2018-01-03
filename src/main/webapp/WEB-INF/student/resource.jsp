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
		  <li role="presentation" class="active"><a href="#"><span class="glyphicon glyphicon-floppy-open"></span> <b>上传资源</b></a></li>
		</ul>
		<table class="table">
			<tr>
				<td>
					<p>附件1：</p>
					<img alt="" width="125px" src="${pageContext.request.contextPath }/static/Image/code.png">
					<p>
						<a href="" class="btn btn-sm btn-success">
							<span class="glyphicon glyphicon-download"></span> 下载
						</a>
						<a href="" class="btn btn-sm btn-success">
							<span class="glyphicon glyphicon-trash"></span> 删除
						</a>
					</p>
				</td>
				<td>
					<p>附件2：</p>
					<img alt="" width="125px" src="${pageContext.request.contextPath }/static/Image/code.png">
					<p>
						<a href="" class="btn btn-sm btn-success">
							<span class="glyphicon glyphicon-download"></span> 下载
						</a>
						<a href="" class="btn btn-sm btn-success">
							<span class="glyphicon glyphicon-trash"></span> 删除
						</a>
					</p>
				</td>
				<td>
					<p>附件3：</p>
					<img alt="" width="125px" src="${pageContext.request.contextPath }/static/Image/code.png">
					<p>
						<a href="" class="btn btn-sm btn-success">
							<span class="glyphicon glyphicon-download"></span> 下载
						</a>
						<a href="" class="btn btn-sm btn-success">
							<span class="glyphicon glyphicon-trash"></span> 删除
						</a>
					</p>
				</td>
				<td>
					<p>附件4：</p>
					<img alt="" width="125px" src="${pageContext.request.contextPath }/static/Image/code.png">
					<p>
						<a href="" class="btn btn-sm btn-success">
							<span class="glyphicon glyphicon-download"></span> 下载
						</a>
						<a href="" class="btn btn-sm btn-success">
							<span class="glyphicon glyphicon-trash"></span> 删除
						</a>
					</p>
				</td>
			</tr>
		</table>
		<form action="" method="post">
			<input type="file" id="exampleInputFile">
			<button type="submit" class="btn btn-block btn-success">
				<span class="glyphicon glyphicon-upload"></span> 上传附件
			</button>
		</form>
	</div>
  </body>
</html>