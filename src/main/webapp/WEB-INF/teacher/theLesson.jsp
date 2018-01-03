<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>main</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/system.css">
  </head>
  <body>
  	<table class='table'>
  		<c:forEach items="${classinfoList}" var="c" varStatus="i">
  			<c:if test="${i.index+1==1}">
  			<tr>
	  			<td><h4><sub>当前课程进度</sub></h4></td>
	  			<td align="right">
		  			<a href="#" title="open" id="opensign" class="btn btn-success active">考勤</a>
		  			<a href="${pageContext.request.contextPath}/subject/closeSubject?classId=${c.classid}" class="btn btn-success " target="myiframe">结课</a>
		  			<a href="#" class="btn btn-success" target="myiframe">答疑/讨论</a>
		  			<a href="${pageContext.request.contextPath}/subject/teacherSubject" class="btn btn-success" target="myiframe">刷新</a>
		  		</td>
  			</tr>
  			</c:if>
	  		<tr>
	  			<td>
		  			<fieldset disabled>
	  					<input type="radio"  <c:if test="${c.status!=0}"> checked="checked" </c:if> > 
	  					${i.index+1}、${c.classinfoTitle}
	  				</fieldset>&nbsp;
  				</td>
	  			<td>
	  				<c:if test="${c.status==0}">
	  					<a href="${pageContext.request.contextPath }/classInfo/openClassInfo?ciid=${c.ciid}&classId=${c.classid}" target="myiframe">上课</a>
	  				</c:if>
	  			</td>
	  		</tr>
  		</c:forEach>
  	</table>
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <script type="text/javascript">
    $("#opensign").click(function(){
    	if($(this).attr("title")=="open"){
    		$.post("${pageContext.request.contextPath}/sign/opensign/open",function(date){
    			alert(date.msg);
        	});
    		$(this).attr({"title":"close"});
    	}else{
    		$.post("${pageContext.request.contextPath}/sign/opensign/close",function(date){
    			alert(date.msg);
        	});
    		$(this).attr({"title":"open"});
    	}
    });
    </script>
  </body>
</html>