<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>main</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/system.css">
 	<style type="text/css">
 		#left{
 			height:100%;
 			border-right-style: dotted;
 			border-right-width: 0.2px;
 		}
 		body { 
 			padding-top: 70px; 
 		}
 		img{
 			border:0.2px dotted black;
 			padding: 2px;
 		}
 	</style>
  </head>
  <body>
  	<nav class="navbar navbar-default navbar-fixed-top">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <a class="navbar-brand hidden" href="javascript:void(0);" id="fold"><span class="glyphicon glyphicon-triangle-left"></span></a>
	      <a class="navbar-brand" href="javascript:parent.location.reload();">首页</a>
	    </div>
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	      <ul class="nav navbar-nav navbar-right">
            <li><a href="javascript:void(0);">欢迎你，${username.name} &nbsp;<span class="glyphicon glyphicon-leaf"></span> 教师</a></li>
            <li><a href="${pageContext.request.contextPath}/login/toLogin">【安全退出】</a></li>
            <li><a href="#" class="chooseStyle">主题1</a></li>
	      </ul>
	    </div>
	  </div>
	</nav>
	<div class="container-fluid" align="center">
		<div class="row">
			<div class="col-xs-3 col-md-3" id="left">
				<img src="${pageContext.request.contextPath}/static/Image/t4.jpg" width="50px" class="img-responsive img-circle">
				<p>${username.name}<br><a href="${pageContext.request.contextPath}/person/person" target="myiframe">个人详情</a></p>
				<div class="btn-group-vertical col-md-12" role="group">
				  <a href="${pageContext.request.contextPath}/subject/teacherSubject" id="c" class="btn btn-success btn-block active" target="myiframe" role="button">准备上课</a>
				  <a href="${pageContext.request.contextPath}/notice/getNotice/${username.role}" class="btn btn-default  btn-block" target="myiframe" role="button">发布通知</a>
				  <a href="${pageContext.request.contextPath}/discuss/getDiscuss" class="btn btn-default btn-block" target="myiframe" role="button">进入讨论</a>
				  <a href="${pageContext.request.contextPath}/file/resource" class="btn btn-default btn-block" target="myiframe" role="button">上传课件</a>
				  <p><br/><a href="#" id="c" class="btn btn-success btn-sm btn-block">&nbsp;</a></p>
				  <img alt="" src="${pageContext.request.contextPath}/static/Image/code.png" width="67%">
				  <label>进入<br/>移动客户端,<br/>感受不一样 <br>的精彩世界!</label>
				</div>
			</div>	
			<div class="col-xs-9 col-md-9">
				<div class="embed-responsive embed-responsive-16by9">
				  <iframe class="embed-responsive-item" name="myiframe" src="${pageContext.request.contextPath}/subject/teacherSubject"></iframe>
				</div>
			</div>	    
	    </div>
	</div>
	<nav class="navbar navbar-default navbar-fixed-bottom">
	  <div class="container-fulid">
	    <p align="center" class="footer"><br>Copy Right &copy; 2017 JavaWeb 版权所有：等雨停停</p>
	  </div>
	</nav>
	
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/js/system.js"></script> 
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/main.js"></script>
  </body>
</html>