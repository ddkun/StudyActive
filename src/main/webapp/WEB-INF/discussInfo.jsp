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
			<tr class="bg-warning">
				<td align="left">
					<p><b>ID：</b>${discussInfo.publishId}</p>
					<p><b>发布内容：</b><br/><h4>&#12288;&#12288;${discussInfo.discussTitle}</h4></p>
					
				</td>
				<td align="right">
					<p>发布时间：[<f:formatDate value="${discussInfo.publishDaate }" type="date" pattern="yyyy-MM-dd HH:mm:ss"/>]</p>
					<p><b><a href="#" id="${discussInfo.did}" class="resend">回复</a></b></p>
				</td>
			</tr>
			<c:forEach items="${replyList}" var="r">
			<tr class="text-warning">
				<td align="left">
					<p><small>ID：${r.replyId}</small> </p>
					<p><small>回复：${r.replyContent}</small></p>
				</td>
				<td align="right">
					<p>[<f:formatDate value="${r.replyDate }" type="date" pattern="yyyy-MM-dd HH:mm:ss"/>]</p>
					<c:if test="${r.replyId==username.account}">
						<p><b><a href="#" id="${r.rid}" class="deleteReply">删除</a></b></p>
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
		<div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		        <span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">帖子回复</h4>
		      </div>
		      <div class="modal-body" id="content">
		      	<form method="post">
				  <div class="form-group">
				    <label for="exampleInputEmail1">回复内容</label>
				    <textarea name="replyContent" required cols="4" rows="8" class="form-control" placeholder="帖子内容"></textarea>
				  </div>
				  <div class="form-group">
				    <label for="exampleInputPassword1">当前时间:</label>
				    <input type="text" class="form-control" id="nowDate" readonly="readonly"> 
				  </div>
				</form>
		      </div>
		      <div class="modal-footer">
		      	<button type="button" id="send" class="btn btn-default">回复</button>
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
			$("#nowDate").val(d.getFullYear()+"-"+d.getMonth()+"-"+d.getDate()+" "+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds());
		}
		setInterval(getDate, 1000);
		$(".add").click(function(){
			var id= $(this).prop("id");
			$("#myModal3").modal({backdrop:'static'});
			$("#publish").click(function(){
				if($("textarea[name='discussTitle']").val()!=""){
				$.post("${pageContext.request.contextPath}/discuss/saveDiscuss",
						{"discussTitle":$("textarea[name='discussTitle']").val(),"did":"${username.account}"},
						function(date){
							alert(date.msg);
							window.location.href="${pageContext.request.contextPath}/discuss/getDiscuss";
				  });
				}
			});
		});
		$(".resend").click(function(){
			var did= $(this).prop("id");
			$("#myModal4").modal({backdrop:'static'});
			$("#send").click(function(){
				if($("textarea[name='replyContent']").val()!=""){
				$.post("${pageContext.request.contextPath}/discuss/saveReply",
						{"replyContent":$("textarea[name='replyContent']").val(),"did":did},
						function(date){
							alert(date.msg);
							window.location.href="${pageContext.request.contextPath}/discuss/goDiscuss?did="+did;
							});
				}});
			});
		$(".deleteReply").click(function(){
			var did = "${discussInfo.did}";
			$.post("${pageContext.request.contextPath}/discuss/deleteReply",{"rid":$(this).prop("id")},function(date){
				alert(date.msg);
				window.location.href="${pageContext.request.contextPath}/discuss/goDiscuss?did="+did;
			});
		});
  	</script>
  </body>
</html>