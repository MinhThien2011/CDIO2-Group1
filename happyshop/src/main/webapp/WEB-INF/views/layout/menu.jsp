<%@ page pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>

<style>
	.nav-item {
		width: 130px;
		text-align: center;
		font-weight: bold;
		color: white;
		font-size: 15px;
	}

	.nav-item:hover {
		background-color: #336666;
	}

	.nav-link:hover {
		background-color: #336666;
	}

	.list_danh_muc {
		position: absolute;
		z-index: 1;
		display: none;
		width: 350px;
		padding-left: 70px;
		margin-top: -20px;
	}

	.list-group-item {
		background-color: #F8F8FF;
		border-bottom: 2px solid #EEEEEE;
	}

	.list-group-item:hover {
		color: black;
		font-weight: bold;
	}
</style>

<nav class="navbar navbar-expand-sm navbar-dark" style="margin-top: -20px; background-color: #111111">
	<div class="container-fluid" style="height: 50px; padding: 0px 60px 0px 60px">
		<ul class="navbar-nav" style="margin-right: 450px">
			<li style="width: 280px; font-size: 18px; border-right: 1px solid gray;">
				<a class="nav-link" style="cursor: pointer; font-weight: bold; color: white;" data-toggle="collapse" href="#chungloai">
					<i class="fa fa-navicon"></i>&nbsp;&nbsp; <span class="danh_muc">DANH MỤC SẢN PHẨM</span>
				</a>
			</li>
			<li class="nav-item" style="margin-left: 12px"><a class="nav-link" style="color: white;" href="/">TRANG CHỦ</a></li>
			<li class="nav-item"><a class="nav-link" style="color: white;" href="/about">GIỚI THIỆU</a></li>
			<li class="nav-item"><a class="nav-link" style="color: white;" href="/contact">LIÊN HỆ</a></li>
			<li class="nav-item"><a class="nav-link" style="color: white;" href="/feedback">PHẢN HỒI</a></li>
			<li class="nav-item"><a class="nav-link" style="color: white;" href="/faq">HỎI ĐÁP</a></li>
			<!-- Dropdown -->
			<li class="nav-item dropdown"><a style="color: white;" class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">TÀI KHOẢN</a>
				<c:choose>
					<c:when test="${empty sessionScope.user}">
						<ul class="dropdown-menu" style="font-size: 14px;">
							<li><a href="/account/login">Đăng nhập</a></li>
							<li><a href="/account/register">Đăng ký</a></li>
							<li><a href="/account/forgot">Quên mật khẩu?</a></li>
						</ul>
					</c:when>
					<c:otherwise>
						<ul class="dropdown-menu" style="background-color: #FFF">
							<li style="border-bottom: 2px solid #EEEEEE;"><a href="/account/logout">Đăng xuất</a></li>
							<li style="border-bottom: 2px solid #EEEEEE;"><a href="/account/change">Thay đổi mật khẩu</a></li>
							<li style="border-bottom: 2px solid #EEEEEE;"><a href="/account/edit">Cập nhật thông tin cá nhân</a></li>
							<li style="border-bottom: 2px solid #EEEEEE;"><a href="/order/list">Lịch sử đơn hàng</a></li>
							<li><a href="/order/items">Danh sách sản phẩm đã mua</a></li>
						</ul>
					</c:otherwise>
				</c:choose>
			</li>
		</ul>
	</div>
</nav>

<div class="list_danh_muc" id="chungloai" style=" font-size: 14px;">  
	<c:forEach var="c" items="${cates}">
		<a class="list-group-item" href="/product/list-by-categorys/${c.id}">
			<img src="/static/images/icon/4.png" /> ${c.nameVN}
		</a>
	</c:forEach>
</div>

