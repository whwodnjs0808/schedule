<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin - 404 Error</title>

  <!-- Custom fonts for this template-->
  <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="/resources/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="/resources/css/sb-admin.css" rel="stylesheet">
<style type="text/css">
	.box-body{border-top-left-radius:0;border-top-right-radius:0;border-bottom-left-radius:3px;border-bottom-right-radius:3px;padding:10px;}
	.form-group{margin-bottom:15px;}
	label{display:inline-block; max-width:100%; margin-bottom:5px; font-weight: 700;}
	.form-control{border-radius: 0 !important; box-shadow:none; border-color:#d2d6de;
	display:block; width:100%; height:34px; padding: 6px 12px; font-size: 14px; line-height:1.42857143; border:1px solid #ccc; 
	}
	.btn-primary{background-color:#3c8dbc; border-color:#367fa9;}
	
	

</style>
  <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function(){
		var formObj = $("form[role='form']");
		console.log(formObj);
		
		$(".goListBtn").on("click",function(){
			formObj.attr("method","get");
			formObj.attr("action","/board/list");
			formObj.submit();
		});
		
		$(".btn-danger").on("click",function(){
			formObj.attr("action","/board/delete");
			formObj.submit();
		});
		$(".btn-warning").on("click",function(){
			formObj.attr("action","/board/update");
			formObj.attr("method","get");
			formObj.submit();
		});
		
		var writer = $(".writer").val();
		var userid = $("#userid").val();
		if(writer != userid){
			$(".modifyBtn").css('display', 'none');
			$(".modifyBtn").attr('disabled', false);
			$(".removeBtn").css('display', 'none');
			$(".removeBtn").attr('disabled', false);
		} else{
		/* 	$(".modifyBtn").css('display', 'block');
			$(".removeBtn").css('display', 'block'); */
		}
		
	});
</script>
</head>

<body id="page-top">

  <nav class="navbar navbar-expand navbar-dark bg-dark static-top">

    <a class="navbar-brand mr-1" href="/">Schedule_Management</a>

    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
      <i class="fas fa-bars"></i>
    </button>

    <!-- Navbar Search -->
    <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
      <div class="input-group">
        <input type="text" class="form-control" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
        <div class="input-group-append">
          <button class="btn btn-primary" type="button">
            <i class="fas fa-search"></i>
          </button>
        </div>
      </div>
    </form>

    <!-- Navbar -->
    <ul class="navbar-nav ml-auto ml-md-0">
      <li class="nav-item dropdown no-arrow mx-1">
        <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-bell fa-fw"></i>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="alertsDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      <li class="nav-item dropdown no-arrow mx-1">
        <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-envelope fa-fw"></i>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="messagesDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      <li class="nav-item dropdown no-arrow">
        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-user-circle fa-fw"></i>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
          <a class="dropdown-item" href="#">Settings</a>
          <a class="dropdown-item" href="#">Activity Log</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">Logout</a>
        </div>
      </li>
    </ul>

  </nav>

  <div id="wrapper">
	
     <!-- Sidebar -->
    <ul class="sidebar navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="index.html">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span>
        </a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-folder"></i>
          <span>Pages</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <h6 class="dropdown-header">Login Screens:</h6>
          <c:choose>
           <c:when test="${login.userid eq null }">
            <a class="dropdown-item" href="/user/login">Login</a>
            <a class="dropdown-item" href="/user/register">Register</a>
           </c:when>
           <c:otherwise>
           <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">Logout</a>
           </c:otherwise>
          </c:choose>
         
          
         <!--  <a class="dropdown-item" href="forgot-password.html">Forgot Password</a> -->
          <div class="dropdown-divider"></div>
          <h6 class="dropdown-header">Other Pages:</h6>
          <!-- <a class="dropdown-item" href="404.html">404 Page</a> -->
         <!--  <a class="dropdown-item" href="calendar/fullcalendar">Calendar</a> -->
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/calendar/fullcalendar">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Calendar</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/board/list">
          <i class="fas fa-fw fa-table"></i>
          <span>Board</span></a>
      </li>
    </ul>

    <div id="content-wrapper">

      <div class="container-fluid">

        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="index.html">Dashboard</a>
          </li>
          <li class="breadcrumb-item active">404 Error</li>
        </ol>

        <!-- Page Content -->
      <div class="box-body">
      <input type="hidden" id="userid" value="${login.userid}">
      <form role="form" method="post">
		<input type="hidden" name="bno" value="${list.bno}">
	</form>
      	<div class="form-group">
      		<label>Title</label>
      		<input type="text" name="title" class="form-control" value="${list.title}" readonly="readonly">
      	</div >
   		<div class="form-group">
      		<label>Contents</label>
      		<textarea name="contents" rows="3" class="form-control" readonly="readonly">${list.contents}</textarea>
      	</div>
      	<div class="form-group">
      		<label>Writer</label>
      		<input type="text" readonly="readonly" name="userid" class="form-control writer" readonly="readonly" value="${list.userid }">
      	</div>
      	<div class="box-footer">
      	<button type="button" class="btn btn-warning modifyBtn" >Modify</button>
      	<button type="button" class="btn btn-danger removeBtn">REMOVE</button>
      	<button type="button" class="btn btn-primary goListBtn">GO LIST</button>
      </div>
      </div>
		<form role="form" action="modifyPage" method="post">
			<input type="hidden" name="bno" value="${list.bno}">
			<input type="hidden" name="page" value="${cri.page}">
			<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
			<input type="hidden" name="searchType" value="${cri.searchType}">
			<input type="hidden" name="keyword" value="${cri.keyword}">
		</form>
      </div>
      <!-- /.container-fluid -->

      <!-- Sticky Footer -->
      <footer class="sticky-footer">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright © Your Website 2019</span>
          </div>
        </div>
      </footer>

    </div>
    <!-- /.content-wrapper -->

  </div>
  <!-- /#wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="/logout">Logout</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="/resources/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="/resources/js/sb-admin.min.js"></script>

</body>

</html>
