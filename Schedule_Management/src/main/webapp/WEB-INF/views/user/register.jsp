<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin - Register</title>

  <!-- Custom fonts for this template-->
  <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
  <!-- Custom styles for this template-->
  <link href="/resources/css/sb-admin.css" rel="stylesheet">
	<script>
		$("#userid").blur(function(){
			var userid = $("#userid").val();
			$.ajax({
				url : '${pageContext.request.contextPath}/user/idCheck?userid='+userid,
				type : 'get',
				success:function(data){
					console.log("1 = 중복o / 0 = 중복x : " +data);
					if(data == 1){
						$("#id_check").text("사용중인 아이디입니다.");
						$("#id_check").css("color","red");
						//$("#id_check").attr("disabled",true);
					}
				},error:function(){
					console.log("실패");
				}
			});
		});
	</script>
</head>

<body class="bg-dark">

  <div class="container">
    <div class="card card-register mx-auto mt-5">
      <div class="card-header">Register an Account</div>
      <div class="card-body">
        <form action="register" method="post">
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="userid" class="form-control" placeholder="USERID" required="required" name="userid">
                  <label for="userid">USERID</label>
                   <div class="check_font" id="id_check"></div>
                </div>
              </div>
            </div>
          </div>
        
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="password" id="password" class="form-control" placeholder="Password" name="password" required="required">
                  <label for="password">Password</label>
                </div>
              </div>
             <!--  <div class="col-md-6">
                <div class="form-label-group">
                  <input type="password" id="confirmPassword" class="form-control" placeholder="Confirm password" required="required">
                  <label for="confirmPassword">Confirm password</label>
                </div>
              </div> -->
            </div>
          </div>
          <button type="submit" class="btn btn-primary btn-block" >Register</button>
        </form>
        <div class="text-center">
          <a class="d-block small mt-3" href="/user/login">Login Page</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="/resources/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

</body>

</html>