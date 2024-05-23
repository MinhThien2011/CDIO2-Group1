<%@ page pageEncoding="utf-8" %>
	<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
		<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
			<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
				<html lang="en">
				<meta charset="UTF-8">
				<meta name="viewport" content="width=device-width, initial-scale=1.0">
				<title>Bootstrap Carousel Example</title>
				<!-- Bootstrap CSS -->
				<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
				<c:set var="cart" value="${sessionScope['scopedTarget.cartService']}" />


				<div class="container-fluid">
					<div class="row">
						<div class="col">
							<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
								<ol class="carousel-indicators" style="left: 65px;">
									<li data-target="#carouselExampleIndicators" data-slide-to="0" class
										style="height: 1px; width: 2px"></li>
									<li data-target="#carouselExampleIndicators" data-slide-to="1" class
										style="height: 1px; width: 2px "></li>
									<li data-target="#carouselExampleIndicators" data-slide-to="2" class
										style="height: 1px; width: 2px"></li>
								</ol>
								<div class="carousel-inner" style="border-radius: 15px;border: 2px solid #000">
									<div class="carousel-item active">
										<img src="/static/images/slideshow/slide1.jpg" class="d-block w-100"
											alt="Slide 1">
									</div>
									<div class="carousel-item">
										<img src="/static/images/slideshow/slide2.jpg" class="d-block w-100"
											alt="Slide 2">
									</div>
									<div class="carousel-item">
										<img src="/static/images/slideshow/slide3.jpg" class="d-block w-100"
											alt="Slide 3">
									</div>
								</div>
								<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button"
									data-slide="prev">
									<span class="carousel-control-prev-icon" aria-hidden="true"></span>
									<span class="sr-only">Previous</span>
								</a>
								<a class="carousel-control-next" href="#carouselExampleIndicators" role="button"
									data-slide="next">
									<span class="carousel-control-next-icon" aria-hidden="true"></span>
									<span class="sr-only">Next</span>
								</a>
							</div>
						</div>
					</div>
				</div>

				<!-- Slide image -->
				<br>
				<!-- <img src="https://hoanghamobile.com/Uploads/Originals/2020/12/17/202012170853475657_345.gif" alt=""
					width="100%"> -->
				<br>

				<!-- jQuery, Popper.js, Bootstrap JS -->
				<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
				<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
				<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
				<!-- Sản phẩm nổi bật -->
				<div class="gia-soc" style="margin-top: -5px; height: 495px; border-radius: 15px; overflow: hidden">
					<div
						style="background-color: rgb(206, 18, 18); width: 100.1%; margin-left: -1px; height: 65px; margin-top: -10px; font-weight: bold; padding: 13px">
						<span style="color: #fff; text-align: left; font-size: 26px;">SẢN PHẨM NỔI BẬT</span>
						<span style="color: #fff; float: right; font-size: 16px; padding: 8px">
							<a href="/product/list-by-special/4" style="color: #fff; text-decoration: none;"> Xem tất cả</a></span>
					</div>


					<div style="padding: 20px 0px 0px 10px; margin-top: -10px; height: 420px">
						<jsp:include page="../product/list_special.jsp" />
					</div>
				</div>


				<br>
				<img src="/static/images/banner2.png" width="100%" style="border-radius: 10px;" />

				<!-- Sản phẩm mới nhất -->
				<div class="gia-soc" style="margin-top: 20px; border-radius: 15px; overflow: hidden;">
					<div
						style="background-color: rgb(206, 18, 18); width: 100%; height: 65px; margin-top: -10px; font-weight: bold; padding: 13px">
						<span style="color: #fff; text-align: left; font-size: 26px;">SẢN PHẨM MỚI NHẤT</span>
						<span style="color: #fff; float: right; font-size: 16px; padding: 8px;">
							<a href="/product/list-by-new/0" style="color: #fff; text-decoration: none;"> Xem tất
								cả</a></span>
					</div>
					<div class="row" style="padding: 20px; margin-top: -10px; height: 840px">
						<jsp:include page="../product/list-by-new.jsp" />
					</div>
				</div>
				<br />



				<style>
					/* General Reset and Base Styles */
					html,
					body,
					.container,
					.main {
						height: 100%;
					}

					/* Font Face Declaration */
					@font-face {
						font-family: 'icomoon';
						src: url('../fonts/icomoon.eot');
						src: url('../fonts/icomoon.eot?#iefix') format('embedded-opentype'),
							url('../fonts/icomoon.svg#icomoon') format('svg'),
							url('../fonts/icomoon.woff') format('woff'),
							url('../fonts/icomoon.ttf') format('truetype');
						font-weight: normal;
						font-style: normal;
					}

					/* Carousel Styles */
					/* Indicators */
					.carousel-indicators li {
						height: 5px;
						width: 2px;
						background-color: #000;
						/* Adjust as needed */
					}

					/* Control Buttons */
					.carousel-control-prev,
					.carousel-control-next {
						width: auto;
						top: 50%;
						transform: translateY(-50%);
					}

					.carousel-control-prev {
						left: 10px;
					}

					.carousel-control-next {
						right: 10px;
					}

					/* Change Button */
					.btn-change {
						width: 30px;
						height: 30px;
						position: absolute;
						margin-top: -250px;
						transform: translateY(-100%);
					}

					/* Content Slider */
					/* Container */
					.cbp-contentslider {
						width: 100%;
						height: 100%;
						margin: 1em auto;
						position: relative;
						border: 1px solid rgb(214, 214, 214);
					}

					/* Unordered List */
					.cbp-contentslider>ul {
						list-style: none;
						height: 85%;
						width: 100%;
						overflow: hidden;
						position: relative;
						padding: 0;
						margin: 0;
					}

					/* List Items */
					.cbp-contentslider>ul li {
						position: absolute;
						width: 100%;
						height: 100%;
						left: 0;
						top: 0;
						background: #fff;
					}

					/* Active Slide */
					.cbp-contentslider>ul li:target {
						z-index: 100;
					}

					/* Navigation */
					.cbp-contentslider nav {
						position: absolute;
						bottom: 0;
						left: 0;
						right: 0;
						height: 3.313em;
						z-index: 1000;
						border-top: 1px solid rgb(243, 239, 233);
						overflow: hidden;
					}

					/* Navigation Buttons */
					.cbp-contentslider nav button {
						float: left;
						display: block;
						width: 20%;
						height: 100%;
						font-weight: 400;
						letter-spacing: 0.1em;
						overflow: hidden;
						color: #47a3da;
						background: rgb(255, 255, 255);
						outline: none;
						text-align: center;
						line-height: 3;
						position: relative;
						padding-left: 3.125em;
						text-transform: uppercase;
						transition: color 0.2s ease-in-out, background-color 0.2s ease-in-out;
					}

					/* Navigation Button Span */
					.cbp-contentslider nav button span {
						display: block;
					}

					/* Last Button */
					.cbp-contentslider nav button:last-child {
						border: none;
						box-shadow: 1px 0 #47a3da;
						/* fills gap caused by rounding */
					}

					/* Hover State */
					.cbp-contentslider nav button:hover {
						text-decoration: none;
						border-bottom: 4px solid #47a3da;
					}

					/* Active State */
					.cbp-contentslider nav button.rc-active {
						background-color: #47a3da;
						color: #fff;
					}

					/* Iconfont for Navigation and Headings */
					.cbp-contentslider [class^="icon-"]:before,
					.cbp-contentslider [class*=" icon-"]:before {
						font-family: 'icomoon';
						font-style: normal;
						text-align: center;
						speak: none;
						font-weight: normal;
						line-height: 2.5;
						font-size: 2em;
						position: absolute;
						left: 10%;
						top: 50%;
						margin: -1.250em 0 0 0;
						height: 2.500em;
						width: 2.500em;
						color: rgba(0, 0, 0, 0.1);
						-webkit-font-smoothing: antialiased;
					}

					/* Media Queries */
					/* Adjust font size for large screens */
					@media screen and (max-width: 70em) {
						.cbp-contentslider p {
							font-size: 100%;
						}
					}

					/* Adjust font size and hide button spans for medium screens */
					@media screen and (max-width: 67.75em) {
						.cbp-contentslider {
							font-size: 85%;
						}

						.cbp-contentslider nav button span {
							display: none;
						}
					}

					/* Adjust layout for small screens */
					@media screen and (max-width: 43em) {
						.cbp-contentslider h3 {
							font-size: 2em;
						}

						.cbp-contentslider .cbp-content {
							column-count: 1;
						}

						.cbp-contentslider li>div {
							top: 5em;
						}
					}

					/* Adjust padding and hide icons for very small screens */
					@media screen and (max-width: 25em) {
						.cbp-contentslider nav button {
							padding: 0;
						}

						.cbp-contentslider h3[class^="icon-"]:before,
						.cbp-contentslider h3[class*=" icon-"]:before {
							display: none;
						}
					}
				</style>
