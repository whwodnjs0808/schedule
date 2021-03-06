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

  <title>SB Admin - Tables</title>

  <!-- Custom fonts for this template-->
  <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="/resources/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="/resources/css/sb-admin.css" rel="stylesheet">
  <script
  src="https://code.jquery.com/jquery-3.4.1.slim.js"></script>
<script type="text/javascript">
	$(document).ready(
		function(){
			$('#searchBtn').on(
				"click",
				function(event){
					self.location="list"
					+ '${pageMaker.makeQuery(1)}'
					+ "&searchType="
					+ $("select option:selected").val()
					+ "&keyword=" + encodeURIComponent($('#keywordInput').val());
				});
		}		
	)
</script>

<style type="text/css">
.active2{background-color:#17a2b8 !important;}
.row{margin:0 auto !important;}
.box-body{text-align:right; margin:20px 20px 0 0;}
.btn-primary{background-color:#3c8dbc; border-color:#367fa9; float:right;}
</style>
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
            <a href="#">Dashboard</a>
          </li>
          <li class="breadcrumb-item active">Tables</li>
        </ol>

        <!-- DataTables Example -->
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            Data Table Example</div>
            
        <div class="box-body">
   <select name="searchType">
      <option value="n" <c:out value="${cri.searchType == null?'selected':''}"/>>---</option>
      <option value="t" <c:out value="${cri.searchType eq 't'?'selected':''}"/>>Title</option>
      <option value="c" <c:out value="${cri.searchType eq 'c'?'selected':''}"/>>Content</option>
      <option value="w" <c:out value="${cri.searchType eq 'w'?'selected':''}"/>>Writer</option>
      <option value="tc" <c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>Title OR Content</option>
      <option value="cw" <c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>Content OR Writer</option>
      <option value="tcw" <c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>Title OR Content OR Writer</option>
   </select>
   <input type="text" name="keyword" id="keywordInput" value="${cri.keyword}">
   <button id="searchBtn">Search</button>
   <!-- <button id="newBtn">New Board</button> -->
</div>
            
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                    <th>BNO</th>
                    <th>TITLE</th>
                    <th>WRITER</th>
                    <th>REGDATE</th>
                    <th>VIEWCNT</th>
                  </tr>
                </thead>
             <!--    <tfoot>
                  <tr>
                     <th>BNO</th>
                    <th>TITLE</th>
                    <th>WRITER</th>
                    <th>REGDATE</th>
                    <th>VIEWCNT</th>
                  </tr>
                </tfoot>  -->
                <tbody>
                	<c:choose>
                		<c:when test="${list.size()>0 }">
                			<c:forEach var="list" items="${list}">
                				<tr>
                					<td>${list.bno}</td>
                					<td><a href='/board/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${list.bno}'>${list.title}</a></td>
                					<td>${list.userid}</td>
                					<td>${list.regdate}</td>
                					<td>${list.viewcnt}</td>
                				</tr>
                			</c:forEach>
                		</c:when>
                	<c:otherwise>
                	<tr>
                		<td colspan="5">등록된 글이 없습니다.</td>
                	</tr>
                	</c:otherwise>
                	</c:choose>
                </tbody>
              </table>
               <div class="box-footer">
          	<a href="/board/register" class="btn btn-primary">등록</a>
          </div>
            </div>
          </div>
          <div>
         
          </div>
          <!-- paging  -->
      <div class="row">
      <div class="col-sm-12 col-md-7">
      <div class="dataTables_paginate paging_simple_numbers">
      	<ul class="pagination">
      		<c:if test="${pageMaker.prev}">
      			<li class=""><a href="list${pageMaker.makeSearch(pageMaker.startPage-1)}" class="page-link">&laquo;</a></li>
      		</c:if>
      		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
      			<li <c:out value="${pageMaker.cri.page == idx?'class=active2':'' }"/>>
      			<a href="list${pageMaker.makeSearch(idx)}" class="page-link">${idx}</a></li>
      		</c:forEach>
      		<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
      			<li class=""><a href="list${pageMaker.makeSearch(pageMaker.endPage + 1) }" class="page-link">&raquo;</a></li>
      		</c:if>
      	</ul>
      	</div>
      	</div>
      </div>
          
      
        </div>

        <p class="small text-center text-muted my-5">
          <em>More table examples coming soon...</em>
        </p>

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

  <!-- Page level plugin JavaScript-->
 <script src="/resources/vendor/datatables/jquery.dataTables.js"></script>
   <script src="/resources/vendor/datatables/dataTables.bootstrap4.js"></script> 

  <!-- Custom scripts for all pages-->
  <script src="/resources/js/sb-admin.min.js"></script>

  <!-- Demo scripts for this page-->
 <!--   <script src="/resources/js/demo/datatables-demo.js"></script> --> -->

</body>

</html>