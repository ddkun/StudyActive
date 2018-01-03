<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>person</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/system.css">
 	<style type="text/css">
 		span{
 			color: graytext;
 		}
 	</style>
  </head>
  <body>
  	<div class="container-fluid">
	  	<ul class="nav nav-tabs">
		  <li role="presentation" class="active"><a href="#"><span class="glyphicon glyphicon-user"></span> <b>个人中心</b></a></li>
		</ul>
		<table class="table table-hover">
			<caption>基本资料</caption>
			<tr>
				<td>&nbsp;</td>
				<td>
					<label>用户账号：</label>
					<span><b>${username.account}</b></span>
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>
					<label>用户姓名：</label>
					<span><b>${username.name}</b></span>
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>
					<label>用户性别：</label>
					<span><b>
					<label class="radio-inline">
					  <input type="radio" name="inlineRadioOptions" id="gender" 
					  	<c:if test='${username.gender==1}'> 
					    	checked="checked"
					    </c:if> 
					  	value="1"> 男
					</label>
					<label class="radio-inline">
					  <input type="radio" name="inlineRadioOptions" id="gender" 
					    <c:if test='${username.gender==2}'> 
					    	checked="checked"
					    </c:if> 
					    value="2"> 女
					</label></b>
					</span>
					<a href="#" class="gender">修改</a>
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>
					<label>用户邮箱：</label>
				    <span>
					    <b>${username.email}</b>
					    <input type="text" style="width: 150px;" required="required" class="form-control hidden" id="email" name="email">
				    </span>
				    <a href="#" class="email">修改</a>
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>
					<label>用户密码：</label>
					<span><b>*********</b></span>
					<input type="password" style="width: 150px;" required="required" placeholder="原始密码" class="form-control hidden" id="oldpassword">
					<input type="password" style="width: 150px;" required="required" placeholder="新设密码" class="form-control hidden" id="password" name="password">
				    <a href="#" class="password">修改</a>
				</td>
			</tr>
		</table>
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		        <span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">信息更改</h4>
		      </div>
		      <div class="modal-body" id="content"></div>
		      <div class="modal-footer">
		        <button type="button" id="save" class="btn btn-default" data-dismiss="modal">保存</button>
		      </div>
		    </div>
		  </div>
	   </div>
	</div>
	<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/js/system.js"></script> 
  	<script type="text/javascript">
  		$(".gender").click(
 			function(){
 			 var account = "${username.account}";
 			 $.post("update",{'gender':$("input[name='inlineRadioOptions']:checked").val(),"account":account},function(date){
	  			alert(date.msg+"，下次查看生效");
	  			parent.location.reload(true);
	  			}); 
			});
  		$(".email").click(
 			function(){
 				if($("#email").prop("class")=='form-control hidden'){
 					$("#email").removeClass("hidden");
 				}else{
 					$("#email").addClass("hidden");
 					var account = "${username.account}";
 		 			$.post("update",{'email':$("input[name='email']").val(),"account":account},function(date){
 			  			alert(date.msg+"，下次查看生效");
 			  			parent.location.reload(true);
 			  		});   
 				}
			});
  		$(".password").click(
 			function(){
 				if($("#password").prop("class")=='form-control hidden'){
 					$("#password").removeClass("hidden");
 					$("#oldpassword").removeClass("hidden");
 				}else{
 					$("#password").addClass("hidden");
 					$("#oldpassword").addClass("hidden");
 					var account = "${username.account}";
 					if($("#oldpassword").val()=='${username.password}'){
	 		 			$.post("update",{'password':$("input[name='password']").val(),"account":account},function(date){
	 			  			alert(date.msg+"，请重新登录");
	 			  			parent.location.reload(true);
	 			  			window.location.href="${pageContext.request.contextPath}/login/toLogin";
	 			  		}); 
 					}else{
 						$("#password").val("");
 	 					$("#oldpassword").val("");
 						alert("原始密码错误");
 					}
 				}
			});
  	</script>
  </body>
</html>