<%@ page import="java.util.*" pageEncoding="UTF-8"%>

<html>

	<head>
		<title></title>
	</head>
	
	<script type="text/javascript">
	  	function myBack(){
	  		location.href="index.jsp";
	  	}
	  	function mySubmit(){   
	        var ISBN=document.forms[0].ISBN;       
	                var name_msg=document.getElementById("name_msg");   
	        name_msg.innerHTML="";   
	        if(name.value.length==0){  
	            name_msg.innerHTML="<font color='red'>*ISBN为必填项</font>";  
	                        name.focus();  
	            return ;//中断方法的运行  
	        }    
	        document.forms[0].submit();//submit是提交方法  
	    }  
	</script>  
	
	<body>
		<h1 align="center">新增信息</h1>
		<form action="doadd.jsp" method="post">
			<table align="center" width="50%">
				<!-- ISBN -->
				<tr>
					<td align="right" width="37%">ISBN:</td>
					<td align="left" width="25%"><input type="text"
						name="ISBN"></td>
				</tr>
				<!-- Title -->
				<tr>
					<td align="right" width="37%">Title:</td>
					<td align="left" width="25%"><input type="text"
						name="Title"></td>
				</tr>
				<!--  AuthorID  -->
				<tr>
					<td align="right" width="37%">AuthorID:</td>
					<td align="left" width="25%"><input type="text"
						name="Title"></td>
				</tr>
				<!--  Publisher -->
				<tr>
					<td align="right" width="37%">Publisher:</td>
					<td align="left" width="25%"><input type="text"
						name="Publisher"></td>
				</tr>
				<!-- PublishDate -->
				<tr>
					<td align="right" width="37%">Publisher:</td>
					<td align="left" width="25%"><input type="text"
						name="PublishDate"></td>
				</tr>
				<!-- Price -->
				<tr>
					<td align="right" width="37%">Price:</td>
					<td align="left" width="25%"><input type="text"
						name="Price"></td>
				</tr>
				<!-- 按钮 -->
				<tr>
					<td align="center" colspan="3">
					<input type="button" value="添加"	  onclick="mySubmit()"> 
					<input type="button" value="返回"	  onclick="myBack()">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>