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
    <title>group</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/system.css">
  </head>
  <body>
  	<div class="container-fluid">
	  	<ul class="nav nav-tabs">
		  <li role="presentation" class="active"><a href="#"><span class="glyphicon glyphicon-star-empty"></span> <b>小组名单</b></a></li>
		</ul>
		<table class="table" style="text-align: center;">
			
			<c:forEach items="${groupInfo}" var="g" varStatus="i">
				<c:if test="${i.index+1==1}">
					<caption>${g.group_name}组&#12288;<a href="#" id="update">修改</a></caption>
					<tr>
						<td><b>编号</b>
							<input type="hidden" class="updatename" value="${g.account}">
						</td>
						<td><b>姓名</b></td>
						<td><b>Email</b></td>
					</tr>
				</c:if>
				<tr>
					<td>${g.account}</td>
					<td>${g.name}</td>
					<td>${g.email}</td>
				</tr>
			</c:forEach>
		</table>
		<c:if test="${f:length(groupInfo)<=0}"><p>当前成员小组尚未分配完成，或正在分配中请稍后！</p></c:if>
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		        <span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">更改组名</h4>
		      </div>
		      <div class="modal-body" id="content">
		      	<label>新组名：</label><input type="text" id="newName" required="required" class="form-control">
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">保存</button>
		      </div>
		    </div>
		  </div>
		</div>
	</div>
	<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/js/system.js"></script> 
	<script type="text/javascript">
	$("#update").click(
		function(){
			$('#myModal').modal({backdrop:'static'});
			$("button").click(function(){
				$.post("updateName",{"name":$("#newName").val(),"account":$(".updatename").val()},function(date){
					alert(date.msg);
					window.location.href="getGroup";
				});
			});
		});
	</script>
  </body>
</html>