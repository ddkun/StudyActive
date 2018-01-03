<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>login</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/system.css">
  	<style type="text/css">
  		.container-fluid{
  			margin-top: 4%;
  			margin-left: 7%;
  			margin-right: 7%;
  		}
  		.jumbotron{
  			background-color: white;
  		}
  		body{
  			text-align: center;
  		}
  	</style>
  </head>
  <body>
  	<div class="container-fluid">
	    <div class="jumbotron">
	      <div class="row">
		  	  <div class="col-md-12"><h2>用户登录</h2><hr/><br/></div>
		  </div>
		  <div class="row">
		  	  <div class="col-xs-2 col-md-1">&nbsp;</div>
			  <div class="col-xs-4 col-md-4">
				<img alt="" src="${pageContext.request.contextPath}/static/Image/logo.JPG" width="67%" >
				<p>厚德博学 求真至善</p>
			  </div> 
			  <div class="col-xs-6 col-md-6">
			  	<p align="left"><small>教学活动管理平台</small></p>
				<form class="form-horizontal" action="${pageContext.request.contextPath }/login/login" method="post">
				  <div class="form-group">
				    <div class="col-xs-12 col-sm-9">
				      <input type="number" class="form-control" name="account" id="inputEmail3" required="required" placeholder="用户账号">
				    </div>
				  </div>
				  <div class="form-group">
				    <div class="col-xs-12 col-sm-9">
				      <input type="password" class="form-control" name="password" id="inputPassword3" required="required" placeholder="用户密码">
				    </div>
				    <div class="col-xs-5 col-sm-3"><a href="#" style="vertical-align:middle;"><!-- 找回密码？ --></a></div>
				  </div>
				  <div class="form-group">
				  	<div class="col-xs-12 col-sm-9">
					    <div class="input-group">
					      <div class="input-group-addon">用户类型</div>
					      <select class="form-control" name="role">
							  <option value="1">学生  </option>
							  <option value="2">教师   </option>
							  <option value="3">教务员</option>
						  </select>
					    </div>
				    </div>
				 </div>
				  <div class="form-group">
				    <div class="col-xs-12 col-sm-9">
				      <button type="submit" class="btn btn-primary btn-block">登录</button>
				    </div>
				  </div>
				</form>
			  </div>
			  <div class="col-xs-2 col-md-1">&nbsp;</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var tip = "${tip}";
		if(tip.length>0){
			alert(tip);
		}
	</script>
  </body>
</html>