<?php
    ob_start();
    session_start();
    require("config.php");
  if(isset($_SESSION['emailUser'])){
    $email =$_SESSION['emailUser'];
    $sqlbs ="select * from tbluser where email='$email'";
    $resultbs = $conn->query($sqlbs);
    if($resultbs->num_rows>0){
      $row= $resultbs->fetch_assoc();
      $_SESSION['username'] = $row['username'];
      $_SESSION['role'] = $row['role'];
    }else{
      unset($_SESSION['token']);
      session_destroy();
     unset($_SESSION['emailUser']);
     unset($_SESSION['role']);
     header("Location: login.php");

    }

  }

?>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Diễn Đàn Sinh Viên TVU</title>
  <link rel="icon" href="images/Logo_Trường_Đại_học_Trà_Vinh.png">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f;
      padding: 25px;
    }
    
  .carousel-inner img {
      width: 100%; /* Set width to 100% */
      margin: auto;
      min-height:200px;
      max-height:300px;
  }

  /* Hide the carousel text when the screen is less than 600 pixels wide */
  @media (max-width: 600px) {
    .carousel-caption {
      display: none; 
    }
  }
  </style>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
<!--
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">Logo</a>
    </div>
-->
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="index.php"><span class="glyphicon glyphicon-home"></span> Trang chủ</a></li>
      
        
        <li><a href="contact.php"><span class="glyphicon glyphicon-envelope"> </span> Liên hệ</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
      <?php
      if(isset($_SESSION["emailUser"])){ // nếu mà người dùng đăng nhập vào thì hiển thị chữ đăng xuất
      ?>
        <li><a href="changepassword.php"><span class="glyphicon glyphicon-pencil"> </span> Đổi mật khẩu</a></li>
        <li><a href="logout.php"><span class="glyphicon glyphicon-log-in"></span> <?php echo "Xin chào (".$_SESSION['emailUser'].")"?> Đăng xuất</a></li>
      
      <?php
      }else{
      ?>
        <li><a href="signup.php"><span class="glyphicon glyphicon-user"></span> Đăng ký</a></li>
       
        <li><a href="login.php"><span class="glyphicon glyphicon-log-in"></span> Đăng nhập</a></li>
        <li><a href="login-with-google/index.php"><span class="glyphicon glyphicon-log-in"></span> Google +</a></li>
      <?php
        }
      ?>
    </ul>
    </div>
  </div>
</nav>
<?php
	$sql="select * from tblslideshow where Status=0"; // câu truy vấn
		
		$rs=$conn->query($sql); // thực thi câu truy vấn
		$sodong=$rs->num_rows; // lấy số dòng trong csdl
		if($sodong>0){
	//	while($r11=$rs11->fetch_assoc()){
?>
<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
	<?php
		for($i=0;$i<$sodong;$i++){
	?>
      <li data-target="#myCarousel" data-slide-to="0" <?php if($i==0){ echo "class='active'"; }?> ></li>
	 <?php
		}
	 ?>
     
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <?php 
	  $j=0;
		while($r=$rs->fetch_assoc()){
	  ?>
	  <div class="item <?php if($j==0) echo 'active';?>">
        <img src="<?php echo $r['ImageUrl'];?>" alt="Image">
        <div class="carousel-caption">
          <h3><?php echo $r['Title'];?></h3>
          <p><?php echo $r['Description'];?></p>
        </div>      
      </div>

      <?php
		$j=1;
		}
	  ?>
	  
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>
<?php
	}
?> 
<div class="container-fluid">
  <br>
  <div class="row">
    <div class="col-sm-3">
    <?php
    if(isset($_SESSION['emailUser']) &&  $_SESSION['role']==1){
    ?>
    <div class="panel panel-primary">
      <div class="panel-heading">Tùy chọn</div>
      <div class="panel-body"><a href="upload.php">Đăng tải tệp trình chiếu</a></div>
      <div class="panel-body"><a href="quanlychude.php">Chủ đề</a></div>
      <div class="panel-body"><a href="quanlycontact.php">Liên hệ</a></div>
    </div>
    <?php
    }
    ?>
    <div class="panel panel-success">
      
      <?php
      $sqlcd ="select * from tblchude where Trangthai=0";
      $resultcd =$conn->query($sqlcd);
      if($resultcd->num_rows>0){
        $sl = $resultcd->num_rows;
      ?>
      <div class="panel-heading">Danh mục chủ đề (<?php echo $sl;?>)</div>
      <?php
        while($r = $resultcd->fetch_assoc()){

        
      ?>
      <div class="panel-body"><a href="baiviet.php?machude=<?php echo $r['Machude'];?>"><?php echo $r['Tenchude'];?></a></div>
      <?php
      }
    }else{
      echo "Chưa có chủ đề";
    }
      ?>
    </div>

    </div>
    <div class="col-sm-9"> 


    