<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
        
<title>Human Hotel</title>

<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="resources/assets/favicon.ico" />
<link rel="icon" type="image/x-icon" href="resources/assets1/favicon.ico" />
<!-- Simple line icons-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.5.5/css/simple-line-icons.min.css" rel="stylesheet" />
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/styles.css"/>
</head>
<style>
#roomsize {
height: 400px;
}
</style>
<body>
<!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="#page-top">Human Hotel</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item"><a class="nav-link" href="#about">About</a></li>
                        <li class="nav-item"><a class="nav-link" href="/team/map" style="text-decoration:none">Map</a></li>
                        <li class="nav-item"><a class="nav-link" href="#booking">Booking</a></li>
                        <li class="nav-item"><a class="nav-link" href="#signup">Contact</a></li>
                        <li class="nav-item"><a class="nav-link" href="/team/notice" style="text-decoration:none">Notice</a></li>
                        <li class="nav-item"><a class="nav-link" href="/team/FAQ" style="text-decoration:none">FAQ</a></li>
                        <c:if test="${userid =='null' }">
                        	<li class="nav-item"><a class="nav-link" href='/team/login'>Login</a></li>
                        	<li class="nav-item"><a class="nav-link" href='/team/register'>Sign Up</a></li>
                        </c:if>
                        <c:if test="${userid !='null' }">
                        <div class="dropdown">
                                 <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                 ${userid}
  						 		 </a>
  						<ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
                        	<li class="nav-item"><a class="dropdown-item"  href='/team/logout_update' id=logout>Logout</a><li>
                        	<li class="nav-item"><a class="dropdown-item" href='/team/viewquit'>Memberquit</a></li>
                        	<li class="nav-item"><a class="dropdown-item" href='/team/trackbk'>trackBooking</a></li>
                        	</ul>
                        </div>
                        </c:if>
                    </ul>
                </div>
            </div>
            
        </nav>
        <!-- Masthead-->
        <header class="masthead">
            <div class="container px-4 px-lg-5 d-flex h-100 align-items-center justify-content-center">
                <div class="d-flex justify-content-center">
                    <div class="text-center">
                        <h1 class="mx-auto my-0 text-uppercase">Grand Open</h1><br>
                        <h2 class="text-white-50 mx-auto mt-2 mb-5">Welcome to our New Human Hotel</h2>
                    </div>
                </div>
            </div>
        </header>
        <!-- About-->
        <section class="about-section text-center" id="about">
            <div class="container px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-lg-8">
                        <h2 class="text-white mb-4">Human Hotel</h2>
                        <p class="text-white-50">
                            국내 최초! <br> 해수욕장과 놀이동산을 겸비한 최고급 호텔!<br>
                            <a href="http://www.human.or.kr/">휴먼 호텔입니다.</a><br>
                            실시간 상담 가능 ~ 예약 바랍니다!
                        </p>
                    </div>
                </div>
                <img class="img-fluid" src="https://cdn.pixabay.com/photo/2018/08/14/11/03/acapulco-3605307_960_720.jpg" alt="..." />
            </div>
         </section>
         
<!-- Portfolio-->
<br><br>
        <section class="content-section" id="booking">
            <div class="container px-4 px-lg-5">
                <div class="content-section-heading text-center">
                    <h3 class="text-secondary mb-0">Booking</h3>
                    <h2 class="mb-5">Book Information</h2>
                </div>
                <div class="row gx-0">
                    <div class="col-lg-6">
                        <a class="portfolio-item" href="/team/Room1">
                            <div class="caption">
                                <div class="caption-content">
                                    <div class="h2">Standard Room</div>
                                </div>
                            </div>
                            <img id=roomsize class="img-fluid" src="https://cdna.artstation.com/p/assets/images/images/014/081/626/large/berktan-hatiboglu-modern-render1.jpg?1542377257" alt="..." />
                        </a>
                    </div>
                    <div class="col-lg-6">
                        <a class="portfolio-item" href="/team/Room2">
                            <div class="caption">
                                <div class="caption-content">
                                    <div class="h2">Business Room</div>
                                </div>
                            </div>
                            <img id=roomsize class="img-fluid" src="https://cdnb.artstation.com/p/assets/images/images/014/081/609/large/berktan-hatiboglu-american-render1.jpg?1542377151" alt="..." />
                        </a>
                    </div>
                    <div class="col-lg-6">
                        <a class="portfolio-item" href="/team/Room3">
                            <div class="caption">
                                <div class="caption-content">
                                    <div class="h2">Suite Room</div>
                                </div>
                            </div>
                            <img class="img-fluid" id=roomsize src="https://cdnb.artstation.com/p/assets/images/images/011/879/705/large/berktan-hatiboglu-albarella-sahne.jpg?1531902169" alt="..." />
                        </a>
                    </div>
                    <div class="col-lg-6">
                        <a class="portfolio-item" href="/team/Room4">
                            <div class="caption">
                                <div class="caption-content">
                                    <div class="h2">Hollywood Room</div>
                                </div>
                            </div>
                            <img class="img-fluid" id=roomsize src="https://cdna.artstation.com/p/assets/images/images/011/616/862/large/berktan-hatiboglu-vidor-yatak1.jpg?1530516817" alt="..." />
                        </a>
                    </div>
                </div><br>
                <c:if test="${type ==0}"><a class="btn btn-primary" href="/team/admin" style="text-decoration:none">Go Admin Booking</a></c:if>
				<c:if test="${type ==1}"><a class="btn btn-primary" href="/team/bookcheck" style="text-decoration:none">Go Booking</a></c:if>
				<c:if test="${type ==2}"><a class="btn btn-primary" href="/team/bookcheck" id=close style="text-decoration:none">Go Booking</a></c:if>
            </div><br><br>
        </section>
        <section class="contact-section bg-black" id=signup>
        <jsp:include page="footer.jsp"/>
        </section>
        <!-- Footer-->
        <footer class="footer bg-black small text-center text-white-50"><div class="container px-4 px-lg-5">Copyright &copy; Your Website 2021</div></footer>
        
    </body>
    <!-- Core theme JS-->
	<script src="<c:url value='/resources/js/scripts.js' />"></script>
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<!-- * *                               SB Forms JS                               * *-->
	<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(document)
.on('click','#close',function(){
   alert('로그인 후 이용이 가능 합니다.');
   return false;
})
.on('click','#info',function(){
	
})
</script>
</html>

