<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Header-->
        <header id="header" class="header">

            <div class="header-menu">

                <div class="col-sm-7">
                    <a id="menuToggle" class="menutoggle pull-left"><i class="fa fa fa-tasks"></i></a>
                    <div class="header-left" style = "vertical-align : bottom;">
                    </div>
                </div>

                <div class="col-sm-5">
                    <div class="user-area dropdown float-right" align = "right">
                    <div style = "font-size : 1.1em">
                    	<label style = "text-size : 1.2em"></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    	<b>점주</b>&nbsp;&nbsp;&nbsp;<label>${sessionScope.loginUser.memberName }</label>
                    </div>
                     <%-- <img class="user-avatar rounded-circle" src="${contextPath }/resources/companyCss/images/admin.jpg" alt="User Avatar"> --%>
                     <button type="button" class="btn btn-primary" onclick = "location.href = 'goMain.co'"><i class="fa fa-cutlery"></i>&nbsp; 사용자 메뉴로 이동</button>
                     <button type="button" class="btn btn-secondary" onclick = "location.href = 'logout.co'"><i class="fa fa-sign-out" ></i>&nbsp; 로그아웃</button>
                       <!--  <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                           
                        </a>
						
                        <div class="user-menu dropdown-menu">
                            <a class="nav-link" href="#"><i class="fa fa-user"></i> My Profile</a>

                            <a class="nav-link" href="#"><i class="fa fa-user"></i> Notifications <span class="count">13</span></a>

                            <a class="nav-link" href="#"><i class="fa fa-cog"></i> Settings</a>

                            <a class="nav-link" href="#"><i class="fa fa-power-off"></i> Logout</a>
                        </div> -->
                    </div>
                </div>
            </div>

        </header><!-- /header -->
        <!-- Header-->
</body>
</html>