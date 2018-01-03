<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>notice</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/system.css">
  </head>
  <body>
  	<div class="container-fluid">
	  	<ul class="nav nav-tabs">
		  <li role="presentation" class="active">
		  	<a href="#"><span class="glyphicon glyphicon-bullhorn"></span> 
		  	<b>通知公告</b> <span class="badge">${NoticeCount}</span></a>
		  </li>
		  <li role="presentation">
		  	<a href="#" class="add" ><span class="glyphicon glyphicon-plus"></span> 发布通知</a>
		  </li>
		</ul>
		<table class="table">
			<c:forEach items="${notice_List}" var="n" varStatus="i">
				<tr>
					<td>
						<label>公告${i.index+1}</label> 
						<small>&#12288; [
						<f:formatDate value="${n.addDate}" pattern="yyyy-MM-dd HH:mm:ss"/>  
						]</small>
						<small>&#12288; 
						<c:if test="${n.status==0}">
							未读
						</c:if>
						<c:if test="${n.status==1}">
							已读
						</c:if>
						</small>
						<a href="#" class="infos" id="${n.nid}" <c:if test='${n.status==1}'>style="text-decoration: none;color:gray;"</c:if>>
							<br>${n.noticeDesc}
						</a>
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						        <span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title" id="myModalLabel">通知详情</h4>
						      </div>
						      <div class="modal-body" id="content"></div>
						      <div class="modal-footer">
						        <button type="button" id="${n.nid}" class="btn btn-default" data-dismiss="modal">Close</button>
						      </div>
						    </div>
						  </div>
						</div>
					</td>
					<td>
						<a href="#" class="delete" id="${n.nid}"><span class="glyphicon glyphicon-trash"></span></a>
					</td>
				</tr>
			</c:forEach>
		</table>
		<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		        <span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">发布通知</h4>
		      </div>
		      <div class="modal-body" id="content">
		      	<form action="${pageContext.request.contextPath}/notice/saveNotice" method="post">
				  <div class="form-group">
				    <label for="exampleInputEmail1">通知描述</label>
				    <input type="text" class="form-control" required="required" name="noticeDesc" placeholder="通知主题/描述">
				  </div>
				  <div class="form-group">
				    <label for="exampleInputPassword1">通知内容</label>
				    <textarea name="noticeContent" required="required" class="form-control" placeholder="通知内容"></textarea>
				  </div>
				  <div class="form-group">
				    <label for="exampleInputPassword1">当前时间</label>
				    <input type="text" class="form-control" id="addDate"> 
				  	<input type="hidden" class="form-control" name="status" value="0">
				  </div>
				</form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" id="publish" class="btn btn-default" data-dismiss="modal">发布</button>
		      </div>
		    </div>
		  </div>
		</div>
	</div>
	<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/js/system.js"></script> 
  	<script type="text/javascript">
  		$(".infos").click(
			function(){
				var id = $(this).prop("id");
		  		$('#myModal').modal({backdrop:'static'});
		  		$.post("${pageContext.request.contextPath}/notice/getNoticeInfo",{"id":id},function(date){
		  			$("#content").html(date.map.NoticeInfo);
		  		});
		  		$("button").click(function(){
		  			 $.post("${pageContext.request.contextPath}/notice/updateNoticePage",{"id":id},function(date){
			  			window.location.href="${pageContext.request.contextPath}/notice/getNotice/${username.role}";
			  		}); 
		  	  });
		});
  		
 		$(".delete").click(
		  function(){
			$.post("${pageContext.request.contextPath}/notice/deleteNotice",{"id":$(this).prop("id")},function(date){
				alert(date.msg);
				window.location.href="${pageContext.request.contextPath}/notice/getNotice/${username.role}";
			})
  		});
 		
 		$(".add").click(function(){
 			$('#myModal2').modal({backdrop:'static'});
 			$("#publish").click(function(){
 				$.post("${pageContext.request.contextPath}/notice/saveNotice",$("form").serialize(),function(date){
 					alert(date.msg);
 					window.location.href="${pageContext.request.contextPath}/notice/getNotice/${username.role}";
 				});
 			});
 		});
 		
 		function getDate(){
 			var d = new Date();
 			$("#addDate").val(d.getFullYear()+"-"+d.getMonth()+"-"+d.getDate()+" "+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds());
 		}
 		setInterval(getDate, 1000);
  	</script>
  </body>
</html>