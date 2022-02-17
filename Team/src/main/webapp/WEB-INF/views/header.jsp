<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>

        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="/team/home">Human Hotel</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                         <c:if test="${type ==0}"><a class="nav-link" href="/team/admin">Booking</a></c:if>
						 <c:if test="${type ==1}"><a class="nav-link" href="/team/bookcheck">Booking</a></c:if>
						 <c:if test="${type ==2}"><a class="nav-link" id=close href="/team/bookcheck">Booking</a></c:if>
                        
                        </li>
                        <li class="nav-item"><a class="nav-link" href="/team/notice" style="text-decoration:none">Notice</a></li>
                        <li class="nav-item"><a class="nav-link" href="/team/FAQ" style="text-decoration:none">FAQ</a></li>
                        <li class="nav-item"><a class="nav-link" href="/team/map" style="text-decoration:none">Map</a></li>
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
</html>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(document)
.on('click','#close',function(){
   alert('로그인 후 이용이 가능 합니다.');
   return false;
})
</script>