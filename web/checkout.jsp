<%-- 
    Document   : checkout
    Created on : Mar 9, 2022, 4:06:07 PM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Colo Shop Product</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="Colo Shop Template">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
        <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
        <link rel="stylesheet" type="text/css" href="plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
        <link rel="stylesheet" type="text/css" href="styles/categories_styles.css">
        <link rel="stylesheet" type="text/css" href="styles/categories_responsive.css">
    
    </head>
    <body>
        <!-- Header -->
	<header class="header trans_300">
		<!-- Top Navigation -->
		

		<!-- Main Navigation -->

		<div class="main_nav_container">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 text-right">
						<div class="logo_container">
							<a href="home">colo<span>shop</span></a>
						</div>
						<nav class="navbar">
							<ul class="navbar_menu">
								<li><a href="home">home</a></li>
								<li><a href="productcontrol">Product</a></li>
								<li><a href="contact.html">contact</a></li>
							</ul>
							<ul class="navbar_user">
								<li><a href="#"><i class="fa fa-search" aria-hidden="true"></i></a></li>
								<li><a href="login"><i class="fa fa-user" aria-hidden="true"></i></a></li>
								<li class="checkout">
									<a href="#">
										<i class="fa fa-shopping-cart" aria-hidden="true"></i>
										<span id="checkout_items" class="checkout_items">${carts.size()}</span>
									</a>
								</li>
							</ul>
							<div class="hamburger_container">
								<i class="fa fa-bars" aria-hidden="true"></i>
							</div>
						</nav>
					</div>
				</div>
			</div>
		</div>

	</header>
        <section class="py-5 px-4 px-lg-5 " style="padding-top:7rem !important">
            <div class="container" style="min-height: 500px">
                <table class="table  table-hover">
                    <c:if test="${sessionScope.carts.size()==0}">
                        <h1>List is Empty</h1>
                    </c:if>
                    <c:if test="${sessionScope.carts.size()!=0}">
                        <thead>
                            <tr>
                                <th scope="col">Product</th>
                                <th scope="col">Image</th>
                                <th scope="col">Name</th>
                                <th scope="col">Price</th>
                                <th scope="col">Quantity</th>
                                <th scope="col">ToTal Price</th>
                                <th scope="col">Action</th>

                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${carts}" var="C">
                            <form action="UpdateCheckout">
                                <tr> 
                                <input type="hidden" name="productid" value="${C.value.product.id}">
                                    <td>${C.value.product.id}</td>
                                    <td><img src="${C.value.product.imageURL}" width="50"></td>
                                    <td>${C.value.product.name}</td>
                                    <td>${C.value.product.price} $</td>
                                    <td><input onchange="this.form.submit()" type="number" value="${C.value.quantity}" name="quantity"></td>
                                    <td>${C.value.product.price*C.value.quantity} $</td>
                                    <td><a class="btn btn-outline-danger" href="DeleteCart?productid=${C.value.product.id}"><i class="bi bi-trash"></i>Delete</a></td>
                                </tr>
                            </form>

                        </c:forEach>

                        </tbody>
                    
                    </c:if>
                </table>
                <h3>TotalMoney: $${Total}</h3>
                <a class="btn btn-success" href="payment" style="border-color: #fe4c50;background-color: #fe4c50">Payment</a>
                
            </div>
        </section>
       <!-- Footer -->

       <footer class="footer" style="background-color: #ccc">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="footer_nav_container d-flex flex-sm-row flex-column align-items-center justify-content-lg-start justify-content-center text-center">
						<ul class="footer_nav">
							<li><a href="#">Blog</a></li>
							<li><a href="#">FAQs</a></li>
							<li><a href="contact.html">Contact us</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="footer_social d-flex flex-row align-items-center justify-content-lg-end justify-content-center">
						<ul>
							<li><a href="https://www.facebook.com/kenjaaaa/" target="_blank"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
							<li><a href="https://github.com/PC" target="_blank"><i class="fa fa-github" aria-hidden="true"></i></a></li>
							<li><a href="https://www.instagram.com/VDZ/" target="_blank"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
							<li><a href="https://www.pinterest.com/nhockanhvd/" target="_blank"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="footer_nav_container">
						<div class="cr">©2020 All Rights Reserverd. Made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://github.com/PC">Đào Phúc Thạch</a> &amp; distributed by <a href="home">ColoShop</a></div>
					</div>
				</div>
			</div>
		</div>
	</footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

        <script src="js/scripts.js"></script>

    </body>
</html>

