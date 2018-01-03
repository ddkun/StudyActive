<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>discuss</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/system.css">
  </head>
  <body>
  	<div class="container-fluid">
	  	<ul class="nav nav-tabs">
		  <li role="presentation" class="active"><a href="#"><span class="glyphicon glyphicon-transfer"></span> <b>答疑/讨论</b></a></li>
		  <li role="presentation"><a href="#" class="add"><span class="glyphicon glyphicon-plus"></span> 发布帖子</a></li>
		</ul>
		<table class="table" style="text-align: center;">
			<c:forEach items="${discussList}" var="d" varStatus="i">
			<c:if test="${i.index+1==1 || i.index+1==0 }">
			<tr>
				<td><b>问题编号</b></td>
				<td><b>问题描述</b></td>
				<td><b>发布人ID</b></td>
				<td><b>发布时间</b></td>
				<c:if test="${d.publishId ==username.account}">
					<td><b>操作</b></td>
				</c:if>
			</tr>
			</c:if>
			<tr>
				<td>${i.index+1}</td>
				<td>
					<a href="${pageContext.request.contextPath}/discuss/goDiscuss?did=${d.did}" target="myiframe">
					${fn:substring(d.discussTitle,0,5)}&bull;&bull;
					</a>
				</td>
				<td>${d.publishId }</td>
				<td><f:formatDate value="${d.publishDaate }" type="date" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>
					<c:if test="${d.publishId ==username.account}">
						<a href="${pageContext.request.contextPath}/discuss/deleteDiscuss?did=${d.did}" class="delete">删除</a>
					</c:if>
				</td>
			</tr>
			</c:forEach>
		</table>
		<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		        <span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">发布帖子</h4>
		      </div>
		      <div class="modal-body" id="content">
		      	<form method="post">
				  <div class="form-group">
				    <label for="exampleInputEmail1">帖子内容</label>
				    <textarea name="discussTitle" required cols="4" rows="8" class="form-control" placeholder="帖子内容"></textarea>
				  </div>
				  <div class="form-group">
				    <label for="exampleInputPassword1">当前时间:</label>
				    <input type="text" class="form-control" id="addDate" readonly="readonly"> 
				  </div>
				</form>
		      </div>
		      <div class="modal-footer">
		      	<button type="button" id="publish" class="btn btn-default">发布</button>
		        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		      </div>
		    </div>
		  </div>
		</div>
	</div>
	<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/js/system.js"></script> 
  	<script type="text/javascript">
  		function getDate(){
			var d = new Date();
			$("#addDate").val(d.getFullYear()+"-"+d.getMonth()+"-"+d.getDate()+" "+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds());
		}
		setInterval(getDate, 1000);
		$(".add").click(function(){
			var id= $(this).prop("id");
			$("#myModal3").modal({backdrop:'static'});
			$("#publish").click(function(){
				if($("textarea").val()!=""){
				$.post("${pageContext.request.contextPath}/discuss/saveDiscuss",
						{"discussTitle":$("textarea").val(),"did":"${username.account}"},
						function(date){
							alert(date.msg);
							window.location.href="${pageContext.request.contextPath}/discuss/getDiscuss";
				  });
				}
			});
		});
  	</script>
  </body>
</html>