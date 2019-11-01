<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />


<!-- fullcalendar -->
<link href='/assets/demo-to-codepen.css' rel='stylesheet' />

<link href='https://unpkg.com/fullcalendar@3.10.1/dist/fullcalendar.min.css' rel='stylesheet' />
<link href='https://unpkg.com/fullcalendar@3.10.1/dist/fullcalendar.print.css' rel='stylesheet' media='print' />



<script src='https://unpkg.com/moment@2.24.0/min/moment.min.js'></script>
<script src='https://unpkg.com/jquery@3.4.1/dist/jquery.min.js'></script>
<script src='https://unpkg.com/fullcalendar@3.10.1/dist/fullcalendar.min.js'></script>

<script src='/assets/demo-to-codepen.js'></script>

<!-- main css -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

 <!-- Custom fonts for this template-->
  <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

<!--   Page level plugin CSS -->
  <link href="/resources/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

<!--   Custom styles for this template -->
  <link href="/resources/css/sb-admin.css" rel="stylesheet"> 

  <script type="text/javascript">
//   <fmt:formatDate value="${citem.start}" pattern="yyyy-MM-dd"/>
$(document).ready(function(){
// 	var id = '${sessionScope.login.userid}';
// var pid = '${list.pid}';

	 var dataset = [
	
		    <c:forEach var="citem" items="${list}">
		          {
		        	 pid:'<c:out value="${citem.pid}"/>',
		             id:'<c:out value="${citem.userid}" />',
		             title:'<c:out value="${citem.title}" />',
		             start: '<c:out value="${citem.start}"/>',
		             end:'<c:out value="${citem.start}"/>',
		          },
		    </c:forEach>
		]; 
	  $('#external-events div.external-event').each(function() {

			// create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
			// it doesn't need to have a start or end
			var eventObject = {
				title: $.trim($(this).text()) // use the element's text as the event title
			};

			// store the Event Object in the DOM element so we can get to it later
			$(this).data('eventObject', eventObject);

			// make the event draggable using jQuery UI
			$(this).draggable({
				zIndex: 999,
				revert: true,      // will cause the event to go back to its
				revertDuration: 0  //  original position after the drag
			});
		}); 
	  $(function(){
		  $('#calendar').fullCalendar({
		    	 selectable: true,
		         header: {
		           left: 'prev,next today',
		           center: 'title',
		           right: 'month,agendaWeek,agendaDay'
		         },
		         events: dataset,
		         eventClick : function removeCheck(){
		        	  var pid= "21";
		        	 console.log(pid);
		        	 if(confirm("삭제하시겠습니까?") == true){
		        		 $.ajax("/calendar/delete",{
		        			method:"get",
		        			data:dataset,
		        			success:function(result){
		        				if(result==1)
		        					alert("삭제되었습니다.");
		        				location.reload();
		        			}
		        		 });
		        	 }else{
		        		 return false;
		        	 }
		         },
		       
		         select : function(start, end, allDay) {
				        var startDate = moment(start).format('YYYY-MM-DD');
				        var endDate = moment(end).format('YYYY-MM-DD');
			         	var title = prompt('Event Title:');
						var id = '${sessionScope.login.userid}';
						
						console.log(id);
						console.log(title);
						console.log(startDate);
						console.log(endDate);
						console.log(pid);
					
						if (title) {
					/* ajax */
							$.ajax("/calendar/add",{
								method: "POST",
								data : {
									title: title,
								 	start : startDate,
									end : endDate,
									userid : id
								},
								success:function(result){
									console.log(result);
									if(result==1)
									alert("저장되었습니다.");
									location.reload();
								},
								error : function(error){
									alert("에러입니다");
								}
							});
						}
				}	
});
	  });
			 
});
</script>
<style>
/* 	body {
		margin-top: 40px;
		text-align: center;
		font-size: 14px;
		font-family: "Helvetica Nueue",Arial,Verdana,sans-serif;
		background-color: #DDDDDD;
		}

	#wrap {
		width: 1100px;
		margin: 0 auto;
		}
 */
	#external-events {
		float: left;
		width: 150px;
		padding: 0 10px;
		text-align: left;
		}

	#external-events h4 {
		font-size: 16px;
		margin-top: 0;
		padding-top: 1em;
		}

	.external-event { /* try to mimick the look of a real event */
		margin: 10px 0;
		padding: 2px 4px;
		background: #3366CC;
		color: #fff;
		font-size: .85em;
		cursor: pointer;
		}

	#external-events p {
		margin: 1.5em 0;
		font-size: 11px;
		color: #666;
		}

	#external-events p input {
		margin: 0;
		vertical-align: middle;
		}

	#calendar {
/* 		float: right; */
        margin: 0 auto;
		width: 900px;
		background-color: #FFFFFF;
		  border-radius: 6px;
        box-shadow: 0 1px 2px #C3C3C3;
		}
.fc-content{margin-bottom:10px;}
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
            <a href="/">Dashboard</a>
          </li>
          <li class="breadcrumb-item active">Calendar</li>
        </ol>

        <!-- Page Content -->

  <div id='calendar'></div>
<input type="text" name="pid" value="${list.pid}">
<input type="hidden" name="userid" value="${login.userid}" id="useridAjax"> 
<%-- <input type="hidden" name="calendarList" value="${list.contents}"> --%>

<div>
	<c:choose>
		<c:when test="${list.size() > 0 }">
			<c:forEach var="list" items="${list}">
				<span>${list.pid }</span>
			</c:forEach>
		</c:when>
	</c:choose>
</div>

<!-- 
<button type="button" id="save">저장</button> -->
</div>

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

<!--   </div> -->
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
 <!--  <script src="/resources/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->

  <!-- Core plugin JavaScript-->
  <!-- <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
 -->
  <!-- Custom scripts for all pages-->
 <!--  <script src="/resources/js/sb-admin.min.js"></script> -->

</body>
</html>