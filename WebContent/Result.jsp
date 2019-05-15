<%@page import="Model.Account"%>
<%@page import="Model.GooglePojo"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*"%>
<%@ page import = "javax.servlet.*,java.text.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Successful</title>
<script src = " https://unpkg.com/sweetalert/dist/sweetalert.min.js " > </script> 
<style type="text/css">
* {
  box-sizing: border-box;
  line-height: 1.5;
  font-family: 'Open Sans', sans-serif;
}
img {
  max-width: 100%;
}
.container {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 100vh;
  background: #444;
}
.card {
  position: relative;
  background: #333;
  width: 400px;
  height: 75vh;
  border-radius: 6px;
  padding: 2rem;
  color: #aaa;
  box-shadow: 0 0.25rem 0.25rem rgba(0, 0, 0, 0.2), 0 0 1rem rgba(0, 0, 0, 0.2);
  overflow: hidden;
}
 
.card__line {
  opacity: 0;
  animation: LineFadeIn 0.8s 0.8s forwards ease-in;
}
.card__image {
  opacity: 0;
  margin-top: -1em;
  animation: ImageFadeIn 0.8s 1.4s forwards;
}
.card__title {
  color: white;
  font-size: 20px;
  margin-top: 0;
  font-weight: 800;
  letter-spacing: 0.01em;
}
.card__content {
  margin-top: -1rem;
  opacity: 0;
  animation: ContentFadeIn 0.8s 1.6s forwards;
}
.card__svg {
  position: absolute;
  left: 0;
  top: 115px;
}
@keyframes LineFadeIn {
  0% {
    opacity: 0;
    d: path("M 0 300 Q 0 300 0 300 Q 0 300 0 300 C 0 300 0 300 0 300 Q 0 300 0 300 ");
    stroke: #fff;
  }
  50% {
    opacity: 1;
    d: path("M 0 300 Q 50 300 100 300 Q 250 300 350 300 C 350 300 500 300 650 300 Q 750 300 800 300");
    stroke: #888bff;
  }
  100% {
    opacity: 1;
    d: path("M -2 100 Q 50 200 100 250 Q 250 400 350 300 C 400 250 550 150 650 300 Q 750 450 802 400");
    stroke: #545581;
  }
}
@keyframes ContentFadeIn {
  0% {
    transform: translateY(-1rem);
    opacity: 0;
  }
  100% {
    transform: translateY(0);
    opacity: 1;
  }
}
@keyframes ImageFadeIn {
  0% {
    transform: translate(-0.5rem, -0.5rem) scale(1.05);
    opacity: 0;
    filter: blur(2px);
  }
  50% {
    opacity: 1;
    filter: blur(2px);
  }
  100% {
    transform: translateY(0) scale(1);
    opacity: 1;
    filter: blur(0);
  }
}
</style>
</head>
<body>
<%
		if (session.getAttribute("account") == null) {
	%>
	<jsp:forward page="dangnhap.jsp"></jsp:forward>
	<%
		} else {
			String email;
			String pic="https://lh3.googleusercontent.com/-bptmsaarq2w/AAAAAAAAAAI/AAAAAAAAAAA/9MSED0tMHVo/photo.jpg";
			String name;
			String type = (String)session.getAttribute("type");
			if(type =="google"){
				GooglePojo google = (GooglePojo) session.getAttribute("account");
				email= google.getEmail();
				pic = google.getPicture();	
					
	%>
	<div class="container">
  <div class="card">
     <div class="card__image-container">
       <img class="card__image" src="<%=pic%>" alt="anh dai dien">
    </div> 
      <svg class="card__svg" viewBox="0 0 800 500">
        <path d="M 0 100 Q 50 200 100 250 Q 250 400 350 300 C 400 250 550 150 650 300 Q 750 450 800 400 L 800 500 L 0 500" stroke="transparent" fill="#333"/>
        <path class="card__line" d="M 0 100 Q 50 200 100 250 Q 250 400 350 300 C 400 250 550 150 650 300 Q 750 450 800 400" stroke="pink" stroke-width="3" fill="transparent"/>
      </svg>
    
     <div class="card__content">
       <h1 class="card__title"><%=email%></q></h1>
     <p>You login with <%=type%></q> </p>
     <form action="login-google" method="post">
   			<input type="submit" class="btn btn-outline-info" value="Đăng Xuất"/>
	</form>
    </div>
  </div>
  <% }if(type =="facebook"){
		Account facebook = (Account) session.getAttribute("account");
		name = facebook.getUsername();
	%>	 
		<div class="container">
  <div class="card">
     <div class="card__image-container">
       <img class="card__image" src="<%=pic%>" alt="anh dai dien">
    </div> 
      <svg class="card__svg" viewBox="0 0 800 500">
        <path d="M 0 100 Q 50 200 100 250 Q 250 400 350 300 C 400 250 550 150 650 300 Q 750 450 800 400 L 800 500 L 0 500" stroke="transparent" fill="#333"/>
        <path class="card__line" d="M 0 100 Q 50 200 100 250 Q 250 400 350 300 C 400 250 550 150 650 300 Q 750 450 800 400" stroke="pink" stroke-width="3" fill="transparent"/>
      </svg>
    
     <div class="card__content">
       <h1 class="card__title"><%=name%></q></h1>
     <p>You login with <%=type%></q> </p>
     <form action="login-google" method="post">
   			<input type="submit" class="btn btn-outline-info" value="Đăng Xuất"/>
	</form>
    </div>
  </div>
	<% }if(type =="account"){
		Account account = (Account) session.getAttribute("account");
		name = account.getUsername();
		
	%>	 
		<div class="container">
  <div class="card">
     <div class="card__image-container">
       <img class="card__image" src="<%=pic%>" alt="anh dai dien">
    </div> 
      <svg class="card__svg" viewBox="0 0 800 500">
        <path d="M 0 100 Q 50 200 100 250 Q 250 400 350 300 C 400 250 550 150 650 300 Q 750 450 800 400 L 800 500 L 0 500" stroke="transparent" fill="#333"/>
        <path class="card__line" d="M 0 100 Q 50 200 100 250 Q 250 400 350 300 C 400 250 550 150 650 300 Q 750 450 800 400" stroke="pink" stroke-width="3" fill="transparent"/>
      </svg>
    
     <div class="card__content">
       <h1 class="card__title"><%=name%></h1>
       <%if(session.getAttribute("admin")!=null){
       %>
       <h1 class="card__title" style="display: inline-block;"><%=session.getAttribute("admin")%></q></h1>
       <%} %>
     <p>You login with <%=type%> </p>
     <form action="login-google" method="post">
   			<input type="submit" class="btn btn-outline-info" value="Đăng Xuất"/>
	</form>
    </div>
  </div>
</div>
</body>
<script type="text/javascript">
swal("Đăng nhập thành công!", "Bạn đã đăng nhập bằng <%=type%>", "success");
</script>
<% }}%>
</html>